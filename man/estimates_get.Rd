% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estimates.r
\name{estimates_get}
\alias{estimates_get}
\title{display estimation results}
\usage{
estimates_get(name = NULL)
}
\arguments{
\item{name}{name of estimates to be returned.  If unspecified, return current estimates.}
}
\value{
returns a table of the estimated coefficients and standard errors
}
\description{
display estimation results
}
\examples{
use(cars, clear=TRUE)
reg(speed,dist)
estimates_store("speed_dist")
reg(dist,speed)
estimates_store("dist_speed")
estimates_get("speed_dist")
estimates_get("dist_speed")
}
