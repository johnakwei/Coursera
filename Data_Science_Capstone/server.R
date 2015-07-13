library(shiny)
library(stylo)
library(tm)
library(stringr)
library(stringi)
source("Global.R")
load("NgramTable.RData")

shinyServer(function(input, output) {
  output$value <- renderPrint({ input$text })
  
  pt <- reactive({
    text <- input$text
    ipt <- clean_ipt(text)
    n <- length(ipt)
    pt <- NextWordPrediction(n, ipt)})
  
  output$prediction <- renderPrint(pt())
})