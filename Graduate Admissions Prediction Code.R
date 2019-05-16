setwd("C:/Users/suvek.venugopal/Desktop/Graduate admissions") ## Initialising the directory##
data1<-read.csv("Admission_Predict.csv", sep = ",", header = T)
str(data1)
## Creating function to apply Yes/No condition to Admit chances##
admitchances<-function(x){if(x<0.5){data1$chances<-"no"}else{data1$chances<-"yes"}}
data1$chances<-sapply(data1$Chance.of.Admit, admitchances)
str(data1)
data1$chances<-as.factor(data1$chances)
## Summary of variables - First hand look of dataset ##
summary(data1)
## Caret Package for data partioning and Training ##
library(caret)
set.seed(32323)
inTrain<-createDataPartition(y = data1$chances, p = 0.7, list = F)
training<-data1[inTrain,]
testing<-data1[-inTrain,]
dim(training)
dim(testing)
## FeaturePlot gives first hand data visualisation account of given data ##
featurePlot(x = training[,c("GRE.Score", "TOEFL.Score","SOP","LOR","CGPA")], y = training$Chance.of.Admit, plot ="pairs")
## Below plots help in understanding relationships between data ##
library(ggplot2)
g1 = ggplot(data1, aes (x = GRE.Score, y = Chance.of.Admit, colour = SOP))+geom_point()+labs(title = "Admit_Chances vs GRE_Score")
g1<-g1+geom_smooth(method = "lm")
g1
g2 = ggplot(data1, aes (x = TOEFL.Score, y = Chance.of.Admit, colour = SOP))+geom_point()+labs(title = "Admit_Chances vs TOEFL_Score")
g2<-g2+geom_smooth(method = "lm")
g2
boxplot(Chance.of.Admit~SOP, data = data1)
g3 = ggplot(data1, aes(x = CGPA, y= Chance.of.Admit))+geom_point()+geom_smooth(method ="lm")
g3
  
## 3 ML classification algorithms shall be used for evaluating and prediction of output variable i.e. Chances of admission ##
## Naive Bayes Classification ##
model_naive<-naiveBayes(chances~., data = training)
preds_naive<-predict(model_naive, newdata = testing)
conf_matrix_naive<-table(preds_naive, testing$chances)
confusionMatrix(conf_matrix_naive)


## Random Forest Classification ##
library(randomForest)
model_rf<-randomForest(chances~.,data = training)
preds_rf<-predict(model_rf, newdata = testing)
conf_matrix_rf<-table(preds_rf, testing$chances)
confusionMatrix(conf_matrix_rf)

## Decision Trees Classification ##
library(rpart)
dt_training<-subset(training, select = -c(Chance.of.Admit))
dt_testing<-subset(testing, select = -c(Chance.of.Admit))
model_tree<-rpart(chances~.,data = dt_training, method = "class")
preds_tree<-predict(model_tree, newdata = testing, type = "class")
conf_matrix_tree<-table(preds_tree, dt_testing$chances)
conf_matrix_tree
confusionMatrix(conf_matrix_tree)


