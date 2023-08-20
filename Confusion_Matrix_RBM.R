#### Teste 2 - Classificar imagens - Uso da Matriz de Confusão

library("devtools")
library("RBM")


#Vamos dar uma olhada na imagem
# visualize the digits
data(MNIST)
image(matrix(MNIST$trainX[102, ], nrow = 28))

MNIST$trainY[102]

#treina o modelo
set.seed(0)
trainX <- MNIST$trainX
trainY <- MNIST$trainY

modelClassRBM <- RBM(x = trainX, y = trainY, n.iter = 1000, n.hidden = 100, size.minibatch = 10)

# Acha matriz de confusão
set.seed(0)
testX <- MNIST$testX
testY <- MNIST$testY

p <- PredictRBM(test = testX, labels = testY, model = modelClassRBM)

p
