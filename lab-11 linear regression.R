dataset=read.csv('C:/Users/Student/Downloads/salary.csv')
dataset
> library(caTools)
> split=sample.split(dataset$Salary,SplitRatio = 0.7)
> trainingset = subset(dataset,split == TRUE)
> testset = subset(dataset,split == FALSE)
> lm.r = lm(formula = Salary ~ YearsExperience,data=trainingset)
> coef(lm.r)
(Intercept) YearsExperience 
24898.769        9538.685 
> ypred = predict(lm.r,newdata = testset)
> install.packages("ggplot2")
> library("ggplot2", lib.loc="C:/Users/Student/AppData/Local/Programs/R/R-4.2.2/library")
> ggplot() + geom_point(aes(x = trainingset$YearsExperience,
                            +                           y = trainingset$Salary), colour = 'red') +
  +     geom_line(aes(x = trainingset$YearsExperience,
                      +                   y = predict(lm.r, newdata = trainingset)), colour = 'blue') +
  +     
  +     ggtitle('Salary vs Experience (Training set)') +
  +     xlab('Years of experience') +
  +     ylab('Salary')
> ggplot() +
  +     geom_point(aes(x = testset$YearsExperience, y = testset$Salary),
                   +                colour = 'red') +
  +     geom_line(aes(x = trainingset$YearsExperience,
                      +                   y = predict(lm.r, newdata = trainingset)),
                  +               colour = 'blue') +
  +     ggtitle('Salary vs Experience (Test set)') +
  +     xlab('Years of experience') +
  +     ylab('Salary')