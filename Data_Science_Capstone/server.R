library(shiny)
library(stylo)
library(tm)
library(stringr)
library(stringi)
source("Global.R")
# load("NgramTable.RData")
load("TrigramTable.RData")

shinyServer(function(input, output) {
  output$value <- renderPrint({input$text})
  
  pt <- reactive({
    text <- input$text
    InputWords <- TextInput(text)
    n <- length(InputWords)
    pt <- NextWordPrediction(n, InputWords)})
  
  output$prediction <- renderPrint(pt())
})