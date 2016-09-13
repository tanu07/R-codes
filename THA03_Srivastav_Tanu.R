
#Set the working directory
wd = "C:\\Users\\consult\\Desktop\\Fall 2016\\RandPyth\\THA\\THA3"
setwd(wd)

#install.packages("psych")
#install.packages("ggplot2")
#install.packages("Hmisc")

#library(foreign)
library(psych)

#Read the file
temp = paste(wd, "\\hospital_employee_data.txt", sep="")
hospital_data = read.table(temp, header =T, sep="\t")

#Structure of the data
str(hospital_data)

#Subsetting numeric columns for Principal Component Analysis
hospital_data.pca = hospital_data[c("NoFTE", "NetPatRev", "InOperExp",
 "OutOperExp", "OperRev", "OperInc","AvlBeds", "Compensation", "MaxTerm")]


#PCA model with loadings
pcamodel_reduc = princomp(hospital_data.pca,cor=TRUE)			
pcamodel_reduc

summary(pcamodel_reduc)


#Screenplot
plot(pcamodel_reduc,main="Screeplot")

cor(hospital_data.pca)

#Subset data for Factor Analysis
hospital_data.fa = hospital_data[c("NoFTE", "NetPatRev", "InOperExp",
 "OutOperExp", "OperRev","AvlBeds", "Compensation", "MaxTerm")]


#Factor Analysis with 2 factors
reduction.FA2 = factanal(~NoFTE+NetPatRev+InOperExp+OutOperExp+OperRev+AvlBeds+Compensation+MaxTerm,
factor=2,
rotation="varimax",
scores="none",
data=hospital_data.fa)

reduction.FA2



