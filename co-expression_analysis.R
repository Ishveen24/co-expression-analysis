rm(list=ls()) # Remove everything from the R environment. Important if you have some variables saved already.
setwd("/Users/ishveen/Downloads/counts_file") #Set your working directory where the files are.

setwd("/Users/ishveen/Documents/salmon_quant_darrowi/salmon_quant_darrowi_.")
myFiles <- list.files(pattern=glob2rx("*.sf"), # Create a vector containing the names of your files
                      all.files=T, 
                      full.names=F)

myFiles # myFiles is the list of files in your working directory which match the pattern *_counts

myData <- lapply(mySalmons, # Use list apply to apply the native R function read.table() to myFiles.
                 read.table, colClasses=c("character", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep="\t")

names(myData) <- c("quant_1","quant_2","quant_3","quant_4","quant_5","quant_6","quant_7","quant_8","quant_9","quant_10","quant_11","quant_12","quant_13","quant_14","quant_15","quant_16","quant_17","quant_18","quant_19","quant_20","quant_21","quant_22","quant_23","quant_24","quant_25","quant_26","quant_27","quant_28","quant_29","quant_30"
                   )
summary(myData) # Check out information about the list we created.

head(myData$quant_1) # Look at first ten lines of the leaf_1 file

tail(myData$ti) # Look at the last ten lines of the leaf_1 file. Notice there is some metadata printed there that we should remove or those will be counted as gene names and expression counts!

tpm_values = data.frame(row.names= myData$quant_1[,1],
                        quant_1 = myData$quant_1[,4],
                        quant_2 = myData$quant_2[,4],
                        quant_3= myData$quant_3[,4],
                        quant_4= myData$quant_4[,4],
                        quant_5= myData$quant_5[,4],
                        quant_6= myData$quant_7[,4],
                        quant_8= myData$quant_8[,4],
                        quant_9= myData$quant_9[,4],
                        quant_10= myData$quant_10[,4],
                        quant_11= myData$quant_11[,4],
                        quant_12= myData$quant_12[,4],
                        quant_13= myData$quant_13[,4],
                        quant_14= myData$quant_14[,4],
                        quant_15= myData$quant_15[,4],
                        quant_16= myData$quant_16[,4],
                        quant_17= myData$quant_17[,4],
                        quant_18= myData$quant_18[,4],
                        quant_19= myData$quant_19[,4],
                        quant_20= myData$quant_20[,4],
                        quant_21= myData$quant_21[,4],
                        quant_22= myData$quant_22[,4],
                        quant_23= myData$quant_23[,4],
                        quant_24= myData$quant_24[,4],
                        quant_25= myData$quant_25[,4],
                        quant_26= myData$quant_26[,4],
                        quant_27= myData$quant_27[,4],
                        quant_28= myData$quant_28[,4],
                        quant_30= myData$quant_30[,4],
                        quant_1= myData$quant_1[,4]
                       )





myData <- lapply(myData, rmLines) # Apply the rmLines() function to each object in the myData list.

nrow(myData$titan_stem_3) # Check to see how many lines there are in each element of myData now. There should be only 38,186
TPM_values <- data.frame(row.names=myData$quant_1[,1],
                     quant_1=myData$quant_1[,4],
                     )
View(tpm_values)
library(tidyr)
write.table(tpm_values, file="TPM_values_darrowi_sra.txt", quote=F, sep="\t", col.names=TRUE)
library(openxlsx)
write.xlsx(tpm_values, file="TPM_values_darrowi_sra.xlsx", rowNames=TRUE)

