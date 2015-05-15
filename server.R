library(shiny)
library(ggplot2)
library(dplyr)
file <- ".//R//san_fran_employment_app//Full_Time_Employees_By_Job_Classification.csv"
data <- read.csv(file, header = TRUE, sep = ",", quote = "\"", colClasses = c("character","character","numeric","numeric","numeric"))
data <- tbl_df(data)
data <- filter(data, data[3] > 0, data[4] > 0 )
data <- filter(data, !is.na(as.numeric(data$Job.Code)))
data$Job.Code <- as.numeric(data$Job.Code)
data$Job.Code <- (data$Job.Code %% 100)*100
