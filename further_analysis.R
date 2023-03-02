install.packages("palmerpenguins")
remotes::install_github("allisonhorst/palmerpenguins")

head(penguins)
X.penguins = data.frame(na.omit(penguins))
X.penguins[, "species_sex"] <- rep(NA, nrow(X.penguins))

levels(X.penguins$species_sex)[levels(X.penguins$species_sex)== "Adelie"
                               & levels(X.penguins$species_sex)== "female"] <- "Adelie_f"

X.penguins[X.penguins$species == "Adelie" & X.penguins$sex == "female", ]
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

set.seed(543261)
Xpen = scale(X.penguins[,3:6], scale = T)
kmc3 = kmeans(Xpen, 3)



kmc6 = kmeans(Xpen, 6)
par(mfrow=c(1,2), mai = c(0.8, 0.8, 0.5, 0.3))
plot(Xpen[,3],Xpen[,4], col = kmc3$cluster, pch = as.integer(X.penguins$species), 
     main = "K-means clusters vs known species", 
     xlab = "flipper length/mm", ylab = "body mass/g")

plot(Xpen[,3],Xpen[,4], col = kmc6$cluster, pch = as.integer(X.penguins$species_sex), 
     main = "K-means clusters vs known species and sex", 
     xlab = "flipper length/mm", ylab = "body mass/g")


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
legend("right", c("Between SS (explained)", "Within SS (unexplained)"), col=c(1,2), pch=c(1,2), cex = 0.7)
