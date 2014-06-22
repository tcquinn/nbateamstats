library(shiny)

source("data/NBA team stats 2013-14.R")

shinyUI(pageWithSidebar(
  headerPanel("NBA team statistics 2013-14"),
  sidebarPanel(
    selectInput('ixvarcolumnname',label="x variable",
                choices=columnnames[2:12],selected=columnnames[6]),
    selectInput('iyvarcolumnname',label="y variable",
                choices=columnnames[2:12],selected=columnnames[12]),
    p("This app lets you explore team statistics from the United States National Basketball Association (NBA) 2013-14 regular season. Above, select two different team statistics to explore. On the right, the app will plot a histogram of each of the statistics (with means marked as dotted lines) and a scatterplot relating the two statistics (each dot is one team; standard regression line marked as dotted line).")
    ),
  mainPanel(
    plotOutput("obothplot"),
    plotOutput("oxyplot")
  )
))
