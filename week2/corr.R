
corr<-function(directory,threshold=0)
{corrr=numeric()
  count_complete <- function(fname)
  {
    
    data<-read.csv(fname)
    if(sum(complete.cases(data))>threshold)
    {
      completedata<-data[complete.cases(data),]
      corrr=c(corrr,cor(completedata$sulfate,completedata$nitrate, use="pairwise.complete.obs"))
    }
    
  }
  files<-dir(directory,pattern='\\.csv',full.names = TRUE)
  combinedTable<-unlist(lapply(files,count_complete))
}
