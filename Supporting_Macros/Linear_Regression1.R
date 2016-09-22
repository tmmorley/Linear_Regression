#' ---
#' title: Logistic Regression
#' author: Dan Putler, Bridget Toomey, Ramnath Vaidyanathan
#' output:
#'   html_document:
#'     toc: true
#'     toc_depth: 4
#' ---
#' Load Libraries 
library(car)

#' ### Read Inputs and Configuration
#' #### Configuration
#' 
#' 
## DO NOT MODIFY: Auto Inserted by AlteryxRhelper ----
suppressWarnings(library(AlteryxPredictive))
config <- list(
  `graph.resolution` = dropdownInput('%Question.graph.resolution%' , '1x'),
  `model.name` = textInput('%Question.Model Name%'),
  `Omit Constant` = checkboxInput('%Question.Omit Constant%' , FALSE),
  `used.weights` = checkboxInput('%Question.Use Weights%' , FALSE),
  `Weight Vec` = dropdownInput('%Question.Weight Vec%'),
  `X Vars` = listInput('%Question.X Vars%', names(mtcars)[-1]),
  `Y Var` = dropdownInput('%Question.Y Var%', 'mpg')
)
options(alteryx.wd = '%Engine.WorkflowDirectory%')
options(alteryx.debug = config$debug)
##----

config$model.name = validName(config$model.name)

#' #### Inputs
#' 
#' This is a named list of all inputs that stream into the R tool.
#' We also specify defaults for use when R code is run outside Alteryx.
defaults <- list(
  data = mtcars
)
inputs <- list(
  the.data = read.Alteryx2("#1", default = defaults$data)
)

#' ### Define Helper Functions
#' 
#' 
#' #### Process Inputs
#' 
#' These two function take `inputs` and `config` and return the model object
#' along with other elements essential to create the reports and plots
#' 
#' __Process inputs for Open Source R__
processOSR <- function(inputs, config){
  var_names <- getNamesFromOrdered(names(inputs$the.data), config$used.weights)
  the.formula <- if (config$`Omit Constant`){
    makeFormula(c("-1", var_names$x), var_names$y) 
  } else {
    makeFormula(var_names$x, var_names$y)
  }
  # FIXME: Revisit what we pass to the weights argument.
  if (config$used.weight){
    lm(the.formula, inputs$the.data, weights = inputs$the.data[[var_names$w]])
  } else {
    lm(the.formula, inputs$the.data)
  }
}

processXDF <- function(inputs, config){
  temp.dir <- '%Engine.TempFilePath%'
  xdf.path = XDFInfo$xdf_path
  var_names <- getNamesFromOrdered(names(inputs$the.data), config$used.weights)
  the.formula = if (config$`Omit Constant`){
    makeFormula(c("-1", var_names$x), var_names$y) 
  } else {
    makeFormula(var_names$x, var_names$y)
  }
  the.model <- rxLinMod(the.formula, XDFInfo$xdf_path, pweights = var_names$w,
    covCoef = TRUE, dropFirst = TRUE)
  
  # Add the level labels for factor predictors to use in model scoring, and
  # determine if the smearing estimator adjustment should be calculated for
  # scoring option value.
  the.model$xlevels <- getXdfLevels(makeFormula(var_names$x), xdf.path)
  sum.info <- rxSummary(makeFormula(var_names$y, ""), xdf.path)
  # See if it is possible that the maximum target value is consistent with the
  # use of a natural log transformation, and construct the smearing adjust if
  # it is.
  if (sum.info$sDataFrame[1,5] <= 709) {
    resids.path <- file.path(temp.dir, paste0(ceiling(100000*runif(1)), '.xdf'))
    rxPredict(the.model, data = xdf.path, outData = resids.path, 
      computeResiduals = TRUE, predVarNames = "Pred", residVarNames = "Resid")
    resids.df <- rxReadXdf(file = resids.path)
    smear <- rxSummary(~ Resid, data = resids.path, 
      transforms = list(Resid = exp(Resid)))
    the.model$smearing.adj <- smear$sDataFrame[1,2]
  }
  return(the.model)
}

#' #### Create Reports
#' 
#' If the ANOVA table is requested then create it and add its results to the
#' key-value table. Its creation will be surpressed if the car package isn't
#' present, or if the input is an XDF file. 
createReportOSR <- function(the.model, config){
  lm.out <- Alteryx.ReportLM(the.model)
  lm.out <- rbind(c("Model_Name", config$model.name), lm.out)
  lm.out <- rbind(lm.out, Alteryx.ReportAnova(the.model))
  lm.out
}

createReportXDF <- function(the.model, config){
  AlteryxMessage2("Creation of the Analysis of Variance table was surpressed due to the use of an XDF file", iType = 2, iPriority = 3) 
  lm.out <- AlteryxReportRx(the.model)
  lm.out <- rbind(c("Model_Name", config$model.name), lm.out)
  lm.out
}


#' #### Create Plots
#' 
#' Prepare the basic regression diagnostic plots if it is requested
#' and their isn't the combination of singularities and the use of
#' sampling weights.
#' 
#' __Plots in Open Source R__
createPlotOutputsOSR <- function(the.model){
  #whr <- graphWHR(inches = "True", in.w = 6, in.h = 6, config$resolution)
  whr <- AlteryxPredictive:::graphWHR2(inches = TRUE, in.w = 6, in.h = 6, 
    config$graph.resolution)
  AlteryxGraph2({
      par(mfrow=c(2, 2), mar=c(5, 4, 2, 2) + 0.1)
      plot(the.model)
    }, 2, width = whr[1], height = whr[2], res = whr[3], pointsize = 9
  )
}

createPlotOutputsXDF <- function(nOutput = 2){
  noDiagnosticPlot("The diagnostic plot is not available for XDF based models",
    nOutput = nOutput)
}


#' Function to create empty plot with a message
noDiagnosticPlot <- function(msg, nOutput = 2){
  AlteryxGraph2({
    plot(x = c(0,1), y = c(0,1), type = "n", main = "Plot not available", 
      xlab = "", ylab = "", xaxt = "n", yaxt = "n")
  }, nOutput)
  AlteryxMessage2(msg, iType = 2, iPriority = 3)  
}

#' ### Run and Create Outputs
XDFInfo <- if (inAlteryx()) getXdfProperties("#1") else list(is_XDF = FALSE)
if (XDFInfo$is_XDF){
  the.model <- processXDF(inputs, config)
  lm.out <- createReportXDF(the.model, config)
  createPlotOutputsXDF()
} else {
  the.model <- processOSR(inputs, config)
  lm.out <- createReportOSR(the.model, config)
  createPlotOutputsOSR(the.model)
}

# Report
write.Alteryx2(lm.out, nOutput = 1)

# Model Object
the.obj <- prepModelForOutput(config$model.name, the.model)
write.Alteryx2(the.obj, nOutput = 3)
