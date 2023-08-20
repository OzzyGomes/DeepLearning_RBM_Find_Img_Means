install_github("TimoMatzen/RBM")

library("devtools")

#Mostrar pacote no GITHUB
#https://github.com/TimoMatzen/RBM

#install_github("TimoMatzen/RBM")
library("RBM")

data("MNIST")


image(matrix(MNIST$trainX[3,1], nrow = 28)) # apenas um teste

#Treina o Madelo
set.seed(0)

train <- MNIST$trainX
#                     numero de epocas  camadas escodicas
modelRBM <- RBM(x=train, n.iter = 1000, n.hidden = 100, size.minibatch = 10, plot = TRUE)

#reconstroi a imagem
set.seed(0)

testx <- MNIST$testX
testy <- MNIST$testY

#peguei como exemplo no testy o numero 8 e ciente que é numero 8, fiz o teste abaixo
ReconstructRBM(test = testx[5, ], model = modelRBM)


# DBN
set.seed(0)

#como se trata de uma rede não supervisionada o target é o proprio x
train <- MNIST$trainX
test <- MNIST$testX

#fazendo o empilhamento de camadas para um resultado mais acurado.
#                                 camadas escondidas          epocas        tamanho usado no treino    
modStack <- StackRBM(x = train, layers = c(100, 100, 100), n.iter = 1000, size.minibatch = 10)

ReconstructRBM(test = test[5, ], model = modStack, layers = 3)
