# library(shiny)
# shinyUI(pageWithSidebar(
#   headerPanel("Data Science FTW!"),
#   sidebarPanel(
#     h3('Sidebar text')
#   ),
#   mainPanel(
#     h3('Main Panel text')
#   )
# ))

# library(shiny)
# shinyUI(pageWithSidebar(
#   headerPanel("Illustrating Markup"),
#   sidebarPanel(
#     h1('Sidebar panel'),
#     h1('H1 text'),
#     h2('H2 text'),
#     h3('H3 text'),
#     h4('H4 text')
#     ),
#   mainPanel(
#     h3('Main Panel text'),
#     code('Some Code'),
#     p('Some ordinary text')
#   )
# ))

# library(shiny)
# shinyUI(pageWithSidebar(
#   headerPanel("Illustrating Inputs"),
#   sidebarPanel(
#     numericInput('id1','Numeric input, labeled id1', 0, min=0, max=10, step=1),
#     checkboxGroupInput("id2", "Checkbox",
#                        c("Value 1" = "1",
#                          "Value 2" = "2",
#                          "Value 3" = "3")),
#     dateInput("date", "Date:")
#   ),
#   mainPanel(
#     h3('Illustrating outputs'),
#     h4('You entered'),
#     verbatimTextOutput("oid1"),
#     h4('You entered'),
#     verbatimTextOutput("oid2"),
#     h4('You entered'),
#     verbatimTextOutput("odate")
#   )
# ))

# shinyUI(
#   pageWithSidebar(
#     # Application title
#     headerPanel("Diabetes prediction"),
#     
#     sidebarPanel(
#       numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
#       submitButton('Submit')
#     ),
#     mainPanel(
#       h3('Results of prediction'),
#       h4('You entered'),
#       verbatimTextOutput("inputValue"),
#       h4('Which resulted in a prediction of '),
#       verbatimTextOutput("prediction")
#     )
#   )
# )

shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
  ),
  mainPanel(
    plotOutput('newHist')
  )
))

# shinyUI(pageWithSidebar(
#   headerPanel("Hello Shiny!"),
#   sidebarPanel(
#     textInput(inputId="text1", label = "Input Text1"),
#     textInput(inputId="text2", label = "Input Text2")
#   ),
#   mainPanel(
#     p('Output text1'),
#     textOutput('text1'),
#     p('Output text2'),
#     textOutput('text2'),
#     p('Output text3'),
#     textOutput('text3'),
#     p('Outside text'),
#     textOutput('text4'),
#     p('Inside text, but non-reactive'),
#     textOutput('text5')
#   )
# ))

# shinyUI(pageWithSidebar(
#   headerPanel("Hello Shiny!"),
#   sidebarPanel(
#     textInput(inputId="text1", label = "Input Text1"),
#     textInput(inputId="text2", label = "Input Text2"),
#     actionButton("goButton", "Go!")
#   ),
#   mainPanel(
#     p('Output text1'),
#     textOutput('text1'),
#     p('Output text2'),
#     textOutput('text2'),
#     p('Output text3'),
#     textOutput('text3')
#   )
# ))