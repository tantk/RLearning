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
  
  ##filter only the needed data
  outcome<-outcome[c(2, 7, 11, 17, 23)]
  names(outcome)[1] <- "name"
  names(outcome)[2] <- "state"
  names(outcome)[3] <- "heart attack"
  names(outcome)[4] <- "heart failure"
  names(outcome)[5] <- "pneumonia"
  
  ##return hospital name in that state with the lowest 30-day death rate

  outcome <-(outcome[outcome$state==stateName& outcome[outcomeName] != 'Not Available',])
  filterByOutcome <- outcome[, outcomeName]
  rowNum <- which.min(filterByOutcome)
  outcome[rowNum, ]$name
}

