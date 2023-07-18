## This script lets you run through the responses and check that we have recorded all of the
## types of errors made in our 'coded_response_error.csv' database. Missing errors should be added by hand with a two person blind check.

#Libraries
library(readr) ; library(readxl) ; library(dplyr)
path <- "4_participants/Normals/"
test <- "malabi"
subj <- "college2018"

cre <- read_csv("3_stim/coded_response_errors_french2.csv")
data <- read_excel(paste0(path,test,"_",subj,".xlsx"))

#Add error codes.
d_coded<-merge(data, cre, by.x = c("subtest","order","item","response"), by.y = c("subtest","order","item","response"), all.x = TRUE)
# Are there responses that have not been coded for ?
x<- d_coded[!is.na(d_coded$response)&is.na(d_coded$error_code),] 
### If EMPTY, than there are no new response errors to add and you can stop here!
### If NOT EMPTY, make a file of the new errors to code, then add to 'coded_response_errors_french.csv'.
#write.csv(x, "3_stim/new_errors.csv", row.names = FALSE)

write.csv(d_coded, "bisqert.csv", row.names = FALSE) 



################ CERENE Single Participants ###############
#Libraries
library(readr) ; library(readxl) ; library(dplyr)
path <- "4_participants/Cerene/"
test <- "malabi"
subj <- "tr"

cre <- read_csv("3_stim/coded_response_errors_french2.csv")
data <- read_excel(paste0(path,test,"_",subj,".xlsx"))

#Add error codes.
d_coded<-merge(data, cre, by.x = c("subtest","order","item","response"), by.y = c("subtest","order","item","response"), all.x = TRUE)
# Are there responses that have not been coded for ?
x<- d_coded[!is.na(d_coded$response)&is.na(d_coded$error_code),] 
### If EMPTY, than there are no new response errors to add and you can stop here!
### If NOT EMPTY, make a file of the new errors to code, then add to 'coded_response_errors_french.csv'.
#write.csv(x, "3_stim/new_errors.csv", row.names = FALSE)

write.csv(d_coded, paste0(path,test,"_",subj,".csv"), row.names = FALSE) 
