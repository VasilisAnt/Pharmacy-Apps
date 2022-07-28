
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Pharmacy"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("medicine",
                        "Choose medicine:",
                        choices = unique(dosage$medicine)
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           #textOutput("labels2"),
           #htmlOutput("labels2"),
           DT::dataTableOutput("table")
        )
    )
)

server <- function(input, output) {

  
   #  output$labels2 <- renderText({
   # 
   #   dosage%>%
   #     filter(medicine == input$medicine)%>%
   #     mutate(instruction = paste("This is the instruction:","<br/>", instruction))%>%
   #     pull(instruction)
   # 
   # })

    output$table <- DT::renderDataTable({
    
      test <- dosage%>%
        filter(medicine == input$medicine)%>%
        select(-instruction_2)
    
    
      datatable(test, options = list(
        columnDefs = list(
          list(width = 200, targets = 2)
        )
      ))
      
    
    
  })


    
    
    
    
    
    
    
  
  
  
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
