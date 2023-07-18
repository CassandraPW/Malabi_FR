# -------------------------------
# Title: Error coding coding responses
# Author: Cassandra Potier Watkins

# This script cross-checks responses against the 'coded_response_error.csv' database to identify unrecorded error types. Any missing errors should be manually added following a two-person blind check
# ------------------------------- 

# Load required packages
# -------------------------------
library(readr) ; library(readxl) ; library(dplyr)

# Load data
# -------------------------------
path <- "write your path"
test <- "malabi"
subj <- "file name of the subject"
cre <- read_csv("data/coded_response_errors_french2.csv")
data <- read_excel(paste0(path,test,"_",subj,".xlsx"))

# Add errors
# -------------------------------
d_coded<-merge(data, cre, by.x = c("subtest","order","item","response"), by.y = c("subtest","order","item","response"), all.x = TRUE)

# Are there responses that have not been coded for ?
x<- d_coded[!is.na(d_coded$response)&is.na(d_coded$error_code),] 
### If EMPTY, than there are no new response errors to add and you can stop here!
### If NOT EMPTY, make a file of the new errors to code, check that they are truly errors,then add to 'coded_response_errors_french.csv'.
# write.csv(x, "data/new_errors.csv", row.names = FALSE)

# Save the coded responses.
# -------------------------------
write.csv(d_coded, "data/[subject name].csv", row.names = FALSE) 



### If NOT EMPTY, make a file of the new errors to code, then add to 'coded_response_errors_french.csv'.
#write.csv(x, "3_stim/new_errors.csv", row.names = FALSE)

write.csv(d_coded, paste0(path,test,"_",subj,".csv"), row.names = FALSE) 
