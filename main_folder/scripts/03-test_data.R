#### Preamble ####
# Purpose: test the simulated dataset
# Author: Yingxuan Sun
# Date: 11 February 2023
# Contact: lindayx.sun@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test simulated data ####
# read the dataset
data <- read_csv("main_folder/data/simulated_data/simulated_data.csv")

# Test that the data frame has the correct column names
test_that("Data frame has correct column names", {
  # Expected column names, assuming the first column name is intentionally left blank
  expected_colnames <- c("NO.","Aggression","Hostile_online","Hostile_offline")
  # Actual column names from the generated data frame
  actual_colnames <- names(data)
  # Check if the actual column names match the expected ones
  expect_equal(actual_colnames, expected_colnames)
})

# Test that the dataset has the correct number of rows
test_that("Dataset has correct number of rows", {
  # Check if the number of rows in the data frame matches the expected number, assuming 100 rows were intended
  expect_equal(nrow(data), 100) # Assuming you expected to generate 100 rows of data
})

# Test that data values are within the correct range
test_that("Data values are in the correct range", {
  # Check if all values in the Aggression column are between 0 and 1, inclusive
  expect_true(all(data$Aggression >= 0 & data$Aggression <= 1))
  # Check if all values in the Hostile_online column are between 0 and 1, inclusive
  expect_true(all(data$Hostile_online >= 0 & data$Hostile_online <= 1))
  # Check if all values in the Hostile_offline column are between 0 and 1, inclusive
  expect_true(all(data$Hostile_offline >= 0 & data$Hostile_offline <= 1))
})

# Test that the data file is correctly generated
test_that("Data file is correctly generated", {
  # Check if the expected CSV file exists in the specified directory
  expect_true(file.exists("main_folder/data/simulated_data/simulated_data.csv"))
})

#### Test cleaned data ####
# read the dataset
data1 <- read_csv("main_folder/data/analysis_data/combined_cleaned_data.csv")

# Test that the data frame has the correct column names
test_that("Data frame has correct column names", {
  # Expected column names, assuming the first column name is intentionally left blank
  expected_colnames <- c("NO.","hostile_offline","hostile_online", "aggression","online_offline")
  # Actual column names from the generated data frame
  actual_colnames <- names(data1)
  # Check if the actual column names match the expected ones
  expect_equal(actual_colnames, expected_colnames)
})

# Test that the dataset has the correct number of rows
test_that("Dataset has correct number of rows", {
  # Check if the number of rows in the data frame matches the expected number, assuming 100 rows were intended
  expect_equal(nrow(data1), 3239) # Assuming you expected to generate 100 rows of data
})

# Test that data values are within the correct range
test_that("Data values are in the correct range", {
  # Check if all values in the Hostile_offline column are between 0 and 1, inclusive
  expect_true(all(data1$hostile_offline >= 0 & data1$hostile_offline <= 1))
  # Check if all values in the Hostile_online column are between 0 and 1, inclusive
  expect_true(all(data1$hostile_online >= 0 & data1$hostile_online <= 1))
  # Check if all values in the Aggression column are between 0 and 1, inclusive
  expect_true(all(data1$aggression >= 0 & data1$aggression <= 1))
  # Check if all values in the online_offline column are between -1 and 1, inclusive
  expect_true(all(data1$online_offline >= -1 & data1$online_offline <= 1))

  
})

# Test that the data file is correctly generated
test_that("Data file is correctly generated", {
  # Check if the expected CSV file exists in the specified directory
  expect_true(file.exists("main_folder/data/analysis_data/combined_cleaned_data.csv"))
})

