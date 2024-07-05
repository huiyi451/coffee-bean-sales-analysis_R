# Coffee Bean Sales Analysis Model Development

## Overview

This project utilizes R for analyzing coffee bean sales data, aiming to uncover insights into customer preferences and sales patterns.

## Model Development Process

### 1. Data Collection

- **Source:** Kaggle dataset by Saad Haroon (2023).
- **Content:** Customer profiles, product details, and sales transactions.

### 2. Data Preprocessing

- **Access:** Read data from "coffeebeansales.xlsx" using `read_excel()` from `readxl`.
- **Cleanup:** Handle missing values (`na = "NA"`) and transform data types using `as.factor()` for categorical variables.

### 3. Descriptive Statistics

- **Metrics:** Calculate mean, median, mode (`mean()`, `median()`) for central tendency.
- **Variability:** Compute variance and standard deviation (`var()`, `sd()`) for data dispersion.

### 4. Visualization Analysis

- **Library:** Utilize ggplot2 for creating visualizations.
- **Visual Types:** Construct bar charts to explore relationships between coffee type, roast type, size, country, and year.

### 5. Methodology

- **Summary Statistics:** Use `summary()` for an overview of data distribution.
- **Product Performance:** Visualize sales trends across different dimensions using ggplot2.

### 6. Top 50 Customers Preferences

- **Identification:** Determine top customers' preferences using bar charts and cross-tabulation tables.
