# Load necessary libraries
library(ggplot2)

# Load the cleaned dataset
student_data_cleaned <- readRDS("cleaned_student_data.rds")

# Structure and summary of the dataset
str(student_data_cleaned)
summary(student_data_cleaned)

# Visualize the relationship between Study Hours and Previous Grades
ggplot(student_data_cleaned, aes(x = Study.Hours.per.Week, y = Previous.Grades)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Study Hours vs. Previous Grades")

# Correlation matrix for numerical variables
cor_matrix <- cor(student_data_cleaned[, c("Study.Hours.per.Week", "Attendance.Rate", "Previous.Grades")])
print(cor_matrix)

# Save correlation matrix for reporting
write.csv(cor_matrix, "correlation_matrix.csv")
