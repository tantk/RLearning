best<-function(stateName=character(),outcomeName=character())
{
  ##read outcome data
  outcome<-read.csv("hospitalData/outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE )
  ## check that state and outcome are valid
  validState<-unique(outcome[,7])
  validOutcome<-c("heart attack","heart failure","pneumonia")
  
  if(!stateName %in% validState)
    stop("invalid state")
  if(!outcomeName %in% validOutcome)
    stop("invalid outcome")
  
  ##return hospital name in that state with the lowest 30-day death rate
  
}