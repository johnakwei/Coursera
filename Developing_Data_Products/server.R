library(UsingR)
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

shinyServer(
  function(input, output) {
    # Create County ListBox from selected State.
    output$countySelector <- renderUI({
            CountyList <- subset(CountyState,
            CountyState$CHSI_State_Name==input$State)
            selectInput("County", label=h5("Select County"),
                        choices=CountyList[1])})
    
    # Print selected County and State.
    output$text9 <- renderText({input$County})
    output$text10 <- renderText({input$State})    
    
    # Print Population Density.
    output$text1 <- renderText({
            CountyDemographics <- subset(CountyState,
            CountyState$CHSI_State_Name==input$State &
            CountyState$CHSI_County_Name==input$County)
            as.character(CountyDemographics[9])})
    
    # Create County Demographics Chart.
    output$demoHist <- renderPlot({
            CountyDemographics <- subset(CountyState,
            CountyState$CHSI_State_Name==input$State &
            CountyState$CHSI_County_Name==input$County)
            barplot(as.matrix(CountyDemographics[1, 10:15]),
            col="orange", main="County Demographics",
            xlab="Demographic Categories", ylab="Percentage")})
    
    # Print County Population Density.
    output$text2 <- renderText({
            Stats <- subset(CountyState,
            CountyState$CHSI_State_Name==input$State &
            CountyState$CHSI_County_Name==input$County)
            if(Stats$Population_Density > 1000) "High County Population Density"
            else "Low County Population Density"})
    
    # Print County Poverty Rate
    output$text3 <- renderText({
            Stats <- subset(CountyState,
            CountyState$CHSI_State_Name==input$State &
            CountyState$CHSI_County_Name==input$County)
            if (Stats$Poverty > 12) "High County Poverty Rate"
            else "Low County Poverty Rate"})
    
    # Graph County Risk Factors.
    output$newHist <- renderPlot({
            CountyDemographics <- subset(CountyState,
            CountyState$CHSI_State_Name==input$State &
            CountyState$CHSI_County_Name==input$County)
            barplot(as.matrix(CountyDemographics[1, 3:8]),
            col="orange", main="County Health Risk Factors",
            xlab="Risk Factors Categories", ylab="Risk Factors Level")})
    
    # Calculate and Graph Average State Risk Factors.
    output$StateHist <- renderPlot({
            StateAvg <- subset(CountyState,
            CountyState$CHSI_State_Name==input$State)
            finalPlot <- lapply(na.omit(StateAvg[3:8]), mean)
            finalPlot <- as.data.frame(finalPlot)
            barplot(as.matrix(finalPlot),
                  col="orange", main="State Average Health Risk Factors",
                  xlab="Average Risk Factors", ylab="Risk Factors Level")
            })

    # Calculate and Graph Average USA Risk Factors.
    output$USAHist <- renderPlot({
            USAvg <- na.omit(CountyState)
            finalUSPlot <- lapply(USAvg[3:8], mean)
            finalUSPlot <- as.data.frame(finalUSPlot)
            barplot(as.matrix(finalUSPlot),
            col="orange", main="USA Average Health Risk Factors",
            xlab="Average Risk Factors", ylab="Risk Factors Level")
            })
})