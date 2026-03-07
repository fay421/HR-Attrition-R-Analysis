---
title: "R Notebook"
output: html_notebook
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code. 

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*. 

```{r}
plot(cars)
```

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.
#1_Read File
```{r}
hrdata <- read.csv("HR-Employee-Attrition.csv")
View(hrdata)
```
#2_Create a list of numeric columns
```{r}
num_cols <- c("Age","DailyRate","DistanceFromHome","Education",
"HourlyRate","MonthlyIncome","MonthlyRate","NumCompaniesWorked","TotalWorkingYears",
"TrainingTimesLastYear")
View(num_cols)
```
#3_Filter the data
```{r}
hrdata_num <- hrdata[,num_cols]
View(hrdata_num)
```
#4_Run the correlation matrix
```{r}
cor(hrdata_num)
```
#5_ Pairplot (MonthlyIncome,Age,Education)
```{r}
pairs(~MonthlyIncome+Age+Education,data=hrdata,main="Scatterplot Matrix")
```
#6_ Pairplot (MonthlyIncome,Age,TotalWorkingYears)
```{r}
pairs(~MonthlyIncome+Age+TotalWorkingYears,data=hrdata,
      main = "Scatterplot Matrix")
```
#7_Manipulating Data:Factor Function for hrdata$Education

```{r}
View(hrdata)
hrdata$Education <-factor(hrdata$Education,levels = 1:5,labels = c("Below College",
"College","Bachelor","Master","Doctor"),ordered = TRUE)
View(hrdata)
```
#8_ Boxplot1: Age by Education
```{r}
boxplot(Age ~ Education, data=hrdata,
        main= "Age by Education Level",
        xlab = "Education",
        ylab = "Age",
        outline = TRUE,
        pch=1)
```

#9_ Boxplot2: Total Working Years by Education
```{r}
boxplot(TotalWorkingYears ~ Education, data=hrdata,main="Total Working Years by Education Level",xlab= "Education",ylab = "Total Working Years",
        outline = TRUE,
        pch = 1)
```
#10_ Boxplot3: Monthly Income by Education
```{r}
boxplot(MonthlyIncome ~ Education,
        data=hrdata,
        main= "Monthly Income by Education Level",
        xlab = "Education", ylab = "MonthlyIncome",
        outline = TRUE,
        pch = 1)
```
#11_Boxplot4:Age by Attrition

```{r}
boxplot(Age ~ Attrition,
       data= hrdata,
       main="Age Distribution by Atttrition",
       xlab = "Attrition Status",
       ylab = "Age",outline = TRUE,pch = 4)
```
#12_Manipulating Data:yes_attrition_age,no_attrition_age
```{r}
yes_Age <- hrdata[(hrdata$Attrition == "Yes"), 'Age']
no_Age <- hrdata[(hrdata$Attrition != "Yes"), 'Age']
```

#13_T.test for yes_Age and no_Age
```{r}
t.test(yes_Age,no_Age)
```
#14_Manipulating Data:yes_empno , no_empno
```{r}
yes_empno <- hrdata[(hrdata$Attrition == "Yes"),'EmployeeNumber']
no_empno <- hrdata[(hrdata$Attrition != "Yes"),'EmployeeNumber']
```

#15_T.test for yes_empno , no_empno
```{r}
t.test(yes_empno,no_empno)
```
#16_Linear Regression: MonthlyIncome , Age
```{r}
model_1 <- lm(MonthlyIncome ~ Age, data=hrdata)
summary(model_1)
```
#17_# Multiple Linear Regression: MonthlyIncome , Age, TotalWorkingYears
```{r}
model_2 <- lm(MonthlyIncome ~ Age+ TotalWorkingYears, data=hrdata)
summary(model_2)
```














