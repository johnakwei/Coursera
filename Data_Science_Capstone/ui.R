library(shiny)
library(wordcloud)

shinyUI(pageWithSidebar(
      headerPanel(h1("Next Word Prediction App - by ContextBase", style="color:lightgreen")),
      sidebarPanel(
      tags$head(tags$link(rel="stylesheet", type="text/css", href="bootstrap.css")),
      tags$style(type="text/css", ".shiny-output-error {visibility: hidden;}",
                ".shiny-output-error:before {visibility: hidden;}"),
      textInput("text", label=h3("Text Input:", style="color:lightblue" )),
      p("This Next Word Prediction Shiny App predicts text via
        Natural Language Processing, (as found in smartphone keyboard
        apps), and is my submission for the Coursera / Johns Hopkins
        University Data Science Capstone project."),
      helpText(HTML("About: <a href=\"http://www.rpubs.com/johnakwei/92825\"
                    target=\"_blank\">App Presentation</a>")),
      h3('Text Cloud:', style="color:lightgreen"),
      plotOutput("textCloud")
      ),
    mainPanel(
      h3('Text Entered:', style="color:lightblue", align="center"),
      h3(textOutput("value")),
      h3('Possible Next Words:', style="color:lightblue", align="center"),
      h3(uiOutput("nbest"), align="center"))
#       h3('Prediction Graph:', style="color:lightblue", align="center"),
#       h4(plotOutput("predictionGraph"), align="center"))
))