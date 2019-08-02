


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


# ejemplo
# a<-earthquakes_energy(6, "erg")

