index <- function(measures, height, weight) {
    if (identical(measures, "Metric (cm/kg)")){
        BMI <- weight*10000/(height^2)
    } else {
        BMI <- weight*703/(height^2)
    }
    BMI
}

shinyServer(
    function(input, output) {
        measures <- reactive({input$var})
        height <- reactive({as.numeric(input$height)})
        weight <- reactive({as.numeric(input$weight)})
        
        output$input1 <- renderText({input$height})
        output$input2 <- renderText({input$weight})
        output$input3 <- renderText({input$var})
        
        output$BMI <- renderPrint({index(input$var, input$height, input$weight)})
    }
)