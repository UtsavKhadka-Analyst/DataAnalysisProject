Predictive Analytics of Student Performance
Overview
This project aims to predict student performance based on various academic, demographic, and extracurricular factors. Using this dataset, predictive models were developed to analyze which factors significantly influence whether a student "Passed" or "Not Passed" in their courses.

Dataset Information
The dataset contains information on students' study habits, attendance, past grades, and other factors influencing performance. Below are the details of the columns in the dataset:

Columns Description
Column Name	Description
Student.ID	A unique identifier for each student.
Study.Hours.per.Week	Average number of hours the student spends studying each week.
Attendance.Rate	Attendance rate (in percentage) for the student. Missing values are present in this column.
Previous.Grades	Average grades from previous academic terms (out of 100).
Participation.in.Extracurricular.Activities	Whether the student participates in extracurricular activities (Yes/No).
Parent.Education.Level	The highest level of education attained by the student's parents (e.g., High School, Master).
Passed	Target variable indicating whether the student passed the course (Yes/No).
Objectives
The primary objectives of this project are:

Exploratory Data Analysis (EDA): Analyze the data to understand patterns, distributions, and relationships between variables.
Data Preprocessing: Handle missing values, encode categorical variables, and normalize data for modeling.
Model Development: Build predictive models to classify whether a student "Passed" or "Not Passed."
Insights and Recommendations: Identify key factors influencing student performance and provide actionable recommendations.
Steps to Reproduce
1. Data Preprocessing
Handling Missing Values:
Missing attendance rates were imputed using the column mean/median.
Encoding Categorical Variables:
Categorical columns such as "Participation.in.Extracurricular.Activities" and "Parent.Education.Level" were encoded into numeric values.
Yes = 1, No = 0.
Parent Education Levels: High School = 1, Associate = 2, Bachelor = 3, Master = 4.
Scaling:
Continuous columns like "Study.Hours.per.Week," "Attendance.Rate," and "Previous.Grades" were normalized for consistency.
Target Variable:
The "Passed" column was encoded as: Yes = 1, No = 0.
2. Exploratory Data Analysis (EDA)
Analyzed distributions and correlations between features using:
Histograms and boxplots for continuous variables.
Bar charts for categorical variables.
Correlation heatmap to identify relationships between features.
3. Model Development
Built and evaluated the following machine learning models:
Logistic Regression: To classify students as "Passed" or "Not Passed."
Random Forest: For robust classification and feature importance analysis.
Support Vector Machine (SVM): For improved classification performance.
Performance Metrics:
Accuracy, Precision, Recall, F1-Score, and ROC-AUC.
Key Findings
Study Hours: Students who studied more than 12 hours per week were significantly more likely to pass.
Attendance Rate: Higher attendance rates (>85%) strongly correlated with passing.
Previous Grades: Students with grades above 70% were more likely to pass.
Parent Education Level: Students whose parents attained higher education levels (e.g., Master's) performed better.
Extracurricular Participation: Surprisingly, participation in extracurricular activities had a mixed impact on performance.
Recommendations
Encourage Study Hours: Programs to help students manage their time and study effectively could improve performance.
Improve Attendance: Incentivize attendance through engagement strategies and academic policies.
Targeted Support: Provide additional resources to students with low previous grades.
Parental Engagement: Involve parents in their children’s education, especially those with lower educational attainment.
Balance Extracurricular Activities: Encourage extracurricular participation while ensuring it doesn’t hinder academic progress.
