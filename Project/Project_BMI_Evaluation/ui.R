#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(rCharts)
library(shiny)
library(datasets)
library(ISOcodes)
data(ISO_3166_1)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Body Mass Index Classification in Adults"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId="heightM", label="Your height in cm", value= 0,min=0),
      numericInput(inputId="weightM", label="Your weight in kg", value= 0,min=0),
      radioButtons(inputId="gender", label="Gender", choices=c("Female","Male")),
      selectInput(inputId="country", label="Country", choices=sort(ISO_3166_1$Alpha_3),
                  multiple = FALSE,selected="IND"),
      conditionalPanel(
        condition = "input.country == 'IND'",
        p("If you live in USA, please choose a state"),
        selectInput(inputId="state", label="State", choices=state.name,
                    multiple = FALSE,selected=NULL)),
      actionButton("goButton", "Go!"),
      br(),
      p(strong(em("Documentation:",a("Body Mass Index Classification in Adults",href="READMe.html")))),
      p(strong(em("Github repository:",a("Developing Data Products - Peer Assessment Project; Shiny App",
                                         href="https://github.com/CrazyFarang/DevelopingDataProducts"))))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
