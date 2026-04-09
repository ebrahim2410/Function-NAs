# NAs Function

## Overview

The **NAs** function is designed to handle missing values (NA) in datasets such as matrices or data frames. It provides flexible options for either removing incomplete observations or replacing missing values using different statistical strategies.

---

## Purpose

Missing data is a common issue in data analysis and can affect the accuracy of results. This function simplifies the process of handling missing values by offering multiple methods that can be applied depending on the analysis needs.

---

## Supported Methods

### 1. Drop

Removes rows that contain missing values.

* If no threshold is provided, all rows with any missing values are removed.
* If a threshold (`x`) is specified, only rows with a percentage of missing values less than or equal to this threshold are retained.

### 2. Mean

Replaces missing values in each column with the mean of the available (non-missing) values in that column.

### 3. Median

Replaces missing values with the median of the available values in each column.

### 4. Max

Substitutes missing values with the maximum value found in each column.

### 5. Min

Substitutes missing values with the minimum value found in each column.

### 6. Zero

Replaces all missing values with zero.

---

## Parameters

### data

* **Type:** Matrix or data frame
* **Description:** The dataset that contains missing values to be handled
* **Requirement:** Must have dimensions (cannot be a simple vector)

### method

* **Type:** Character
* **Description:** Determines how missing values are handled
* **Allowed values:**

  * "drop"
  * "mean"
  * "median"
  * "max"
  * "min"
  * "zero"

### x

* **Type:** Numeric (optional)
* **Default:** NULL
* **Usage:**

  * Only applicable when using the "drop" method
  * Represents the maximum allowed percentage of missing values per row

---

## Notes

* The function validates that the input data has dimensions before processing.
* Replacement methods operate column-wise.
* Statistical calculations ignore missing values when computing replacement values.
* The function returns a cleaned or imputed dataset based on the selected method.

---

## Use Cases

* Preprocessing data before statistical analysis or machine learning
* Cleaning datasets with incomplete observations
* Standardizing missing value handling across projects

---

## Summary

The **NAs** function provides a simple and flexible approach to managing missing data, allowing users to either remove incomplete records or apply different imputation strategies depending on their analysis requirements.
