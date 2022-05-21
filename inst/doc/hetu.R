## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----install, eval=FALSE------------------------------------------------------
#  devtools::install_github("ropengov/hetu")

## ----test, message=FALSE, warning=FALSE, eval=TRUE----------------------------
library(hetu)

## ----locale, eval=FALSE-------------------------------------------------------
#  Sys.setlocale(locale="UTF-8")

## ----hetu_example1, message=FALSE---------------------------------------------
example_pin <- "111111-111C"
hetu(example_pin)

## ----hetu_example2, message=FALSE---------------------------------------------
knitr::kable(hetu(example_pin))

## ----hetu_example3, message=FALSE---------------------------------------------
example_pins <- c("010101-0101", "111111-111C")
knitr::kable(hetu(example_pins))

## ----hetuextract1, message=FALSE----------------------------------------------
hetu(example_pins, extract = "sex")
hetu(example_pins, extract = "ctrl.char")

## ----hetuextract2, message=FALSE, eval=TRUE-----------------------------------
hetu_sex(example_pins)

## ----hetuextract3, message=TRUE, eval=TRUE------------------------------------
hetu_age(example_pins)
hetu_age(example_pins, date = "2012-01-01")
hetu_age(example_pins, timespan = "months")

## ----hetuextract4, message=FALSE, eval=TRUE-----------------------------------
hetu_date(example_pins)

## ----hetu_ctrl_example, fig.message=FALSE-------------------------------------
hetu_ctrl(c("010101-0101", "111111-111C")) # TRUE TRUE
hetu_ctrl("010101-1010") # FALSE

## ----hetu_temp1, message=FALSE------------------------------------------------
example_temp_pin <- "010101A900R"
knitr::kable(hetu(example_temp_pin, allow.temp = TRUE))

## ----hetu_temp3, message=FALSE------------------------------------------------
knitr::kable(hetu(example_temp_pins, allow.temp = TRUE))
hetu_ctrl("010101A900R", allow.temp = TRUE)

## ----rpin, message=FALSE------------------------------------------------------
rhetu(n = 4)
rhetu(n = 4, start.date = "1990-01-01", end.date = "2005-01-01")

## ----rpin2, message=FALSE-----------------------------------------------------
random_sample <- rhetu(n = 4, p.male = 0.8)
table(random_sample)

## ----rpin3, message=FALSE-----------------------------------------------------
temp_sample <- rhetu(n = 4, p.temp = 0.5)
table(hetu(temp_sample, allow.temp = TRUE, extract = "is.temp"))

## ----rbid_example, message=FALSE----------------------------------------------
bid_sample <- rbid(3)
bid_sample

## ----bid_ctrl_example, fig.message=FALSE--------------------------------------
bid_ctrl(c("0737546-2", "1572860-0")) # TRUE TRUE
bid_ctrl("0737546-1") # FALSE

## ----hetu_tibbles, eval = FALSE-----------------------------------------------
#  library(hetu)
#  library(tidyverse)
#  library(dplyr)
#  
#  # Generate data for this example
#  hdat<-tibble(pin=rhetu(n = 4, start_date = "1990-01-01", end_date = "2005-01-01"))
#  
#  # Extract all the hetu information to tibble format
#  hdat<-hdat %>%
#    mutate(result=map(.x=pin,.f=hetu::hetu)) %>% unnest(cols=c(result))
#  hdat

## ----citation, message=FALSE, eval=TRUE---------------------------------------
citation("hetu")

## ----sessioninfo, message=FALSE, warning=FALSE--------------------------------
sessionInfo()

