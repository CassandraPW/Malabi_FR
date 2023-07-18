# The goal of this script is to assess the dyslexias of a student.

library(tidyr); library(readr); library(readxl)
#source("global_functions.R")
dysTypes <- read_excel("3_stim/malabi_errorcodes_french2.xlsx") 
#dysTypes<- dysTypes[dysTypes$dyslexia!="visual"|dysTypes$errorcode!="bom", ]
#dysTypes<- dysTypes[dysTypes$dyslexia!="visual"|dysTypes$errorcode!="bod", ]
#dysTypes<- dysTypes[dysTypes$dyslexia!="visual"|dysTypes$errorcode!="bsub", ]
norms <- read_csv("3_stim/malabi_norms_g67.csv")

# Put the single participant here.
source <- "marie"
subj <- "40KdGx"
grade <- 6

########################
a <- read_csv(paste0("6_data/",source,"/malabi_",subj,".csv"))
# Count the number of errors made by the subject for each error type.
dys_code_list <- unique(c(as.list(dysTypes$errorcode)))
dys_codes_wide <-sapply(dys_code_list, function(i){ x<-ifelse(grepl(pattern=i, a$errorcode), 1, 0)})
colnames(dys_codes_wide) <- dys_code_list
dys_codes_wide <- cbind(a[,c('subtest', 'id')], dys_codes_wide)

d_long <- dys_codes_wide %>% pivot_longer(!c("id", "subtest"), names_to="errorcode",values_to="count") %>%
  dplyr::group_by(id, subtest, errorcode) %>% 
  dplyr::summarize(errors = sum(count), .groups = 'drop')

d_long <- merge(d_long, dysTypes[,c("subtest", "errorcode","dyslexia")], by = c("subtest", "errorcode") ) 

# Add the subjects grade
d_long$grade <- grade

# Aggregate these error codes to the different dyslexias.
dyslexia_score <- aggregate(errors~ id + grade + subtest + dyslexia, d_long, sum)
dyslexia_score <- merge(dyslexia_score, norms[,c("grade","subtest","dyslexia","CRAW")] )

# Errors made for each dyslexia.
dyslexia_score$dyslexia<- factor(dyslexia_score$dyslexia, levels=c("attentional","letter_position","neglect","phonological",
                                                                   "visual","vowel", "deep","surface"), ordered = TRUE)
dyslexia_score %>%
  dplyr::select(subtest, dyslexia, errors) %>%
  dplyr::arrange(dyslexia) %>%
  pivot_wider(names_from = dyslexia, values_from = errors)

# Dyslexias found?
dyslexia_score[dyslexia_score$errors>=dyslexia_score$CRAW, ]





################## All ErrorCodes #############################@
# The goal of this script is to assess the dyslexias of a student.

library(tidyr); library(readr); library(readxl)

norms <- read_csv("3_stim/malabi_errorcodenorms_g67.csv")


########################
a <- read_csv(paste0("6_data/",source,"/malabi_",subj,".csv"))
# Count the number of errors made by the subject for each error type.
dys_code_list <- unique(c(as.list(norms$errorcode)))
dys_codes_wide <-sapply(dys_code_list, function(i){ x<-ifelse(grepl(pattern=i, a$errorcode), 1, 0)})
colnames(dys_codes_wide) <- dys_code_list
dys_codes_wide <- cbind(a[,c('subtest', 'id')], dys_codes_wide)
d_long <- dys_codes_wide %>% pivot_longer(!c("id", "subtest"), names_to="errorcode",values_to="count") %>%
  group_by(id, subtest, errorcode) %>% 
  summarise(errors = sum(count), .groups = 'drop')

# Add the subjects grade
d_long$grade <- grade

# Aggregate these error codes to the different dyslexias.
dyslexia_score <- aggregate(errors~ id + grade + subtest + errorcode, d_long, sum)
dyslexia_score <- merge(dyslexia_score, norms[,c("grade","subtest","errorcode","CRAW")] )

# Dyslexias found?
dyslexia_score[dyslexia_score$errors>=dyslexia_score$CRAW, ]
