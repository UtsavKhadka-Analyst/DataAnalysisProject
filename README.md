# Predictive Analytics of Student Performance

## Overview
This project predicts student performance based on various academic, demographic, and extracurricular factors. Using a provided dataset, predictive models were developed to analyze which factors significantly impact whether students "Passed" or "Not Passed" in their courses.

---

## Dataset Information
The dataset contains the following columns:

- **Student.ID**: A unique identifier for each student.
- **Study.Hours.per.Week**: Average number of hours the student spends studying each week.
- **Attendance.Rate**: Attendance rate (in percentage) for the student. Missing values are present in this column.
- **Previous.Grades**: Average grades from previous academic terms (out of 100).
- **Participation.in.Extracurricular.Activities**: Whether the student participates in extracurricular activities (`Yes` or `No`).
- **Parent.Education.Level**: The highest level of education attained by the student's parents (e.g., High School, Bachelor, Master).
- **Passed**: Target variable indicating whether the student passed the course (`Yes` or `No`).

---

## Objectives
The primary objectives of this project include:

1. **Exploratory Data Analysis (EDA)**:
   - Analyzing patterns, distributions, and relationships between variables.
2. **Data Preprocessing**:
   - Handling missing values, encoding categorical variables, and scaling data.
3. **Model Development**:
   - Building predictive models to classify whether a student "Passed" or "Not Passed."
4. **Insights and Recommendations**:
   - Identify key factors influencing student performance and provide actionable recommendations.

---

## Steps to Reproduce

### 1. Data Preprocessing
- Missing values in `Attendance.Rate` were imputed using the column mean/median.
- Categorical variables such as `Participation.in.Extracurricular.Activities` and `Parent.Education.Level` were encoded as numeric values:
  - `Yes` = 1, `No` = 0.
  - For `Parent.Education.Level`: High School = 1, Associate = 2, Bachelor = 3, Master = 4.
- Continuous variables like `Study.Hours.per.Week`, `Attendance.Rate`, and `Previous.Grades` were normalized.
- The target variable, `Passed`, was encoded as:
  - `Yes` = 1, `No` = 0.

### 2. Exploratory Data Analysis (EDA)
- Visualized distributions of study hours, grades, and attendance rates using histograms and boxplots.
- Analyzed relationships between features using scatter plots and correlation heatmaps.
- Bar charts were used for categorical data such as extracurricular participation and parental education levels.

### 3. Model Development
- **Logistic Regression**: Built to classify students as "Passed" or "Not Passed."
- **Random Forest Classifier**: Used for more robust classification and feature importance analysis.
- **Support Vector Machine (SVM)**: Applied to improve classification performance.
- **Evaluation Metrics**:
  - Accuracy, Precision, Recall, F1-Score, and ROC-AUC were used to assess model performance.

---

## Key Findings
- **Study Hours**: Students studying more than 12 hours per week had higher chances of passing.
- **Attendance Rate**: Attendance rates above 85% were strongly correlated with passing.
- **Previous Grades**: Students with grades above 70% were more likely to pass.
- **Parent Education Level**: Students whose parents attained higher education levels (e.g., Master's) showed better performance.
- **Extracurricular Activities**: Participation in extracurricular activities had mixed impacts on performance.

---

## Recommendations
1. **Encourage Study Hours**: Promote effective time management and study programs for students.
2. **Improve Attendance**: Introduce strategies to increase attendance, such as engagement programs.
3. **Targeted Support**: Offer additional support to students with low previous grades.
4. **Parental Engagement**: Encourage parents to participate actively in their children’s education.
5. **Balance Activities**: Ensure students participating in extracurricular activities maintain a balance with academics.

---

## Usage Instructions

### 1. Environment Setup
- Install R and RStudio (if not already installed).
- Install the required R libraries:
  - `tidyverse` (for data manipulation and visualization)
  - `caret` (for machine learning models)
  - `e1071` (for SVM and other advanced models)
  - `pROC` (for ROC curve analysis)

Run the following command in your R console to install these packages:
```R
install.packages(c("tidyverse", "caret", "e1071", "pROC"))
# Load required libraries
library(tidyverse)

# Load the dataset
df <- read.csv("student_performance.csv")

# Display the first few rows
head(df)
