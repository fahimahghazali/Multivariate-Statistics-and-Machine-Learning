pen = load("penguins.rda")
pairs(X.penguins, labels= c("Bill Length/mm", "Bill depth/mm", "Flipper Length/mm", "Body Mass/g"))
par(mfrow=c(1,4))
boxplot(X.penguins[,1], ylab = "Bill length /mm")
boxplot(X.penguins[,2], ylab = "Bill depth /mm")
boxplot(X.penguins[,3], ylab = "Flipper length /mm")
boxplot(X.penguins[,4], ylab = "Body mass /g")

eigen(cov(X.penguins))$values

set.seed(543261)
Xpen = scale(X.penguins[,1:4], scale = T)
kmc = kmeans(Xpen, 3)
par(mfrow=c(1,2), mai = c(0.8, 0.8, 0.5, 0.3))
plot(Xpen, col = kmc$cluster, pch = as.integer(L.species)+14, main="", xlab = "bill length/mm", ylab = "bill depth/mm")
plot(Xpen, col = kmc$cluster, pch = as.integer(L.islands)+14, main="", xlab = "bill length/mm", ylab = "bill depth/mm")

addmargins(table(L.species, kmc$cluster))
addmargins(table(L.islands, kmc$cluster))


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





