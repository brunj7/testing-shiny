library(shinytest2)

test_that("{shinytest2} recording: one-name-test", {
  app <- AppDriver$new(name = "one-name-test", height = 904, width = 1332)
  app$set_inputs(name_input = "Sophia")
  app$click("greeting_button_input")
  app$expect_values()
})
