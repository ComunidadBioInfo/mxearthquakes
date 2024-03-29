% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/earthquakes_moment.R
\name{earthquakes_moment}
\alias{earthquakes_moment}
\title{earthquake momentum calculator}
\usage{
earthquakes_moment(x, y = "joule")
}
\arguments{
\item{x}{A energy in "joules" or "erg"}

\item{y}{Especific the units of energy of 'x' "joule" or "erg"}
}
\value{
A momentum of earthquake
}
\description{
This function calculate the momentum of earthquake
}
\examples{
earthquakes_moment(a, y = "erg")
}
