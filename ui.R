# ui.R
# Author: dnaeye (https://github.com/dnaeye)
# Version: 1.0
# Created: 11/6/2014
# This is a simple user interface for predicting the iris species
# based on user inputted variables.

shinyUI(fluidPage(
    titlePanel("Iris Classifier"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Enter your iris's measurements to determine its 
                     species. Source: ", a("UCI Machine Learning Repository",
                     href="https://archive.ics.uci.edu/ml/datasets/Iris")),
            
            # user input for petal length
            numericInput('plength','Petal Length (cm):',
                         1,min=1,max=7,step=0.5),
            
            # user input for petal width
            numericInput('pwidth','Petal Width (cm):',
                         0.1,min=0.1,max=2.5,step=0.1)
        ),
        
        # output tree map based on user input
        mainPanel(
            h4('Decision Tree'),
            plotOutput("tree"),
            h4('The predicted iris species is: '),
            verbatimTextOutput("prediction")
            )
    )
))
