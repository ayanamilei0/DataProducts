library(shiny)
shinyUI(pageWithSidebar(
    # Application title
    headerPanel("Calculate Your Body Mass Index"),
    
    sidebarPanel(
        h4('Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.
                    Enter your weight and height using metric or standard measures.
                    Select "Compute BMI" and your BMI will appear in the Main Panel'),
        
        radioButtons("var", 
                    label = "Choose your unit",
                    choices = c("Metric (cm/kg)", "US standard (inch/lbs)"),
                    selected = NULL),
        
        numericInput('height', 'Your Height (in selected measure)', 60, min = 0, max = 250, step = 1),
        numericInput('weight', 'Your weight (in selected measure)', 60, min = 0, max = 500, step = 1),
        submitButton('Compute BMI')
        
    ),
    
    mainPanel(
        h3('You entered'),
        verbatimTextOutput("input1"), 
        verbatimTextOutput("input2"),
        verbatimTextOutput("input3"),
        h3('Your BMI is'),
        verbatimTextOutput("BMI"),
        
        
        h4("BMI Categories:"),
        p("Very severely underweight: less than 15"),
        p("Severely underweight: from 15.0 to 16.0"),
        p("Underweight: from 16.0 to 18.5"),
        p("Normal (healthy weight): from 18.5 to 25"),
        p("Overweight: from 25 to 30"),
        p("Obese Class I (Moderately obese): from 30 to 35"),
        p("Obese Class II (Severely obese): from 35 to 40"),
        p(" Obese Class III (Very severely obese): over 40")
    )
))