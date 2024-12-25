# Data Cleaning Script

library(ggplot2)
library(caTools)


# Load the dataset
student_data <- read.csv("/Users/khadkautsav/Downloads/student_performance_prediction.csv")

# Summary of the dataset
head(student_data)
summary(student_data)
str(student_data)

# Checking for missing values
sum(is.na(student_data))
colSums(is.na(student_data))

# Filter rows with fewer than or equal to 2 missing values
threshold <- 2
student_data_cleaned <- student_data[rowSums(is.na(student_data)) <= threshold, ]
colSums(is.na(student_data_cleaned))

# Impute missing Study Hours with the median
student_data_cleaned$Study.Hours.per.Week[is.na(student_data_cleaned$Study.Hours.per.Week)] <- median(student_data_cleaned$Study.Hours.per.Week, na.rm = TRUE)

# Impute missing Attendance Rate using regression
fit_attendance <- lm(Attendance.Rate ~ Parent.Education.Level + Participation.in.Extracurricular.Activities, data = student_data_cleaned)
student_data_cleaned$Attendance.Rate[is.na(student_data_cleaned$Attendance.Rate)] <- predict(fit_attendance, student_data_cleaned[is.na(student_data_cleaned$Attendance.Rate), ])

# Impute missing Previous Grades using regression
fit_grades <- lm(Previous.Grades ~ Passed + Parent.Education.Level, data = student_data_cleaned)
student_data_cleaned$Previous.Grades[is.na(student_data_cleaned$Previous.Grades)] <- predict(fit_grades, student_data_cleaned[is.na(student_data_cleaned$Previous.Grades), ])

# Impute missing Passed column with the mode
mode_passed <- "Yes"
student_data_cleaned$Passed[is.na(student_data_cleaned$Passed)] <- mode_passed
student_data_cleaned$Passed[student_data_cleaned$Passed == "nan"] <- "No"

# Treat missing Parent Education Level as "Unknown"
student_data_cleaned$Parent.Education.Level[is.na(student_data_cleaned$Parent.Education.Level)] <- "Unknown"
student_data_cleaned$Parent.Education.Level[student_data_cleaned$Parent.Education.Level == "nan"] <- "Unknown"

# Impute missing Participation in Extracurricular Activities with mode
get_mode <- function(x) {
  unique_x <- unique(x)
  unique_x[which.max(tabulate(match(x, unique_x)))]
}
mode_participation <- get_mode(student_data_cleaned$Participation.in.Extracurricular.Activities)
student_data_cleaned$Participation.in.Extracurricular.Activities[student_data_cleaned$Participation.in.Extracurricular.Activities == "nan"] <- mode_participation

# Remove rows with remaining missing values
student_data_cleaned <- na.omit(student_data_cleaned)

# Save cleaned dataset
saveRDS(student_data_cleaned, "cleaned_student_data.rds")
