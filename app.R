library(shiny)
library(shinythemes)

source("SCRIPT.R", local = TRUE)
ratios <- ratios
names <- unique(ratios$category)

# Define UI for application that draws a histogram
ui <- navbarPage(
  theme = shinytheme("cerulean"),
  title = "BENCHMARK ANALYSIS",
  id = 'tabID',
  tabPanel("RATIOS", value = 'ratios',
           sidebarLayout(
             sidebarPanel(
               selectInput("ratios", "BENCHMARK RATIOS", names)),
                           

      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plot"),
         mainPanel(
           plotOutput("hist")
         )
      )
   )
))


# Define server logic required to draw a histogram
server <- function(input, output) {
ratioreact <- reactive({
  r <- ratios%>%
    filter(category == input$ratios)
  return(r)
})
  
   output$plot <- renderPlot({
       ggplot(data= ratioreact(), aes(x=date, y=value, group = symbol, colour = symbol)) +
         geom_line()+facet_wrap(~symbol) + ggtitle(ratioreact()$category) + scale_y_continuous()
   })
   
   output$hist <- renderPlot({
   ggplot(data= ratioreact(), aes(value, group = symbol, colour = symbol)) + 
     geom_histogram() + facet_wrap(~symbol) + ggtitle(ratioreact()$category)
})
     

     
}

      


# Run the application 
shinyApp(ui = ui, server = server)

