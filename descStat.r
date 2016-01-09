## author: Jet van Genuchten
## email: jetvangenuchten@gmail.com

## This document contains a script to extract
## some descriptive statistics from our dataset
# library(foreign)

# callData <- read.csv('BADS - SWT - Trainingset - 2015-10-27.csv')

## sorting the data set alphabetically by column name so it's 
## easier to subset later
# callData <- callData[ ,order(names(callData))]
vars <- read.csv('varNames.csv')

## there are more variables in this set than in the description
## so remove all undescribed variables

# cdNames <- names(callData)
