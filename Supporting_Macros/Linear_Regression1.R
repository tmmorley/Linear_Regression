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
  `used.weights` = checkboxInput('%Question.Use Weights%' , FALSE),
  `Weight Vec` = dropdownInput('%Question.Weight Vec%'),
  `X Vars` = listInput('%Question.X Vars%', names(mtcars)[-1]),
  `Y Var` = dropdownInput('%Question.Y Var%', 'mpg')
)
options(alteryx.wd = '%Engine.WorkflowDirectory%')
options(alteryx.debug = config$debug)
##----

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

#########
# The core portion of the macro
# The path to the Alteryx temporary directory
temp.dir <- scan(what = character(), nmax = 1)
%Engine.TempFilePath%
# Determine if a compute context is being used, and whether it is XDF
is.XDF <- FALSE 
meta.data <- read.AlteryxMetaInfo("#1")
the.source <- as.character(meta.data$Source)
if (all(substr(the.source, 3, 9) == "Context")) {
	library(rjson)
	meta.list <- fromJSON(the.source[1])
	if (meta.list$Context == "XDF") {
		is.XDF <- TRUE
		xdf.path <- meta.list$File.Loc
	} else {
		stop.Alteryx("At this time only XDF scaling is supported")
	}
}
# Read the data stream into R
the.data <- read.Alteryx("#1")
# Get the field names
name.y.var <- names(the.data)[1]
names.x.vars <- names(the.data)[-1]
# Boolean if weights are used
used.weights <- '%Question.Use Weights%' == "True"
# Adjust the set of field names to remove the weight field if weights are used
if (used.weights) {
	use.probs <- '%Question.samp.probs%' == "True"
	the.weights <- names.x.vars[length(names.x.vars)]
	names.x.vars <- names.x.vars[1:(length(names.x.vars) - 1)]
	if (!is.XDF) {
		weight.arg <- paste(", weights =", the.weights)
	} else {
		weight.arg <- paste(', pweights = "', the.weights, '"', sep = "")
	}
}
# Make sure that the target variable is not included in the set of
# predictor variables. If it is, then remove it from the set.
if (name.y.var %in% names.x.vars)
	names.x.vars <- names.x.vars[names.x.vars != name.y.var]
# Create the base right-hand side of the formula
x.vars <- paste(names.x.vars, collapse = " + ")
# Obtain and prep other user inputs
model.name <- '%Question.Model Name%'
model.name <- validName(model.name)
no.constant <- '%Question.Omit Constant%'
if(no.constant == "True") {
  the.formula <- paste(name.y.var, '~ -1 + ', x.vars)
} else {
  the.formula <- paste(name.y.var, '~', x.vars)
}
# The model call
if (!is.XDF) {
	model.call <- paste(model.name, ' <- lm(', the.formula, ', data = the.data', sep="")
} else {
	model.call <- paste(model.name, ' <- rxLinMod(', the.formula, ', data = "', xdf.path, '", covCoef = TRUE, dropFirst = TRUE', sep="")
}
# If the user has specified weighted least squares, add the weights to the call
if(used.weights) {
	model.call <- paste(model.call, weight.arg, ')', sep="")
} else {
	model.call <- paste(model.call, ')', sep="")
}
# Model estimation
eval(parse(text = model.call))
the.model <- eval(parse(text = model.name))
# Add the level labels for factor predictors to use in model scoring, and
# determine if the smearing estimator adjustment should be calculated for
# scoring option value.
if (is.XDF) {
	the.model$xlevels <- eval(parse(text = paste("xdfLevels(~ ", x.vars, ", xdf.path)")))
	sum.info <- eval(parse(text = paste("rxSummary(~ ", name.y.var, ", data = xdf.path)", sep = "")))
	# See if it is possible that the maximum target value is consistent with the
	# use of a natural log transformation, and construct the smearing adjust if
	# it is.
	if (sum.info$sDataFrame[1,5] <= 709) {
		resids.path <- paste(temp.dir, "\\resids", ceiling(100000*runif(1)), ".xdf", sep = "")
		rxPredict(the.model, data = xdf.path, outData = resids.path, computeResiduals = TRUE, predVarNames = "Pred", residVarNames = "Resid")
		resids.df <- rxReadXdf(file = resids.path)
		smear <- rxSummary(~ Resid, data = resids.path, transforms = list(Resid = exp(Resid)))
		the.model$smearing.adj <- smear$sDataFrame[1,2]
	}
}
# When running the macro within Alteryx by itself, the line of code below
# causes the model summary to be written to the ouput window. However, this
# does not occur when the macro is called from another module
print(summary(the.model))
# The code below creates the key-value pair table of the lm results and the
# set of parameters that can be used downstream
if (!is.XDF) {
	lm.out <- Alteryx.ReportLM(the.model)
} else {
	lm.out <- AlteryxReportRx(the.model)
}
# Put the name of the model as the first entry in the key entry in the
# key-value table.
lm.out <- rbind(c("Model_Name", model.name), lm.out)
# If the ANOVA table is requested then create it and add its results to the
# key-value table 
if(has.car && !is.XDF) {
  print(Anova(the.model, type="II")) # Write to the Output window
  lm.out <- rbind(lm.out, Alteryx.ReportAnova(the.model))
}
if (is.XDF)
	AlteryxMessage("Creation of the Analysis of Variance table was surpressed due to the use of an XDF file", iType = 2, iPriority = 3) 
# Write out the key-value pair table to Alteryx
write.Alteryx(lm.out)
# Create the diagnostic plots
if (!is.XDF) {
	whr <- graphWHR(inches = "True", in.w = 6, in.h = 6, resolution ='%Question.graph.resolution%')
	AlteryxGraph(2, width = whr[1], height = whr[2], res = whr[3], pointsize = 9)
	par(mfrow=c(2,2), mar=c(5, 4, 2, 2) + 0.1)
	plot(the.model)
	invisible(dev.off())
} else {
	AlteryxGraph(2)
	plot(x = c(0,1), y = c(0,1), type = "n", main = "Plots not available", xlab = "", ylab = "", xaxt = "n", yaxt = "n")
	invisible(dev.off())
	AlteryxMessage("The diagnostic plot is not available for XDF based models", iType = 2, iPriority = 3)
}
# Create a list with the model object and its name and write it out via
# the third output
the.obj <- vector(mode="list", length=2)
the.obj[[1]] <- c(model.name)
the.obj[[2]] <- list(the.model)
names(the.obj) <- c("Name", "Object")
write.Alteryx(the.obj, nOutput = 3)
