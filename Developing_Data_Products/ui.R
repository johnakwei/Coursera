library(shiny)

# Parse CHSI data for application.
dt <- read.csv("chsi_dataset/RISKFACTORSANDACCESSTOCARENA.csv")
CountyState <- dt[3:4]
CountyState[] <- lapply(CountyState, as.character)
RiskFactors <- cbind(dt[7], dt[10], dt[13], dt[16], dt[19], dt[22])
CountyState <- cbind(CountyState, RiskFactors)
rm(dt, RiskFactors)
dt2 <- read.csv("chsi_dataset/DEMOGRAPHICS.csv")
dt2Columns <- cbind(dt2[12], dt2[15], dt2[30], dt2[33], dt2[36], dt2[39], dt2[42])
rm(dt2)
CountyState <- cbind(CountyState, dt2Columns)
rm(dt2Columns)

shinyUI(pageWithSidebar(
  headerPanel("Community Demographic Health Status"),
  sidebarPanel(
    selectInput("State", label=h5("Select State"), 
                choices=CountyState$CHSI_State_Name, selected=1),
    uiOutput("countySelector")
    ),
  mainPanel(
    p("This application gives Communities information on how local ", 
      "policies are affecting local health risks. Thereby, allowing ",
      "local officials, and voters, to determine if services ",
      "to improve local health are effective."),
      
    p("Select State and County to display Population Density, a graph of ",
      "County Demographics, an assessment of Population Density and Poverty Rate ",
      "of the selected County, and graphs of local health risk levels, ",
      "average State health risk levels, and average USA health risk levels."),
    h2('County Demographics'),
    h4('For:'),
    textOutput('text9'),
    textOutput('text10'),
    h4('Population Density:'),
    textOutput('text1'),
    h2('County Demographics Chart'),
    plotOutput("demoHist"),
    h2("County Demographics Assessment:"),
    textOutput('text2'),
    textOutput('text3'),
    h2('Risk Factors Comparison Charts'),
    plotOutput("newHist"),
    plotOutput("StateHist"),
    plotOutput("USAHist"),
    # Create links to ui.R and Server.R on GitHub
    helpText(HTML("User Interface Source Code: <a href=\"https://github.com/johnakwei/Coursera/blob/Coursera/Developing_Data_Products/ui.R\" target=\"_blank\">ui.R</a>")),
    helpText(HTML("Server Script Source Code: <a href=\"https://github.com/johnakwei/Coursera/blob/Coursera/Developing_Data_Products/server.R\" target=\"_blank\">server.R</a>"))
  )))