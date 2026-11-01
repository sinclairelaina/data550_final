here::i_am("code/01_make_table.R")

library(dplyr)
library(gtsummary)

data <- readRDS(here::here("clean_data", "clean_data.rds"))

# Table 1: patient characteristics by diagnosis
table1 <- data |>
  mutate(Diagnosis = factor(Diagnosis, levels = c("Alzheimer's", "No Alzheimer's"))) |>
  select(Diagnosis, Age, Gender, Ethnicity, EducationLevel, BMI, Smoking,
         FamilyHistoryAlzheimers, Hypertension, MMSE, FunctionalAssessment, ADL) |>
  tbl_summary(by = Diagnosis,
              statistic = list(all_continuous() ~ "{mean} ({sd})",
                               all_categorical() ~ "{n} ({p}%)"),
              digits = all_continuous() ~ 1,
              label = list(EducationLevel ~ "Education",
                           FamilyHistoryAlzheimers ~ "Family History of AD",
                           FunctionalAssessment ~ "Functional Assessment")) |>
  add_overall() |>
  add_p(test = all_continuous() ~ "t.test") |>
  modify_caption("**Table 1. Patient characteristics by Alzheimer's diagnosis**
                 <br>(continuous variables: mean (SD); categorical variables: n (%))") |>
  bold_labels()

saveRDS(table1, here::here("tables", "table1.rds"))

# Table 2: logistic regression of diagnosis
model <- glm(Diagnosis ~ Age + Gender + MMSE + FunctionalAssessment + ADL +
               MemoryComplaints + BehavioralProblems,
             data = data, family = binomial)

table2 <- tbl_regression(model, exponentiate = TRUE,
               label = list(FunctionalAssessment ~ "Functional Assessment",
                            MemoryComplaints ~ "Memory Complaints",
                            BehavioralProblems ~ "Behavioral Problems")) |>
  modify_caption("**Table 2. Logistic regression of Alzheimer's diagnosis**") |>
  bold_labels() |>
  bold_p()

saveRDS(table2, here::here("tables", "table2.rds"))
