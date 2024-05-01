server <- function(input, output) {
  
  # Feature 1 ------------------------------------------------------------------
  
  # observe() automatically re-executes when dependencies change (i.e. when `name_input` is updated), but does not return a result ----
  observe({
    
    # if the user does not type anything before clicking the button, return the message, "Please type a name, then click the Greet button." ----
    if (nchar(input$name_input) == 0) {
      output$greeting_output <- renderText({
        "Please type a name, then click the Greet button."
      })
      
      # if the user does type a name before clicking the button, return the greeting, "Hello [name]!" ----
    } else {
      output$greeting_output <- renderText({
        paste0("Hello ", isolate(input$name_input), "!")
      })
    }
  }) |>
    
    # Execute the above observer once the button is pressed ----
  bindEvent(input$greeting_button_input)
}