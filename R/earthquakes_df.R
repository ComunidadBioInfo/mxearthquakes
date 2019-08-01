#' Servicio Sismológico Nacional
#'
#' Historical data of earthquakes in México from 1900 to 2019
#'
#' @format A data frame with 170,633 rows and 7 variables:
#' \describe{
#'   \item{data}{the date in format YYYY-MM-DD}
#'   \item{hour}{hour of the earthquake}
#'   \item{magnitude}{magnitude in Righter }
#'   \item{latitude}{coordinates in geographic}
#'   \item{longitude}{coordinates in geographic}
#'   \item{depth}{depth in kilometer}
#'   \item{location}{reference place of the epicenter}
#'
#'   ...
#' }
#' @source \url{http://www2.ssn.unam.mx:8080/catalogo/}
"earthquakes_df"
