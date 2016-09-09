# R-codes
Descriptive Analytics In R

#Set working directory
wd = "C:\\Users\\Tanu\\Desktop\\R\\DescriptiveAnalytics"
setwd(wd)


#### Lines of code to install various packages
#install.packages("psych")		#Perform descriptive statistics
#install.packages("ggplot2")		#For advanced figures, plots, charts
#install.packages("Hmisc")		#Provides correlation matrix with significance values
#install.packages("RODBC")		#Provides an ODBC interface for R

#library(foreign)
#library(ggplot2)

#Check if a file exists prior to attempting to open it
file.exists("C:\\Users\\Tanu\\Desktop\\R\\DescriptiveAnalytics\\pollute_data")

#Importing data
pollute_data = read.table("C:\\Users\\Tanu\\Desktop\\R\\DescriptiveAnalytics\\pollute_data.txt", header=T, sep="\t")

#Names of the columns
names(pollute_data)

#Basic summary
summary(ozone_data)		

#Look at structure of data (i.e. datatypes)
str(pollute_data)				

#Number of missing values in each columns
sum(is.na(pollute_data$Pollution))
sum(is.na(pollute_data$Temp))
sum(is.na(pollute_data$Industry))
sum(is.na(pollute_data$Population))
sum(is.na(pollute_data$Wind))
sum(is.na(pollute_data$Wet.days))

#Number of Unique values in a column
rapply(pollute_data,function(x)length(unique(x)))

#Row 8, Column 1
pollute_data[8,1]

#Row 57, Column 4
pollute_data[57,4]


#What about a specific record? -Leave the column value blank
pollute_data[57,]

#if you want first three columns only
pollute_data[57,1:3]

pollute_data[57,c(1,2,3)]

pollute_data[57,c("Pollution","Temp","Industry")]

#Saving an entire column of data into a new dataframe:
pollute.data1 = pollute_data[,1]
pollte.data2 = pollute_data$Pollution

#Lets visualize out data through plots
boxplot(pollute_data)

pairs(pollute_data, panel=panel.smooth)

#Histogram
hist(pollute_data$Pollution, main="Pollution")

hist(pollute_data$Temp, main="Temp")

hist(pollute_data$Industry, main="Industry")

hist(pollute_data$Population, main="Population")

hist(pollute_data$Wind, main="Wind")

hist(pollute_data$Wet.days, main="Wet.days")



#check normality using QQ plot
qqnorm(pollute_data$Pollution)
qqline(pollute_data$Pollution, lty=2, main="Pollution")

qqnorm(pollute_data$Temp)
qqline(pollute_data$Temp, lty=2)

qqnorm(pollute_data$Industry)
qqline(pollute_data$Industry, lty=2)

qqnorm(pollute_data$Population)
qqline(pollute_data$Population, lty=2)

qqnorm(pollute_data$Wind)
qqline(pollute_data$Wind, lty=2)

qqnorm(pollute_data$Wet.days)
qqline(pollute_data$Wet.days, lty=2)

#Shapiro Wilk test for normality
shapiro.test(pollute_data$Pollution)
shapiro.test(pollute_data$Temp)
shapiro.test(pollute_data$Industry)
shapiro.test(pollute_data$Population)
shapiro.test(pollute_data$Wind)
shapiro.test(pollute_data$Wet.days)


#How about Skewness and Kurtosis
skew(pollute_data)
kurtosi(pollute_data)







