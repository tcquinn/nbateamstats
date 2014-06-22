library(shiny)

source("data/NBA team stats 2013-14.R")

shinyServer(
  function(input,output) {
    xdata <- reactive(data[,match(input$ixvarcolumnname,columnnames)])
    ydata <- reactive(data[,match(input$iyvarcolumnname,columnnames)])
    lmfit <- reactive(lm(ydata()~xdata()))
    output$obothplot <- renderPlot({par(mfrow=c(1,2))
                                    hist(xdata(),
                                         main=NULL,
                                         xlab=input$ixvarcolumnname,
                                         ylab="Number of teams")
                                    abline(v=mean(xdata()),lty=2,lwd=2)
                                    hist(ydata(),
                                         main=NULL,
                                         xlab=input$iyvarcolumnname,
                                         ylab="Number of teams")
                                    abline(v=mean(ydata()),lty=2,lwd=2)})
    output$oxyplot <- renderPlot({plot(xdata(),ydata(),
                                      xlab=input$ixvarcolumnname,
                                      ylab=input$iyvarcolumnname)
                                  abline(lmfit(),lty=2,lwd=2)})
  }
)