## start with loading libraries
library(foreign)
library(igraph)

# I renamed the trainingset 'ts' on my laptop
tr <- read.csv('ts.csv')

# select only numerical variables and create simple correlation Matrix
nums <- sapply(tr, is.numeric)
trNum <- tr[,nums]

# take out variables with too many missing values
misVar <- c('rmrev','retdays','rmcalls','rmmou')
good <- setdiff(names(tr), misVar)
trNUm <- trNum[,good]

# create a correlation matrix
corM <- cor(trNum, use= 'pairwise.complete.obs', method='spearman')

# Create a data-frame of variable pairs with the corralation in the third
# column.
# The dataframe is made of the upper triangle of the dataset, leaving 
# out double pairs and the diagonal.
pairs <- data.frame(row=rownames(corM)[row(corM)[upper.tri(corM)]], 
           col=colnames(corM)[col(corM)[upper.tri(corM)]], 
           corr=corM[upper.tri(corM)])

# select the dataset that contains only highly correlated pairs
hcp <- pairs[which(pairs$corr > 0.75),]

# build a graph 
hcpG <- graph.data.frame(hcp, directed = FALSE)

## some intermediary results
# plot the graph and saving it as a pdf
pdf('correlations.pdf')
plot(hcpG, vertex.label.cex=0.1, vertex.size=0.9, 
	vertex.label.family="Helvetica", vertex.color='black', 
	vertex.label.color='black', vertex.label.dist = 0.06, edge.width=0.1)
dev.off()
# return the number of variables that are highly correlated
length(V(hcpG))
# return the number of clusters of variables
clusters(hcpG)$no

## back to analyzing correlations
# decomposing the graph into subgraphs is the first step to
# finalizing the list of variables that need to be removed
d <- decompose.graph(hgpG
# return a nested list with the names of variables in each cluster
names <- lapply(d, get.vertex.attribute, name='name')
diameters <- lapply(d, diameter)




