#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Visualize Linear Models"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h3("Slope"),
       textOutput("slopeOut"),
       h3("Intercept"),
       textOutput("intOut")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot",brush = brushOpts(id="brush1"))
    )
  )
))
