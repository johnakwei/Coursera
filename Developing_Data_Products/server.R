# shinyServer(
#   function(input, output) {
#     output$oid1 <- renderPrint({input$id1})
#     output$oid2 <- renderPrint({input$id2})
#     output$odate <- renderPrint({input$date})
#   }
# )

# diabetesRisk <- function(glucose) glucose / 200
# 
# shinyServer(
#   function(input, output) {
#     output$inputValue <- renderPrint({input$glucose})
#     output$prediction <- renderPrint({diabetesRisk(input$glucose)})
#   }
# )

library(UsingR)
data(galton)

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
      mu <- input$mu
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      mse <- mean((galton$child - mu)^2)
      text(63, 150, paste("mu = ", mu))
      text(63, 140, paste("MSE = ", round(mse, 2)))
    })
    
  }
)

# library(shiny)
# x <<- x + 1
# y <<- 0
# 
# shinyServer(
#   function(input, output) {
#     y <<- y + 1
#     output$text1 <- renderText({input$text1})
#     output$text2 <- renderText({input$text2})
#     output$text3 <- renderText({as.numeric(input$text1)+1})
#     output$text4 <- renderText(y)
#     output$text5 <- renderText(x)
#   }
# )

# shinyServer(
#   function(input, output) {
#     output$text1 <- renderText({input$text1})
#     output$text2 <- renderText({input$text2})
#     output$text3 <- renderText({
#       if (input$goButton == 0) "You have not pressed the button"
#       else if (input$goButton == 1) "you pressed it once"
#       else "OK quit pressing it"
#     })
#   }
# )