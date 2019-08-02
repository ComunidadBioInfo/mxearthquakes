


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

a<-earthquakes_energy(6)

earthquakes_moment(a, y = "erg")



