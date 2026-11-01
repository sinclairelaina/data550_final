# Data 550 Final Project

This report was created as Elaina Sinclair's DATA 550 Final Project.

## Contents
- `report.Rmd`: source for the final report
- `code/01_make_table.R`: code that creates the required table
- `code/02_make_figure.R`: code that creates the required figure
- `data/`: input data
- `tablet/`: generated tables
- `figures/`: generated figures
- `Makefile`: build rules

## How to generate the final report
Run from the project root:

    make report.html

Requires R with the `rmarkdown` package (and any others you use, e.g. `tidyverse`).

## About the report
This is a report uses Alzheimer's Disease Dataset (El Kharoua, 2024),a synthetic dataset
available on Kaggle that contains health records for 2,149 patients aged 60 to 90 years.
More information/description to come.

## Where tables are made
The required table is created in `code/01_make_table.R` and saved to `tables/table1.rds`.

## Where figures are made
The required figure is created in `code/02_make_figure.R` and saved to `figures/figure1.png`.