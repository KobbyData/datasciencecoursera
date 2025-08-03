How to View the Report
You can view the compiled HTML report directly from the GitHub Pages link here:
➡️ View Report Online

How to Reproduce This Analysis
Clone this repository:

bash
Copy
Edit
git clone https://github.com/<your-github-username>/<repository-name>.git
Open Project_Report.Rmd in RStudio.

Make sure you have the following files in the same directory:

pml-training.csv: Download Link

pml-testing.csv: Download Link

Install necessary R packages:

r
Copy
Edit
install.packages(c("caret", "randomForest", "ggplot2"))
Knit the Rmd file to HTML (Knit to HTML button in RStudio).

Project Description
Using data from accelerometers on the belt, forearm, arm, and dumbbell, we predict the "classe" variable which represents the manner of exercise performed. A Random Forest model was trained with 5-fold cross-validation, yielding an expected out-of-sample error rate of approximately 1%.

Author
[Your Name]

Coursera - Practical Machine Learning Course Project