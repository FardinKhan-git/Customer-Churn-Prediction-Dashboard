
install.packages(c("tidyverse", "caret", "readr"))
library(tidyverse)
library(caret)
df <- read_csv("C:\\Users\\fardi\\Downloads\\telco_churn_cleaned_for_python.csv")
df$Churn <- ifelse(df$Churn == "Yes", 1, 0)
df_encoded <- model.matrix(~ . -customerID -Churn, data = df) %>% 
  as.data.frame() %>%
  mutate(Churn = df$Churn)
set.seed(123)
train_idx <- createDataPartition(df_encoded$Churn, p = 0.8, list = FALSE)
train <- df_encoded[train_idx, ]
test <- df_encoded[-train_idx, ]
model <- glm(Churn ~ ., data = train, family = binomial)
df$ChurnProbability <- predict(model, newdata = df_encoded, type = "response")
write_csv(df, "telco_churn_with_predictions_final.csv")