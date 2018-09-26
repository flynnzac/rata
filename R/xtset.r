## This file is part of rata.

## rata is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, under version 3 of the License.

## rata is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with rata.  If not, see <https://www.gnu.org/licenses/>.

#' prepares a panel dataset for lag operations
#'
#' prepares a panel dataset for lag operations.  The lag function in R is simply "lag(var,numlags)".  After calling \code{xtset}, this lag function will work on the panel in the way you would expect.
#' @param timevar the name of the variable to for the time dimension
#' @param obsvar the name of the variable to use for the observation dimension
#' @examples
#' use(Produc)
#' xtset("year", "state")
#' gen("Lemp", "lag(emp)")
#' listif(vars="emp Lemp")
#' reg("emp", "unemp", effect="twoway")
#' reg("emp", "unemp", effect="obs")
#' reg("emp", "unemp", effect="time")
#' @importFrom "plm" pdata.frame
#' @export
xtset <- function (timevar, obsvar)
{
  eval(substitute({data <- pdata.frame(data, index=c(obsvar,timevar))}),
       envir=data.env)
  eval(substitute({attr(data,"timevar") <- timevar}), envir=data.env)
  eval(substitute({attr(data, "obsvar") <- obsvar}), envir=data.env)
  postuse()
}

