# server.R
# Author: dnaeye (https://github.com/dnaeye)
# Version: 1.0
# Created: 11/6/2014
# This is the backend Shiny server code for processing user input from
# the ui.R interface.

data(iris)
library(caret)
library(rattle)

# partition iris dataset into training (70% of total) and testing sets
inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
training <- iris[inTrain,]

# train decision-tree classifier on training data
modFit <- train(Species ~ ., method = "rpart", data=training)

shinyServer(
    function(input, output){ 
        
        output$tree <- renderPlot({
            fancyRpartPlot(modFit$finalModel, sub="")
#            plot(modFit$finalModel, uniform=TRUE)
#            text(modFit$finalModel, use.n=TRUE, all=TRUE, cex=0.8)
        })
        
        output$prediction <- renderPrint({
            testing <- matrix(c(0,0,input$plength,input$pwidth,NA),nrow=1)
            testing <- as.data.frame(testing)
            names(testing) <- names(training)            
            predict(modFit, newdata=testing)})
    }
)
