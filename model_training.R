# Load necessary libraries
install.packages("caret")

library(caret)  # For model training and evaluation
library(dplyr)  # For data manipulation

# Split the data into training and testing sets (80% training, 20% testing)
set.seed(123)  # For reproducibility
split_index <- createDataPartition(student_data$Passed, p = 0.8, list = FALSE)
train_data <- student_data[split_index, ]
test_data <- student_data[-split_index, ]

# Convert Passed to binary format if necessary
train_data$Passed <- ifelse(train_data$Passed == "Yes", 1, 0)
test_data$Passed <- ifelse(test_data$Passed == "Yes", 1, 0)

# Build the logistic regression model
model <- glm(Passed ~ Study.Hours.per.Week + Attendance.Rate + Previous.Grades + 
               Participation.in.Extracurricular.Activities + Parent.Education.Level, 
             data = train_data, family = binomial)

# Summary of the model
summary(model)

# Make predictions on the test set
predictions <- predict(model, test_data, type = "response")

# Convert probabilities to binary outcomes
predicted_outcomes <- ifelse(predictions > 0.5, 1, 0)

# Evaluate the model's accuracy
accuracy <- mean(predicted_outcomes == test_data$Passed)
print(paste("Model Accuracy:", round(accuracy * 100, 2), "%"))

# Confusion matrix
confusion_matrix <- table(Predicted = predicted_outcomes, Actual = test_data$Passed)
print("Confusion Matrix:")
print(confusion_matrix)

# Save the model for future use
saveRDS(model, "logistic_regression_model.rds")
print("Model saved as logistic_regression_model.rds")
