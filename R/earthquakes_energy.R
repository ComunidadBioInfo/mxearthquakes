#' **Earthquakes energy calculation**
#'
#' _This function calculate the energy of a magnitude earthquake_
#'
#' @param x A magnitude of earhquake in Richter magnitude scale
#' @param y A [character] to select units of energy: "arg" OR "joule"
#'
#' @return
#' A number of the energy
#' @export
#'
#' @examples
#' a<-earthquakes_energy(6, "erg")


earthquakes_energy <- function(x, y = "erg") {

    energy = 10 ^ (11.8 + 1.5 * x)

    if (y == "erg") {
     #  joules
     return(energy)
    }

    if (y == "joule"){
     joules <- energy/10000000

    }
     return(joules)

}




