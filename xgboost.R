#################################################################################################
#################################################################################################
## Author: Bikash Agrawal
## Date: 12th March Feb 2015
## Email: er.bikash21@gmail.com
## Description: Random Forest to classify product in Otto Group Kaggle Product classification competition.
##     https://www.kaggle.com/c/walmart-recruiting-sales-in-stormy-weather
##
## References: 
## [1] http://dnene.bitbucket.org/docs/mlclass-notes/lecture16.html
## [2] 
## 
#################################################################################################
#################################################################################################

### setting path of repo folder.
getwd()
setwd("/Users/bikash/repos/kaggle/ProductClassification/")
#----------Load Package----------------------------
# library(data.table)
# library(doMC)
# library(doParallel)
# library(lattice)
# library(randomForest)
library(xgboost)
library(FeatureHashing)

#registerDoParallel(cores = 4)

#------------------Read Data-----------------------
Train <- read.csv("data/Train.csv",)
Train < as.matrix.data.frame(Train)
dtrain <- xgb.DMatrix(data=Train)



Test <- read.csv("data/Test.csv")


dtrain <- xgb.DMatrix(data=as.matrix(Train))
#-----------------error calculation ---------------------------------------------
RMSLE <- function(pred,act){
  if (length(pred) == length(act)){
    return( sqrt( (1/length(pred)) * sum(   (log(pred+1) - log(act+1))^2  ) ) )
  }else return("not equal length")}

#---------------------------------------------------------------------------------------------