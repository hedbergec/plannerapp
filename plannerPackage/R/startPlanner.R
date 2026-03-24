#' Start the Planner Shiny Application
#'
#' Launches the interactive Planner Shiny app for power analysis and study design.
#' 
#' @param launch.browser Logical. If TRUE (default), the app will open in your default web browser.
#'
#' @return Invisible NULL. The Shiny app runs until you close it.
#'
#' @details
#' The Planner app provides an interactive interface for:
#' \itemize{
#'   \item Computing power and minimum detectable effect size (MDES)
#'   \item Randomization of units to treatment and control
#'   \item Exploring different study designs and sample sizes
#' }
#'
#' @seealso [shiny::shinyApp()]
#'
#' @export
#' @examples
#' \dontrun{
#'   startPlanner()
#' }
startPlanner <- function(launch.browser = TRUE) {
  appDir <- system.file("app", package = "plannerPackage")
  if (appDir == "") {
    stop("Could not find app directory. Try re-installing the package.",
         call. = FALSE)
  }

  shiny::runApp(appDir, launch.browser = launch.browser)
}

