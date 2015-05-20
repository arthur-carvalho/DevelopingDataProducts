library(shiny)
library(rpart)

#load model
tree       <- readRDS("tree.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    
  prediction <- reactive({ 
  
          data.frame(checking_status = input$checking_status,           duration = input$duration,       
                      credit_history = input$credit_history,             purpose = input$purpose,    
                       credit_amount = input$credit_amount,       savings_status = input$savings_status,    
                          employment = input$employment,  installment_commitment = input$installment_commitment,
                     personal_status = input$personal_status,      other_parties = input$other_parties, 
                     residence_since = input$residence_since, property_magnitude = input$property_magnitude,
                     age             = input$age,            other_payment_plans = input$other_payment_plans, 
                     housing         = input$housing,           existing_credits =  input$existing_credits,
                     job             = input$job,                 num_dependents = input$num_dependents,      
                     own_telephone   = input$own_telephone,       foreign_worker = input$foreign_worker)
  
  })
  
  
  
  output$classification <- renderText({
    if(input$classifyButton >= 1) {
      input$classifyButton
      isolate({
        data <- prediction()
        paste("Client classification:", as.character(predict(tree, data, type = "class")))
      })
    }
  })
  
  
})