library(shiny)
library(wordcloud)

shinyUI(pageWithSidebar(
    headerPanel("Next Word Prediction App - Data Science Capstone Project"),
      sidebarPanel(
      textInput("text", label=h3("Text Input:"), value=" "),
      p("This Next Word Prediction Shiny App predicts text via Natural Language Processing, (as found in smartphone keyboard apps), and is my submission for the Coursera / Johns Hopkins University Data Science Capstone project."),
      # p("In order to predict the next word inputted, the algorithm matches words, (in combinations of one through three words), with example text from twitter, blogs, and news sources."),
      helpText(HTML("About: <a href=\"http://www.rpubs.com/johnakwei/92825\" target=\"_blank\">App Presentation</a>"))
    ),
    mainPanel(
      h4('Text Entered:'),
      verbatimTextOutput("value"),
      h4('Single Word Prediction:'),
      uiOutput("best"),
      h4('Other Possible Next Words:'),
      uiOutput("nbest")
      )
    ))