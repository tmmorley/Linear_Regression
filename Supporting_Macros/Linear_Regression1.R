#' ---
#' title: Linear Regression
#' author: Dan Putler, Bridget Toomey, Ramnath Vaidyanathan
#' output:
#'   html_document:
#'     toc: true
#'     toc_depth: 4
#' ---

#' ### Read Configuration
#'
#'
## DO NOT MODIFY: Auto Inserted by AlteryxRhelper ----
suppressWarnings(library(AlteryxPredictive))
config <- list(
  `graph.resolution` = dropdownInput('%Question.graph.resolution%' , '1x'),
  `Model Name` = textInput('%Question.Model Name%'),
  `Omit Constant` = checkboxInput('%Question.Omit Constant%' , FALSE),
  `Use Weights` = checkboxInput('%Question.Use Weights%' , FALSE),
  `Weight Vec` = dropdownInput('%Question.Weight Vec%'),
  `X Vars` = listInput('%Question.X Vars%', names(mtcars)[-1]),
  `Y Var` = dropdownInput('%Question.Y Var%', 'mpg'),
  `regularization` = checkboxInput('%Question.regularization%', FALSE),
  `alpha` = numericInput('%Question.alpha%', NULL),
  `lambda_1se` = radioInput('%Question.lambda.1se%', TRUE),
  `lambda_min` = radioInput('%Question.lambda.min%', FALSE),
  standardize_pred = checkboxInput('%Question.standardize_pred%', TRUE),
  `cv_glmnet` = checkboxInput('%Question.cv.glmnet%', TRUE),
  `nfolds` = numericInput('%Question.nfolds%', NULL)
) 
options(alteryx.wd = '%Engine.WorkflowDirectory%')
options(alteryx.debug = config$debug)
##----
#' ### Read Inputs
#'
#' This is a named list of all inputs that stream into the R tool.
#' We also specify defaults for use when R code is run outside Alteryx.
inputs <- list(
  the.data = read.Alteryx2("#1", default = mtcars),
  XDFInfo = getXdfProperties("#1", default = list(is_XDF = FALSE, xdf_path = NULL))
)

AlteryxPredictive:::runLinearRegression(inputs, config)

