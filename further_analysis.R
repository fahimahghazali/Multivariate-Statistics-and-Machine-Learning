install.packages("palmerpenguins")

penguins = palmerpenguins::penguins
head(penguins)
X.penguins = data.frame(na.omit(penguins))
X.penguins[, "species_sex"] <- rep(NA, nrow(X.penguins))

f = 0
for (j in factor(X.penguins$species)){
  for (k in factor(X.penguins$sex)) {
    ind <- which(X.penguins$species == j & X.penguins$sex == k)
    f <- paste(j, k, sep = "_")
    X.penguins[ind, "species_sex"] <- f
  }
}

X.penguins$species_sex <- as.factor(X.penguins$species_sex)


head(X.penguins)

set.seed(432)
Xpen = scale(X.penguins[,3:6], scale = T)
kmc3 = kmeans(Xpen, 3)



kmc6 = kmeans(Xpen, 6)
par(mfrow=c(1,2), mai = c(0.8, 0.8, 0.5, 0.3))
plot(Xpen[,1],Xpen[,2], col = kmc3$cluster, pch = as.integer(X.penguins$species), 
     main = "K-means clusters vs known species", 
     xlab = "bill length/mm", ylab = "bill depth/mm")
legend("bottomleft", legend = c(unique(X.penguins$species)), 
       pch = as.integer(unique(X.penguins$species)), bty = "o", cex = 0.9)
legend("bottomright", legend = c("Cluster 1", "Cluster 2", "Cluster 3"), 
       col = as.integer(unique(kmc3$cluster)), bty = "o", cex = 0.9, lty = 1)

plot(Xpen[,1],Xpen[,2], col = kmc6$cluster, pch = as.integer(X.penguins$species_sex), 
     main = "K-means clusters vs known species and sex", 
     xlab = "bill length/mm", ylab = "bill depth/mm")
legend("bottomleft", legend = c(unique(X.penguins$species_sex)), 
       pch = as.integer(unique(X.penguins$species_sex)), bty = "o", cex = 0.9)
legend("bottomright", legend = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6"), 
       col = as.integer(unique(kmc6$cluster)), bty = "o", cex = 0.9, lty = 1)

addmargins(table(X.penguins$species, kmc3$cluster))
addmargins(table(X.penguins$species_sex, kmc6$cluster))

maxk = 10 
bssvec = numeric(maxk) 
wssvec = numeric(maxk) 
for (k in 1:maxk) {
  kmcn = kmeans(Xpen, k) 
  bssvec[k] = kmcn$betweenss
  wssvec[k] = kmcn$tot.withinss 
}
par(mfrow=c(1,1))
plot(1:maxk, bssvec, type="b", xlab="no of groups", ylab="Within/between Group SS", main="")
points(1:maxk, wssvec, type="b", col=2, lty="dashed", pch=2)
legend("right", c("Between SS (explained)", "Within SS (unexplained)"), col=c(1,2), pch=c(1,2))






