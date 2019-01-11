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
  titlePanel("Plot Random Numbers"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric","How many random numbers should be plotted?",value=1000,min=1,max=1000,step=1),
      sliderInput("sliderX","Pick Minimum and Maximum X Values",-100,100,value=c(-50,50)),
      sliderInput("sliderY","Pick Minimum and Maximum Y Values",-100,100,value=c(-50,50)),
      checkboxInput("show_xlab","Show/Hide X axis label",value=TRUE),
      checkboxInput("show_ylab","Show/Hide Y axis label",value=TRUE),
      checkboxInput("show_title","Show/Hide Title")
    ),
    mainPanel(h3("Graph of random points"),
              plotOutput("distPlot")
    
    )
  )
))
