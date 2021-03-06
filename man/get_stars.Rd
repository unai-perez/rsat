% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rtoi.R
\name{get_stars}
\alias{get_stars}
\alias{get_stars,rtoi-method}
\alias{get_stars,rtoi}
\title{Loads into R a time series of images regarding an rtoi, satellite product,
and remote sensing index.}
\usage{
get_stars(x, p, v, ...)

\S4method{get_stars}{rtoi}(x, p, v)
}
\arguments{
\item{x}{an rtoi.}

\item{p}{a character with the name of the satellite data product.}

\item{v}{a character with the name of the index.}

\item{...}{additional arguments.}
}
\value{
a stars object.
}
\description{
Loads into R a time series of images regarding an rtoi, satellite product,
and remote sensing index.
}
\examples{
\dontrun{
library(rsat)

# load navarre sf from the package
data(ex.navarre)

# set the credentials
set_credentials("username", "password")

# path where the region is stored
rtoi.path <- tempdir()
# path where downloads are stored
db.path <- file.path(tempdir(), "DATABASE")
navarre <- new_rtoi(
  "Navarre",
  ex.navarre,
  rtoi.path,
  db.path
) #'
# Landsat-5
sat_search(
  region = navarre,
  product = "LANDSAT_TM_C1",
  dates = as.Date("1988-08-101") + seq(1, 35)
)
download(navarre)

mosaic(navarre, overwrite = T)

derive(navarre, "NDVI", product = "LANDSAT_TM_C1")
ls6.ndvi <- get_stars(navarre, "LANDSAT_TM_C1", "NDVI")
}
}
