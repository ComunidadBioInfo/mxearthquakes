#' earthquake momentum calculator
#'
#' This function calculate the momentum of earthquake
#'
#' @param x A energy in "joules" or "erg"
#' @param y Especific the units of energy of 'x' "joule" or "erg"
#'
#' @return
#' A momentum of earthquake
#' @export
#'
#' @examples
#' earthquakes_moment(a, y = "erg")

earthquakes_moment <- function(x, y = "joule") {

    moment = 2000 * x

    if (y == "joule") {
        #  erg
        return(moment)
    }

    if (y == "erg"){
        x <- x * 10000000
        moment <- 2000 * x
        return(moment)
    }

}





