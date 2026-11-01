#Make file for final report

# Build the final report (the default target)
reports/final_project_report.html: code/final_project_report.Rmd tables/table1.rds tables/table2.rds figures/figure1.png
	Rscript -e "rmarkdown::render('code/final_project_report.Rmd', output_dir = 'reports')"

# Clean the raw data
clean_data/clean_data.rds: code/00_clean_data.R raw_data/alzheimers_disease_data.csv
	Rscript code/00_clean_data.R

# Tables 1 and 2 (both made by the same script)
tables/table1.rds: code/01_make_table.R clean_data/clean_data.rds
	Rscript code/01_make_table.R

tables/table2.rds: tables/table1.rds

# Figure 1
figures/figure1.png: code/02_make_figure.R clean_data/clean_data.rds
	Rscript code/02_make_figure.R

.PHONY: clean
clean:
	rm -f clean_data/*.rds tables/*.rds figures/*.png reports/*.html
