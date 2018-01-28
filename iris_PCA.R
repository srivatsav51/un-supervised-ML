data("iris")

colnames(iris)

x<-iris[,c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')]

y<-iris[,c('Species')]

mean_vec<-colMeans(x)

#Mean normalizing iris dataset, this is an essential pre-processing step for PCA
scaled_x <- scale(x)


#Verifying whether the mean normalization went well
colMeans(scaled_x)

apply(scaled_x, 2, sd)

#Find the co-variance matrix
cov_mat<-cov(scaled_x)

#Find eigen values from co-variance matrix
ev<-eigen(cov_mat)

ev$values

#Find the projection from the eigen vectors and mean normalized data
as.matrix(scaled_x)%*%ev$vectors[,c(1,2)]

