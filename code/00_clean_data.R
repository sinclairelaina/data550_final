here::i_am("code/00_clean_data.R")

library(dplyr)

data <- read.csv(here::here("raw_data", "alzheimers_disease_data.csv"), header = TRUE)

data <- data |>
  select(-PatientID, -DoctorInCharge) |> #Don't need PatientID and DoctorInCharge is XXXConfid in every row -> not useful
  mutate(
    Diagnosis = factor(Diagnosis, levels = 0:1, labels = c("No Alzheimer's", "Alzheimer's")),
    Gender = factor(Gender, levels = 0:1, labels = c("Male", "Female")),
    Ethnicity = factor(Ethnicity, levels = 0:3,
                       labels = c("White", "Black", "Asian", "Other")),
    EducationLevel = factor(EducationLevel, levels = 0:3,
                            labels = c("None", "High School", "Bachelor's", "Higher")),
    across(c(Smoking, FamilyHistoryAlzheimers, Hypertension,
             MemoryComplaints, BehavioralProblems),
           ~ factor(.x, levels = 0:1, labels = c("No", "Yes")))
  )

saveRDS(data, here::here("clean_data", "clean_data.rds"))
