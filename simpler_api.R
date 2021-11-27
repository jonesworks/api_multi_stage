## API setup

library(plumber)
library(parsnip)
library(workflows)
library(recipes)
#library(themis)
library(baguette)

## Load model + metrics

crash_wf_model <- readRDS("crash-wf-model.rds")


#* @apiTitle Chicago traffic crashes model API
#* @apiDescription Model predicting probability of an injury for traffic crashes in Chicago

#* Submit crash data and get a predicted probability of injury
#* @param df data frame of variables
#* @post /predict
function(req, df) {
  df <- as.data.frame(df)
  df$crash_date <- as.POSIXct(df$crash_date, tz = "America/Chicago")
  probs <- predict(crash_wf_model, df, type = "prob")
  probs$.pred_injuries
}
