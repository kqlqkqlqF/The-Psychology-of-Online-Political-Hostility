#### Preamble ####
# Purpose: Clean the data up so that only the columes we need remained
# Author: Yiyi Feng
# Date: 10 February 2024
# Contact: yiyi.feng@mail.utoronto.ca
# License: MIT
# Pre-requisites: [s1_us_2018.csv, s2_dk_2019.csv,s4_us_2021.csv]
# Any other information needed? nope


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Import data ####
raw_us_2018 <-
  read_csv(
    file = "main_folder/data/raw_data/s1_us_2018.csv",
    show_col_types = FALSE
  )

raw_dk_2019 <-
  read_csv(
    file = "main_folder/data/raw_data/s2_dk_2019.csv",
    show_col_types = FALSE
  )

raw_us_2021 <-
  read_csv(
    file = "main_folder/data/raw_data/s4_us_2021.csv",
    show_col_types = FALSE
  )

####Basic data cleaning####
#Only remain the columns needed
raw_us_2018_1 <-
  raw_us_2018 |>
  select(...1, hostile_offline, hostile_online, aggression)
#Show the first six lines to check
head(raw_us_2018_1)

#Only remain the columns needed
raw_dk_2019_1 <-
  raw_dk_2019 |>
  select(...1, hostile_offline, hostile_online, aggression)
#Show the first six lines to check
head(raw_dk_2019_1)

#Only remain the columns needed
raw_us_2021_1 <-
  raw_us_2021 |>
  select(...1, hostile_offline, hostile_online, aggression)
#Show the first six lines to check
head(raw_us_2021_1)

#Remove the rows contains NA
raw_us_2018_2 <- raw_us_2018_1[complete.cases(raw_us_2018_1), ]
#Show the first six lines to check
head(raw_us_2018_2)

#Remove the rows contains NA
raw_dk_2019_2 <- raw_dk_2019_1[complete.cases(raw_dk_2019_1), ]
#Show the first six lines to check
head(raw_dk_2019_2)

#Remove the rows contains NAS
raw_us_2021_2 <- raw_us_2021_1[complete.cases(raw_us_2021_1), ]
#Show the first six lines to check
head(raw_us_2021_2)


#### Clean and combine the total data ####
#Combine cleaned data into one big data set
combined_cleaned_data <- bind_rows(raw_us_2018_2, raw_dk_2019_2, raw_us_2021_2)

#re-number the rows after combining data
combined_cleaned_data <- combined_cleaned_data %>%
  mutate(...1 = row_number())

#rename the first column
combined_cleaned_data <- combined_cleaned_data %>%
  rename(NO. = ...1)

#Add another column hold the data of hostile_online minus hostile_offline
combined_cleaned_data <- combined_cleaned_data %>%
  mutate(online_offline = hostile_online - hostile_offline)

#Show the first six lines to check
head(combined_cleaned_data)

#Save combined total data
write_csv(
  x = combined_cleaned_data,
  file = "main_folder/data/analysis_data/combined_cleaned_data.csv"
)


####Combine and clean total US data ####
#combine the us data
combined_cleaned_data_us <- bind_rows(raw_us_2018_2, raw_us_2021_2)

#re-number the rows after combining data
combined_cleaned_data_us <- combined_cleaned_data_us %>%
  mutate(...1 = row_number())

#rename the first column
combined_cleaned_data_us <- combined_cleaned_data_us %>%
  rename(NO. = ...1)

#Show the first six lines to check
head(combined_cleaned_data_us)

#Save combined us data
write_csv(
  x = combined_cleaned_data_us,
  file = "main_folder/data/analysis_data/combined_cleaned_data_us.csv"
)


#### Clean the dk dataset ####
#re-number the rows after combining data
raw_dk_2019_2 <- raw_dk_2019_2 %>%
  mutate(...1 = row_number())

#rename the first column
raw_dk_2019_2 <- raw_dk_2019_2 %>%
  rename(NO. = ...1)

#Save dk data
write_csv(
  x = raw_dk_2019_2,
  file = "main_folder/data/analysis_data/combined_cleaned_data_dk.csv"
)

