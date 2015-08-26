library(shiny)
library(stylo)
library(tm)
library(stringr)
library(stringi)
library(wordcloud)
library(RColorBrewer)
source("Global.R")
load("NgramTable.RData")
# load("TrigramTable.RData")

shinyServer(function(input, output) {
  output$value <- renderPrint({input$text})

  # Single Word Prediction
  prediction <- reactive({
    text <- input$text
    InputWords <- TextInput(text)
    n <- length(InputWords)
    prediction <- NextWordPrediction(n, InputWords)})
  
  # Other Next Word Predictions
  prediction2 <- reactive({
    text <- input$text
    InputWords <- TextInput(text)
    n <- length(InputWords)
    prediction2 <- NextWordPrediction2(n, InputWords)})
  
  output$best <- renderUI({ best <- prediction()
                             fluidRow( column(12, align="center"),
                             actionButton("NextWord", label=best)
                             )})
  
  output$nbest <- renderUI({ nbest <- prediction2()
                             fluidRow( column(12, align="center"),
                             actionButton("NextWord", label=nbest[2]),
                             actionButton("nbest2", label=nbest[3]),
                             actionButton("nbest3", label=nbest[4])
                             )})
  
  # Wordcloud
  output$textCloud <- renderPlot({
    text <- input$text
    Words <- TextInput(text)
    wordcloud(Words, scale=c(5, 0.5), min.freq=1, max.words=50, random.order=T,
              random.color=T, rot.per=0.35, use.r.layout=F,
              colors=brewer.pal(8, "Dark2"))})
})