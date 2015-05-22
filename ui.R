## Loading libraries
library(shiny)
library(ggplot2)
library(HSAUR)

shinyUI (fluidPage (
    
    titlePanel("Understanding your Treatment Options"),
    
    sidebarLayout(
        sidebarPanel( 
            h4("Have you ever wondered which treatment option is right for you?"),
            br (),
            p ("Use this simple tool to view how 100 patients did
               over the course of 8 months of treatment."),
            p ("You can select the month using the slider to the right,"),
            p ("or you can select the 'play' option to animate the results.")
            ),
        mainPanel( 
            h4("       Treatment Time (in months)"),
            shiny::column(2, offset = 2,
            sliderInput("slider1", 
                        label = "", 
                        min = 0, 
                        max = 8, 
                        value = 0, 
                        step=2, 
                        animate=TRUE)
            ), ## end shiny
            plotOutput ('outcomes')
        ) ## End mainPanel
    ) ## End sidebarLayout
) ## end fluidPage
) ## end ShinyUI
