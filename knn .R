#knn classification algorithm
data("iris")
str(iris)
table(iris$Species)
head(iris)
iris
summary(iris)
set.seed(9895)
a <- runif(nrow(iris))
a
iris <- iris[order(a),]
str(iris)
head(iris,10)
summary(iris[ ,c(1,2,3,4)])
normalize <- function (x){
  return((x - min(x))/(max(x) - min(x)))
}
normalize(c(1,2,3,4))
normalize(c(10,20,30,40,50))
iris_n <- as.data.frame(lapply(iris[,c(1,2,3,4)],normalize))
str(iris_n)
summary(iris_n)
iris_train <- iris_n[1:135, ]
iris_test <- iris_n[136:150, ]
iris_train_target <- iris[1:135,5]
iris_test_target <- iris[136:150,5]
require(class)
sqrt(150)
model <- knn(train = iris_train, test = iris_test, cl = iris_train_target, k=13)
model
#prediction comparison(confusion matrix)
f <- table(iris_test_target,model)
f
plot(f)
plot(model)

