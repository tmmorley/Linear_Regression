library(jeeves)
library(htmltools)
pluginDir <- '.'
cfg <- renderPluginWidgets(pluginDir, wrapInDiv = TRUE)

setupPage <- jvSetupPage(title = 'Setup',
  cfg$`Model Name`, cfg$`Y Var`, cfg$`X Vars`              
)

modelTab <- jvTabPage(title = 'Model', id = 'advanced',
  cfg$`Omit Constant`,
  cfg$`Use Weights`,
  cfg$`Weight Vec`,
  cfg$regularization,
  div(id = 'show-on-regularization', class='indent-one',
    cfg$alpha, cfg$standardize_pred, cfg$internal_cv,
    div(class = 'indent-one',
      div(id = 'show-on-cv', cfg$nfolds, cfg$lambda),
      div(id = 'show-on-no-cv', cfg$lambda_no_cv),
      cfg$set_seed_internal_cv, cfg$seed_internal_cv
    )
  )
)

cvTab <- jvTabPage(title = 'Cross Validation', id = 'crossvalidation',
  cfg$external_cv,
  div(id = 'show-on-external-cv', class = 'indent-one',
    cfg$nfolds_external, cfg$numberTrials,
    cfg$set_seed_external_cv, cfg$external_seed_value
  )
)

plotTab <- jvTabPage(title = 'Plots', id = 'graphics',
  cfg$graph.resolution,
  div(id = 'show-on-regularization-graph',
    cfg$display_graphs    
  )
)

tabContent <- jvTabbedContent(selected = 'Model',
  modelTab, cvTab, plotTab
)

customizePage <- jvCustomizePage(title = 'Customize', tabContent)

ui <- tagList(setupPage, customizePage)
di <- jvMakeDataItemsToInitialize(
  curPage = 'Home', 
  curTab = 'advanced'
)
displayRules = list(
  'div-weight-vec'= 'Use Weights',
  'show-on-regularization'= 'regularization',
  'show-on-cv'= 'internal_cv',
  'show-on-regularization-graph'= 'regularization',
  'show-on-external-cv'= 'external_cv',
  'div-external-seed-value'= 'set_seed_external_cv',
  'div-seed-internal-cv'= 'set_seed_internal_cv'
)

jsonDisplayRules <- jsonlite::toJSON(
  displayRules, auto_unbox = TRUE, pretty = TRUE
)


myPage <- tagList(ui, tags$script(
  makeJsVariable(di, 'items'), 
  makeJsVariable(jsonDisplayRules, 'displayRules')
))

writeLines(as.character(myPage), file.path(pluginDir, 'Extras/Gui/layout.html'))
updatePlugin()