library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Next Word Prediction App - Data Science Capstone Project"),
      sidebarPanel(
      textInput("text", label=h3("Text Input:"), value=" ")
    ),
    mainPanel(
      h4('Text Entered:'),
      verbatimTextOutput("value"),
      h4('Single Word Prediction:'),
      verbatimTextOutput("prediction"),
      h4('Other Possible Next Words:'),
      verbatimTextOutput("prediction2"),
      p("This Next Word Prediction Shiny App predicts text via Natural Language Processing, as found in smartphone keyboard apps, and is my submission for the Coursera / Johns Hopkins University Data Science Capstone project."),
      p("In order to predict the next word inputed, the algorithm matches words, in combinations of one through three words, with example text from twitter, blogs, and news sources."),
      helpText(HTML("About: <a href=\"http://www.rpubs.com/johnakwei/92825\" target=\"_blank\">App Presentation</a>")),
      helpText(HTML("User Interface Source Code: <a href=\"http://github.com/johnakwei/Coursera/blob/Coursera/Data_Science_Capstone/ui.R\" target=\"_blank\">ui.R</a>")),
      helpText(HTML("Server Script Source Code: <a href=\"http://github.com/johnakwei/Coursera/blob/Coursera/Data_Science_Capstone/server.R\" target=\"_blank\">server.R</a>"))
      )
    ))