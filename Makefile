#Make file for final report

report.html: report.Rmd tables/table1.rds output/figure1.png
	Rscript -e "rmarkdown::render('report.Rmd')"

output/table1.rds: code/01_make_table.R data/mydata.csv
	Rscript code/01_make_table.R

output/figure1.png: code/02_make_figure.R data/mydata.csv
	Rscript code/02_make_figure.R

.PHONY: clean
clean:
	rm -f report.html output/*