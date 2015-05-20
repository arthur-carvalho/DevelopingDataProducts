# Loading libraries
library(rpart)
library(rpart.plot)
library(shiny)


#Setting working directory
setwd("C:/Users/56387aco/Google Drive/Erasmus University/Teaching/Big Data and Business Analytics/Course Documents/Sessions/OLD/ME011session01/Example1")


# Reading data
data_train <- read.csv("train.csv", stringsAsFactors = TRUE)
data_test  <- read.csv("test.csv", stringsAsFactors = TRUE)


# building a decision tree
tree <- rpart(target ~ ., data=data_train, method="class")


#plotting the tree
rpart.plot(tree, box.col=c("pink", "palegreen3")[tree$frame$yval], uniform = TRUE, varlen = 0, faclen = 0, cex = TRUE)


# Performance of the tree on the training set
results <- data.frame(Prediction = predict(tree, data_train, type = "class"), Reality = data_train[,"target"])
with(results, prop.table(table(Prediction, Reality)))


# Performance of the tree on the test set
results <- data.frame(Prediction = predict(tree, data_test, type = "class"), Reality = data_test[,"target"])
with(results, prop.table(table(Prediction, Reality)))


#Saving the decision tree
saveRDS(tree, "tree.rds")

#deployment
runApp("App-1")
runApp("App-1", display.mode = "showcase")