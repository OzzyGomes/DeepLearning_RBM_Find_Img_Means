install_github("TimoMatzen/RBM")

library("devtools")

#Mostrar pacote no GITHUB
#https://github.com/TimoMatzen/RBM

#install_github("TimoMatzen/RBM")
library("RBM")

data("MNIST")


image(matrix(MNIST$trainX[3,1], nrow = 28))

#Treina o Madelo
set.seed(0)

train <- MNIST$trainX

modelRBM <- RBM(x=train, n.iter = 1000, n.hidden = 100, size.minibatch = 10, plot = TRUE)
