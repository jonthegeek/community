#' The Main App UI
#'
#' @return A \code{\link[shiny]{tagList}} containing the UI.
#' @keywords internal
.ui_main <- function() {
  dashboard_title <- "Rstudio Community"
  shiny::tagList(
    # List the first level UI elements here
    shinydashboard::dashboardPage(
      header = .ui_header(dashboard_title),
      sidebar = .ui_sidebar(),
      body = .ui_body(),
      title = dashboard_title,
      skin = "blue"
    )
  )
}

#' The Dashboard Header
#'
#' @return A \code{\link[shinydashboard]{dashboardHeader}}.
#' @keywords internal
.ui_header <- function(dashboard_title) {
  shinydashboard::dashboardHeader(
    title = dashboard_title
  )
}

#' The Dashboard Sidebar
#'
#' @return A \code{\link[shinydashboard]{dashboardSidebar}}.
#' @keywords internal
.ui_sidebar <- function() {
  shinydashboard::dashboardSidebar(
    shiny::p(
      paste(
        "Eventually there will be menus here, for example to select channels",
        "to include in the report. It takes a while to load the data, sorry."
      ),
      style = "padding:4px"
    )
  )
}

#' The Dashboard Body
#'
#' @return A \code{\link[shinydashboard]{dashboardBody}}.
#' @keywords internal
.ui_body <- function() {
  shinydashboard::dashboardBody(
    DT::dataTableOutput("questions")
  )
}
