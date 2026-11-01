here::i_am("code/02_make_figure.R")

library(dplyr)
library(ggplot2)

data <- readRDS(here::here("clean_data", "clean_data.rds"))

figure1 <- data |>
  mutate(Diagnosis = factor(Diagnosis, levels = c("Alzheimer's", "No Alzheimer's"))) |>
  select(Diagnosis, MMSE, FunctionalAssessment, ADL) |>
  tidyr::pivot_longer(-Diagnosis, names_to = "measure", values_to = "score") |>
  mutate(measure = factor(measure,
                          levels = c("MMSE", "FunctionalAssessment", "ADL"),
                          labels = c("Mini-Mental State Examination (MMSE, 0-30)", "Functional Assessment (0-10)", "Activities of Daily Living (ADL, 0-10)"))) |>
  ggplot(aes(x = Diagnosis, y = score, fill = Diagnosis)) +
  scale_fill_manual(values = c("Alzheimer's" = "#eb6834", "No Alzheimer's" = "#2a78d6")) +
  geom_boxplot(show.legend = FALSE) +
  facet_wrap(~ measure, scales = "free_y") +
  labs(x = NULL, y = "Score",
       title = "Cognitive and Functional Scores by Alzheimer's Diagnosis") +
  theme_minimal()

ggsave(here::here("figures", "figure1.png"), figure1,
       width = 9, height = 4, dpi = 300, bg = "white")
