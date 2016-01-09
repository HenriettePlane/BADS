## start with loading libraries
# library(foreign)
# library(igraph)





# # I renamed the trainingset 'ts' on my laptop
# tr <- read.csv('ts.csv')

# # select only numerical variables and create simple correlation Matrix
# nums <- sapply(tr, is.numeric)
# trNum <- tr[,nums]
# corM <- cor(trNum, use= 'pairwise.complete.obs', method='spearman')

# creates a data-frame of variable pairs with the corralation behind it
# the dataframe is made of the upper triangle of the dataset, leaving 
# out double pairs and the diagonal.
# pairs <- data.frame(row=rownames(corM)[row(corM)[upper.tri(corM)]], 
#            col=colnames(corM)[col(corM)[upper.tri(corM)]], 
#            corr=corM[upper.tri(corM)])

# # returns the number of pairs with a correlation
# # higher than 0.75, which is 418
# sum(pairs$corr > 0.75)

# # variables with too many missing inputs
# misVar <- c('rmrev','retdays','rmcalls','rmmou')

# # a way to select variables from the main dataset
# good <- setdiff(names(tr), misVar)
# test <- tr[,good] # returns the dataset without the bad vars

# select the dataset that contains only highly correlated pairs
hcp <- pairs[which(pairs$corr > 0.75),]

# build a graph 
hgpG <- graph.data.frame(hcp, directed = FALSE)

