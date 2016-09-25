#' ---
#' title: Linear Regression
#' author: Dan Putler, Bridget Toomey, Ramnath Vaidyanathan
#' output:
#'   html_document:
#'     toc: true
#'     toc_depth: 4
#' ---
#' Load Libraries
library(car)

#' ### Read Configuration
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
#' ### Read Inputs
#'
#' This is a named list of all inputs that stream into the R tool.
#' We also specify defaults for use when R code is run outside Alteryx.
inputs <- list(
  the.data = read.Alteryx2("#1", default = mtcars)
)

#' ### Run and Create Outputs
config$model.name = validName(config$model.name)
XDFInfo <- if (inAlteryx()) getXdfProperties("#1") else list(is_XDF = FALSE)
if (XDFInfo$is_XDF){
  the.model <- processLinearXDF(inputs, config)
  lm.out <- createReportLinearXDF(the.model, config)
  plot.out <- function(){createPlotOutputsXDF()}
} else {
  the.model <- processLinearOSR(inputs, config)
  lm.out <- createReportLinearOSR(the.model, config)
  plot.out <- function(){createPlotOutputsLinearOSR(the.model)}
}

# Report
write.Alteryx2(lm.out, nOutput = 1)

# Plot Output
# whr <- graphWHR(inches = "True", in.w = 6, in.h = 6, config$resolution)
whr <- AlteryxPredictive:::graphWHR2(inches = TRUE, in.w = 6, in.h = 6,
  config$graph.resolution)
AlteryxGraph2(plot.out(), 2, width = whr[1], height = whr[2],
  res = whr[3], pointsize = 9)

# Model Object
the.obj <- prepModelForOutput(config$model.name, the.model)
write.Alteryx2(the.obj, nOutput = 3)
