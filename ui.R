library(shiny)

shinyUI(fluidPage(
  titlePanel("Euro 2016 : This is how engineers play football"),
  
  sidebarLayout(position="right",
    sidebarPanel(
      h4("Select your speed and angle inputs below:"),
      sliderInput("slider1", label = h5("Speed of the football (km/h)"),
                  min = 1, max = 150, value = 50),
      numericInput("num", 
                   label = h5("Angle of the football from ground (degrees)"), 
                   min = 1, max = 89, value = 1),
      actionButton("go", "Submit your inputs")),
    mainPanel(
      p(strong("This game is about guessing at what speed and angle you should hit 
               a football.")),
      p("Here is the situation:"),
      p("You are standing at mid field with the ball. The goalkeeper is halfway
          between you and the goalpost. Seeing you with the ball the goalkeeper
          starts running towards the goalpost at", span(" 18 km/h speed.",
          style="color:blue")),
      p("You have to guess now the ",span("speed and angle", style="color:blue"),
        " at which you need to hit the football so that the football reaches 
        the goalpost before the goalkeeper in one go without bouncing. 
        Keep in mind that the football must cross the goalkeeper above the height 
        of the goalkeeper",
        span("(6ft. 2in.)",style="color:blue"), "If it bouces before the goalkeeper
        or hits him it will be deflected by him."),
      p(strong("Depending on your speed and angle input we will tell you whether 
you scored a goal or the goalkeeper deflected the ball!")),
      p(em("We will ignore air resistance and other useless variables. This is a simple
        projectile motion situation.")),
      p(em("Note: The football field is usually", span("120 yards", style="color:blue"),
           "long (~110 m)")),
      br(),
      br(),
      h5("RESULT:"),
      textOutput("text1"),
      br(),
      textOutput("text2")
    )
  )
))