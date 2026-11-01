# Data 550 Final Project

This report was created as Elaina Sinclair's DATA 550 Final Project.

## Contents
- `code/final_project_report.Rmd`: source for the final report
- `code/00_clean_data.R`: cleans the raw data and saves it to `clean_data/`
- `code/01_make_table.R`: code that creates the required tables (Tables 1 and 2)
- `code/02_make_figure.R`: code that creates the required figure (Figure 1)
- `raw_data/`: original input data (`alzheimers_disease_data.csv`)
- `clean_data/`: cleaned data
- `tables/`: generated tables
- `figures/`: generated figures
- `reports/`: the rendered final report
- `Makefile`: build rules

## How to generate the final report
Run from the project root (the `final` folder):

    make

This cleans the data, builds the tables and figure, and renders `reports/final_project_report.html`. Run `make clean` to delete all generated files.

Requires R with the packages `rmarkdown`, `knitr`, `dplyr`, `tidyr`, `gtsummary`, `ggplot2`, and `here`, and `make`.

## About the report
This report uses the Alzheimer's Disease Dataset (El Kharoua, 2024), a synthetic dataset
available on Kaggle that contains health records for 2,149 patients aged 60 to 90 years.
It (1) compares patient characteristics by Alzheimer's diagnosis (Table 1 and Figure 1) and
(2) estimates, with logistic regression, how cognitive and functional scores and symptoms
are associated with the odds of diagnosis, adjusting for age and gender (Table 2).
Because the data are synthetic, results demonstrate analytic methods rather than real-world relationships.

## Where tables are made
The required tables are created in `code/01_make_table.R` and saved to `tables/table1.rds` (patient characteristics by diagnosis) and `tables/table2.rds` (logistic regression).

## Where figures are made
The required figure is created in `code/02_make_figure.R` and saved to `figures/figure1.png`.
