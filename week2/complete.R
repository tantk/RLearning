require(data.table)
complete<-function(directory,id=1:332)
{
  count_complete <- function(fname) sum(complete.cases(read.csv(fname)))
  files<-dir(directory,pattern='\\.csv',full.names = TRUE)
  data.frame(id = id, nobs = unlist(lapply(files[id], count_complete)))
}
