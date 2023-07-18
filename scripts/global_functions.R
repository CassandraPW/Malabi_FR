multmerge = function(mypath,mypattern){
  filenames=list.files(path=mypath, pattern=mypattern, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
  Reduce(function(x, y) merge(x, y, all = TRUE), datalist)
}

standarderror <- function(x) {sd(x, na.rm=T)/sqrt(sum(!is.na(x)))}
#sw_allErrorNorms


Malabi<-function(data_path,test,subject,grade){
  d <- read.csv(paste0(data_path,test,"_screener_",subject,".csv"))
  norms <- read.csv("3_stim/malabi_norms_g67.csv") 
  dysTypes <- read_excel("3_stim/malabi_errorcodes_french.xlsx")
  norms<-norms[(norms$grade==grade),]
  
  if (test=="sw"){### Find the norms for each errorcode. ###
    dys_code_list <- unique(c(as.list(dysTypes$code[dysTypes$test==test]))) 
    d_wide<-as.data.frame(sapply(dys_code_list, function(i){ x<-ifelse(grepl(pattern=i, d$error_code), 1, 0)}))
    colnames(d_wide)<- dys_code_list
    ndf<- d_wide %>% 
      pivot_longer(cols = c(colnames(d_wide)), names_to = "variable", values_to = "value")
  }
  if (test=="pw"){
    #dys_code_list <- unique(c(as.list(norms$code))) 
    dys_code_list <- unique(c(as.list(dysTypes$code[dysTypes$test==test])))  
    d_wide<-as.data.frame(sapply(dys_code_list, function(i){ x<-ifelse(grepl(pattern=i, d$error_code), 1, 0)}))
    colnames(d_wide)<- dys_code_list
    ndf<- d_wide %>% 
      pivot_longer(cols = c(colnames(d_wide)), names_to = "variable", values_to = "value")
  }
  if (test=="wp"){
    dys_code_list <- unique(c(as.list(dysTypes$code[dysTypes$test==test])))
    d_wide<-as.data.frame(sapply(dys_code_list, function(i){ x<-ifelse(grepl(pattern=i, d$error_code), 1, 0)}))
    colnames(d_wide)<- dys_code_list
    ndf<- d_wide %>% 
      pivot_longer(cols = c(colnames(d_wide)), names_to = "variable", values_to = "value")
  }
    x<- aggregate(value~variable, ndf, sum)
    colnames(x)<- c("code", "count")
    x<- merge(x, dysTypes[dysTypes$test==test, ])
    xx<- aggregate(count~label, x, sum)
    
    wup<- merge(xx, norms, by.x = "label", by.y = "dyslexia")
    #wup$label <- factor(wup$label, levels=c("attention","letter position","letter_doubling","neglect","visual","phonological","surface","deep"),ordered=TRUE) 
    #wup <- wup[wup$label!="letter_doubling", ]
    print(wup$label[wup$count >= wup$CRAW])
    return(wup)
}


#Crawford and Howell single subject Dys test.
CrawfordHowellData <- function(case, control){
  tval <- (case - mean(control)) / (sd(control)*sqrt((length(control)+1) / length(control)))
  degfree <- length(control)-1
  #pval <- 2*(1-pt(abs(tval), df=degfree)) #two-tailed p-value
  pval <- (1-pt(abs(tval), df=degfree)) #one-tailed p-value
  result <- data.frame(t = tval, df = degfree, p=pval)
  return(result)
}

#Crawford and Howell single subject Dys test, when you only have the mean, SD and N for the control
CrawfordHowellSingle <- function(case, controlMean, controlSD, controlN){
  tval <- (case - controlMean) / (controlSD*sqrt((controlN+1) / controlN))
  degfree <- controlN-1
  #pval <- 2*(1-pt(abs(tval), df=degfree)) #two-tailed p-value
  pval <- (1-pt(abs(tval), df=degfree)) #one-tailed p-value
  result <- data.frame(t = tval, df = degfree, p=pval)
  return(result)
}
