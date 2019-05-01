library(shiny)

height <- function(v, theta)
  (v*sin(theta)*27.5/((v*cos(theta))-5)) -(9.8*((27.5/((v*cos(theta))-5))^2)*0.5) 

shinyServer(
  function(input, output){
    
    output$text1 = renderText({
      if(input$go == 0)
        return()
      isolate(paste("You have selected speed of ", 
                                     input$slider1, " km/h and an angle of ",
                                     input$num, " degrees from ground."))})
    
    # convert user input into correct format
    
    output$text2 = renderText({
      if(input$go == 0)
        return()
      isolate(
        if((input$slider1*1000/3600)*cos(input$num*pi/180) < 10){
          "You are too slow! The goalkeeper has reached the goalpost before
                     the ball and has stopped the goal!!"
        } else if (height(input$slider1*1000/3600, input$num*pi/180) <= 1.8796){
          "The ball has been deflected by the goalkeeper. NO GOAL!"
        } else {
          "IT'S A GOAL!"
        }
      )
    })
    
  }
)