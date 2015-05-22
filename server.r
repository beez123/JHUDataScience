## Loading libraries
library(shiny)
library(ggplot2)
library(HSAUR)

shinyServer (function(input,output) {
        
        ## creates the correct string for the dataset based upon the slider input
        bdiData <- reactive ({
            if (input$slider1 == 0) return("bdi.pre")
            else paste0("bdi.", input$slider1, "m")
        }) ## end 
        
        ## Function to create a plot based upon the selection of 
        myPlot <- function (df, x_string, y_string, fill_string) {
            ggplot (data=df, 
                    aes_string(x=x_string, 
                        y=y_string, 
                        fill=fill_string)) + 
                geom_boxplot () + 
                ylab ("Beck Depression Inventory II") + 
                xlab ("Drug Treatment Group") + 
                ggtitle ("Comparing Standard Treatment with Beat the Blues Treatment") + 
                scale_fill_discrete(name="Treatment Group", 
                                    labels=c("Standard", "Beat the Blues")) +
                ylim (0,55)
        } # end myplot
        
        
        output$outcomes <- renderPlot ({
            myPlot (BtheB,"drug", bdiData(), "treatment")
       }) ## end of output$outcomes 
       
  }   ## end function
) ## end ShinyServer