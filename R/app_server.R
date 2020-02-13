#' The Main App Server Function
#'
#' @param input,output,session Shiny internal variables.
#'
#' @return Shiny reactive updates.
#' @keywords internal
.app_server <- function(input, output,session) {
  questions_df <- .get_questions()

  output$questions <- .render_questions(questions_df)
  session$onSessionEnded(shiny::stopApp)
}

#' Get Rstudio Community Question Threads
#'
#' @return A tidy tibble of question information.
#' @keywords internal
.get_questions <- function() {
  # Eventually the question list should probably be a reactivePoll of some sort.
  # For now it will just load once.
  convos_tbl <- dplyr::as_tibble(mtcars, rownames = "car")

  return(convos_tbl)
}

#' Render the Questions DataTable
#'
#' @param df A dataframe of questions.
#'
#' @return A \code{\link[DT]{renderDataTable}}.
#' @keywords internal
.render_questions <- function(df) {
  shiny::callModule(
    module = function(input, output, server) {
      DT::renderDataTable({
        df
      }, escape = FALSE)
    },
    id = "questions"
  )
}
