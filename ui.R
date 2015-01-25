library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Predicting runs and wins using sabermetrics or conventional baseball statistics"), 
    sidebarPanel("Choose predictor and quantity to predict",
      selectInput('predictor', 'Statistic', c("Hits" = "Hits", 
                                              "Doubles" = "Doubles", 
                                              "Triples" = "Triples", 
                                              "Home Runs" = "HomeRuns", 
                                              "Stolen Bases" = "StolenBases", 
                                              "Caught Stealing" = "CaughtStealing",
                                              "Bases on Balls" = "BasesOnBalls", 
                                              "Total Bases" = "TotalBases", 
                                              "Runs Created" = "RunsCreated",
                                              "Runs Created (Stolen base version)" = "RunsCreatedWithStolenBases",
                                              "Runs Created (Advanced)" = "RunsCreatedAdvanced",
                                              "Runs Created (2002)" = "RunsCreated2002"))
    ,      
    selectInput("prediction", "Quantity to Predict", c("Team Runs" = "Runs", "Team Wins" = "Wins")),
    submitButton("Submit")
    ),
    mainPanel(
      h3('Results of linear model'),
      h4('Using '), verbatimTextOutput("predictor"),
      h4(' to Predict'), verbatimTextOutput("prediction"),
      h4('Model Result:'), 
      h4('Coefficients:'), verbatimTextOutput("summary"),
      h4('Analysis of Variance:'), verbatimTextOutput("anova")
    )
  )
)