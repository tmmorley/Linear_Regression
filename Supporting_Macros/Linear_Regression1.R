#########
# Helper function
AlteryxReportRx <- function (rx.obj, null.deviance = NULL) {
    if (!(class(rx.obj) %in% c("rxLinMod","rxLogit","rxGlm"))) 
        stop("The object provided is not an appropriate RevoScaleR class object")
    the.call <- paste(capture.output(rx.obj$call), collapse = "")
    the.call = gsub("\\s\\s", "", the.call)
	# The coefficients and related estimates need to be done by class
	if (class(rx.obj) == "rxLinMod") {
		param.names <- attributes(rx.obj$coefficients)$dimnames[[1]]
		coefs1 <- rx.obj$coefficients[,1]
		the.coefs <- format(coefs1, digits = 4)
		the.coefs[is.na(coefs1)] <- "Dropped"
		the.se <- format(rx.obj$coef.std.error[,1], digits = 4)
		the.se[is.na(coefs1)] <- "Dropped"
		the.t <- format(rx.obj$coef.t.value[,1], digits = 4)
		the.t[is.na(coefs1)] <- "Dropped"
		p.stars <- pStars(rx.obj$coef.p.value[,1])
		p.stars$p_txt <- as.character(p.stars$p_txt)
		p.stars$p_txt[is.na(coefs1)] <- "Dropped"
		p.stars$Stars <- as.character(p.stars$Stars)
		p.stars$Stars[is.na(coefs1)] <- " "
	} else {
		param.names <- names(rx.obj$coefficients)
		the.coefs <- format(rx.obj$coefficients, digits = 4)
		the.coefs[is.na(rx.obj$coefficients)] <- "Dropped"
		the.se <- format(rx.obj$coef.std.error, digits = 4)
		the.se[is.na(rx.obj$coefficients)] <- "Dropped"
		the.t <- format(rx.obj$coef.t.value, digits = 4)
		the.t[is.na(rx.obj$coefficients)] <- "Dropped"
		p.stars <- pStars(rx.obj$coef.p.value)
		p.stars$p_txt <- as.character(p.stars$p_txt)
		p.stars$p_txt[is.na(rx.obj$coefficients)] <- "Dropped"
		p.stars$Stars <- as.character(p.stars$Stars)
		p.stars$Stars[is.na(rx.obj$coefficients)] <- " "
	}
	coef.est <- paste(param.names, the.coefs, the.se, the.t, p.stars$p_txt, p.stars$Stars, sep = "|")
    coef.lab <- "Coefficients:"
    omitted <- names(rx.obj$aliased)[rx.obj$aliased]
    if (length(omitted) > 0)
        coef.lab <- paste(coef.lab, " (", length(omitted), " not defined because of singularities)", sep = "")
	# Model summary, slightly different for glm based objects versus lm objects
	if (class(rx.obj) != "rxLinMod") {
		if (class(rx.obj) == "rxGlm")
			dispersion <- paste("(Dispersion parameter for ", rx.obj$family$family, " taken to be ", rx.obj$dispersion, ")", sep = "")
		if (class(rx.obj) == "rxLogit")
			dispersion <- "(Dispersion parameter for binomial taken to be 1)"
		df.null <- rx.obj$nValidObs - 1
		df.mod <- rx.obj$nValidObs - length(param.names)
		null.dev <- paste("Null deviance:", format(null.deviance, digits = 5), "on", df.null, "degrees of freedom")
		mod.dev <- paste("Residual deviance:", format(rx.obj$deviance, digits = 5), "on", df.mod, "degrees of freedom")
		McF.R2 <- 1 - (rx.obj$deviance/null.deviance)
		mod.fit <- paste("McFadden R-Squared: ", format(McF.R2, digits = 4), ", AIC: ", format(rx.obj$aic, digits = 4), sep = "")
		fisher.it <- paste("Number of IRLS iterations:", rx.obj$iter)
		sum.grps <- c("Call", "Coef_Label", rep("Coef_Est", length(coef.est)), "Dispersion", rep("Fit_Stats", 3), "Fisher")
		sum.out <- c(the.call, coef.lab, coef.est, dispersion, null.dev, mod.dev, mod.fit, fisher.it)
		summary.df <- data.frame(grp = sum.grps, out = sum.out)
		summary.df$grp <- as.character(summary.df$grp)
		summary.df$out <- as.character(summary.df$out)
	} else {
		resid.se <- paste("Residual standard error:", format(rx.obj$sigma, digits = 5), "on", rx.obj$df[2], "degrees of freedom")
		r.sq <- paste("Multiple R-squared: ", format(rx.obj$r.squared, digits = 4), ", Adjusted R-Squared: ", format(rx.obj$adj.r.squared, 
        digits = 4), sep = "")
		p.f <- format(rx.obj$f.pvalue, digits = 4)
		p.f[rx.obj$f.pvalue < 2.2e-16] <- "< 2.2e-16"
		f.stat <- paste("F-statistic: ", format(rx.obj$fstatistic$value, digits = 4), " on ", as.integer(rx.obj$fstatistic$numdf), " and ", as.integer(rx.obj$fstatistic$dendf), " DF, p-value: ", p.f, sep = "")
		sum.grps <- c("Call", "Coef_Label", rep("Coef_Est", length(coef.est)), rep("Fit_Stats", 3))
		sum.out <- c(the.call, coef.lab, coef.est, resid.se, r.sq, f.stat)
		summary.df <- data.frame(grp = sum.grps, out = sum.out)
		summary.df$grp <- as.character(summary.df$grp)
		summary.df$out <- as.character(summary.df$out)
	}
	json.str <- paste("\"", names(rx.obj$coefficients), "\":\"", rx.obj$coefficients, "\"", sep = "", collapse = ", ")
	json.str <- paste("{", json.str, "}")
	coef.str <- c("Coef_JSON", json.str)
	summary.df <- rbind(summary.df, coef.str)
	summary.df
}
xdfLevels <- function(form, xdf) {
	factors <- rxSummary(form, data = xdf)$categorical
	the.names <- sapply(factors, function(x) names(x)[1])
	if (length(the.names) == 1) {
		the.levels <- eval(parse(text = paste("list(", the.names, " = as.character(factors[[1]][[1]]))")))
	} else {
		the.levels <- sapply(factors, function(x) as.character(x[[1]]))
		names(the.levels) <- the.names
	}
	the.levels
}
#########
# Determine if the "car" package is needed and, if it is, determine if it is
# available.
has.car <- "car" %in% row.names(installed.packages())
if(has.car) {
  library(car)
} else {warning("Unable to find the car package")}
 
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
