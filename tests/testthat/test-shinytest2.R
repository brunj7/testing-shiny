library(shinytest2)

test_that("{shinytest2} recording: one-name-test", {
  app <- AppDriver$new(name = "one-name-test", height = 904, width = 1332)
  app$set_inputs(name_input = "Sophia")
  app$click("greeting_button_input")
  app$expect_values(output="greeting_output")
})


test_that("{shinytest2} recording: two-names-test", {
  app <- AppDriver$new(name = "two-names-test", height = 904, width = 1332)
  app$set_inputs(name_input = "Karina")
  app$click("greeting_button_input")
  app$set_inputs(name_input = "")
  app$set_inputs(name_input = "Eliott")
  app$click("greeting_button_input")
  app$expect_values(output="greeting_output")
})


test_that("{shinytest2} recording: no-name-test", {
  app <- AppDriver$new(name = "no-name-test", height = 904, width = 1332)
  app$click("greeting_button_input")
  app$expect_values(output="greeting_output")
})


test_that("{shinytest2} recording: consecutive-names-test", {
  app <- AppDriver$new(name = "consecutive-names-test", height = 904, width = 1332)
  app$set_inputs(name_input = "Julien")
  app$click("greeting_button_input")
  app$expect_values("greeting_output")
  app$set_inputs(name_input = "")
  app$set_inputs(name_input = "Eliott")
  app$click("greeting_button_input")
  app$expect_values(output="greeting_output")
})


test_that("{shinytest2} recording: upload-data-good", {
  app <- AppDriver$new(name = "upload-data-good", height = 904, width = 1332)
  app$upload_file(csv_input = "cols-and-data1.csv")
  app$expect_values(output="summary_table_output") #get the id from ui.R
})


test_that("{shinytest2} recording: default-three-species-test", {
  app <- AppDriver$new(name = "default-three-species-test", height = 904, width = 1332)
  app$expect_values(output = "scatterplot_output")
})


test_that("{shinytest2} recording: gentoo-test", {
  app <- AppDriver$new(name = "gentoo-test", height = 904, width = 1332)
  app$set_inputs(penguinSpp_scatterplot_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input = c("Chinstrap", "Gentoo"))
  app$set_inputs(penguinSpp_scatterplot_input = "Gentoo")
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguinSpp_scatterplot_input_open = FALSE, allow_no_input_binding_ = TRUE)
})
