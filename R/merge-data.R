#library ----
library(tidyverse)
library(janitor)
library(labelled)
library(sjlabelled)
library(haven)

# @ read in raw data ----
# wave 5 ----
wave5_cvd <- read_dta(here::here("data/21600-0035-Data.dta")) 

# wave5_hyp_diab <- wave5_cvd %>% 
#   dplyr::select(AID, hypertension = H5HTENJC, diabetes = H5Q045B) 

# wave 1: ds1-3 ----
wave1_1 <- read_dta(here::here("data/21600-0001-Data.dta"))
wave1_2 <- read_dta(here::here("data/21600-0002-Data.dta"))
# [note] I downloaded both of their STATA and SPSS files, and their ds3 dataset is just empty... 
# [note] so I didn't merge ds3. 
#wave1_3 <- read_dta(here::here("data/21600-0003-Data.dta"))
#wave1_3 <- read_sav(here::here("data/21600-0003-Data.sav"))

# wave 2: ds5-6 ----
wave2_5 <- read_dta(here::here("data/21600-0005-Data.dta"))
wave2_6 <- read_dta(here::here("data/21600-0006-Data.dta"))

# wave 3: ds8-17 ----
wave3_8 <- read_dta(here::here("data/21600-0008-Data.dta"))
wave3_9 <- read_dta(here::here("data/21600-0009-Data.dta")) # duplicated AIDs, not merged for now
wave3_10 <- read_dta(here::here("data/21600-0010-Data.dta")) # duplicated AIDs, not merged for now

wave3_11 <- read_dta(here::here("data/21600-0011-Data.dta")) # duplicated AIDs, not merged for now
wave3_12 <- read_dta(here::here("data/21600-0012-Data.dta")) # duplicated AIDs, not merged for now
wave3_13 <- read_dta(here::here("data/21600-0013-Data.dta")) # duplicated AIDs, not merged for now
wave3_14 <- read_dta(here::here("data/21600-0014-Data.dta")) # duplicated AIDs, not merged for now
wave3_15 <- read_dta(here::here("data/21600-0015-Data.dta")) # duplicated AIDs, not merged for now

wave3_16 <- read_dta(here::here("data/21600-0016-Data.dta")) 
wave3_17 <- read_dta(here::here("data/21600-0017-Data.dta"))

# @ merge files with unique AIDs ----
data_merged_uniqIDonly <- wave1_1 %>% 
  left_join(wave1_2, by = "AID") %>%
  left_join(wave2_5, by = "AID") %>%
  left_join(wave2_6, by = "AID") %>%
  left_join(wave3_8, by = "AID") %>%
  left_join(wave3_16, by = "AID") %>%
  left_join(wave3_17, by = "AID") 

# save ----
write_rds(data_merged_uniqIDonly, 
          file = here::here("merged/MergedData_W1to3_UniqueIDOnly.rdata"))
