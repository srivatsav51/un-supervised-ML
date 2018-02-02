#Load the data set
df1<-read.csv("http://rosetta.reltech.org/TC/v15/Mapping/data/dist-Aus.csv")

df1

#Code to remove a column
df1[1]<-NULL

fit<-cmdscale(df1,eig = TRUE,k=2)
x<-fit$points[,1]
y<-fit$points[,2]

plot(x, y, pch = 19, xlim = range(x) + c(0, 600))

city.names <- c("Adelaide", "Alice Springs", "Brisbane", "Darwin", "Hobart", 
                "Melbourne", "Perth", "Sydney")
text(x, y, pos = 4, labels = city.names)
#Performing MDS using I graph in R

library(igraph)
g<-graph.full(nrow(df1))
V(g)$label<-city.names
l1<-layout.mds(g,dist=as.matrix(df1))
plot(g, layout = l1, vertex.size = 3)
class(g)
