library(shiny)
library(markdown)

shinyUI(navbarPage("Data Science Capstone Project",
          tabPanel("Text Prediction App",
                sidebarLayout(
                  sidebarPanel(
                    textInput("text", label=h3("Text input"), value="Enter your text here...")
                              ),
                              
                  mainPanel(
                    h4('Text entered:'),
                    verbatimTextOutput("value"),
                    h4('Next word:'),
                    verbatimTextOutput("prediction"))
                    )),
          tabPanel("Graphs", wordcloud()),         
          tabPanel("About", includeMarkdown("about.Rmd"))
))