library(shiny)
library(markdown)

shinyUI(pageWithSidebar(
    headerPanel("Next Word Prediction App - Data Science Capstone Project"),
      sidebarPanel(
      textInput("text", label=h3("Text Input:"), value="Enter your text here...")
    ),
    mainPanel(
      h4('Text Entered:'),
      verbatimTextOutput("value"),
      h4('Next Word:'),
      verbatimTextOutput("prediction"),
      p("This Next Word Prediction Shiny App predicts text via Natural Language Processing, as partially found in smartphone keyboard apps, and is my submission for the Coursera / Johns Hopkins University Data Science Capstone project."),
      p("In order to predict the next word inputted, the algorithm matches words, in combinations of one through three words, with example text from twitter, blogs, and news sources."),
      helpText(HTML("User Interface Source Code: <a href=\"https://github.com/johnakwei/Coursera/blob/Coursera/Data_Science_Capstone/ui.R\" target=\"_blank\">ui.R</a>")),
      helpText(HTML("Server Script Source Code: <a href=\"https://github.com/johnakwei/Coursera/blob/Coursera/Data_Science_Capstone/server.R\" target=\"_blank\">server.R</a>"))
      )
    ))