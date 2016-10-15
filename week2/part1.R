require(data.table)
pollutantmean<-function(directory,pollutant,id=1:332)
{

  files<-dir(directory,pattern='\\.csv',full.names = TRUE)
  combineTable<-lapply(files[id],read.csv)
  combinedTable<-rbindlist(combineTable)
  mean(combinedTable[[pollutant]],na.rm = TRUE)
}