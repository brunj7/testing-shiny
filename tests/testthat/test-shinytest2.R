library(shinytest2)

test_that("{shinytest2} recording: one-name-test", {
  app <- AppDriver$new(name = "one-name-test", height = 904, width = 1332)
  app$set_inputs(name_input = "Sophia")
  app$click("greeting_button_input")
  app$expect_values()
})


test_that("{shinytest2} recording: two-names-test", {
  app <- AppDriver$new(name = "two-names-test", height = 904, width = 1332)
  app$set_inputs(name_input = "Karina")
  app$click("greeting_button_input")
  app$set_inputs(name_input = "")
  app$set_inputs(name_input = "Eliott")
  app$click("greeting_button_input")
  app$expect_values()
})


test_that("{shinytest2} recording: no-name-test", {
  app <- AppDriver$new(name = "no-name-test", height = 904, width = 1332)
  app$click("greeting_button_input")
  app$expect_values()
})


test_that("{shinytest2} recording: consecutive-names-test", {
  app <- AppDriver$new(name = "consecutive-names-test", height = 904, width = 1332)
  app$set_inputs(name_input = "Julien")
  app$click("greeting_button_input")
  app$expect_values()
  app$set_inputs(name_input = "")
  app$set_inputs(name_input = "Eliott")
  app$click("greeting_button_input")
  app$expect_values()
})
