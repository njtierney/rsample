% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rolling_origin.R
\name{rolling_origin}
\alias{rolling_origin}
\title{Rolling Origin Forecast Resampling}
\usage{
rolling_origin(data, initial = 5, assess = 1, cumulative = TRUE,
  skip = 0, ...)
}
\arguments{
\item{data}{A data frame.}

\item{initial}{The number of samples used for analysis/modeling in the initial resample.}

\item{assess}{The number of samples used for each assessment resample.}

\item{cumulative}{A logical. Should the analysis resample grow beyond the size specified by `initial` at each resample?.}

\item{skip}{A integer indicating how many (if any) resamples to skip to thin the total amount of data points in the analysis resample.}

\item{...}{Not currently used.}
}
\value{
An tibble with classes `rolling_origin`, `rset`, `tbl_df`, `tbl`, and `data.frame`. The results include a column for the data split objects and a column called `id` that has a character string with the resample identifier.
}
\description{
This resampling method is useful when the data set has a strong time component. The resamples are not random and contain data points that are consecutive values. The function assumes that the original data set are sorted in time order.
}
\details{
The main options, `initial` and `assess`, control the number of data points from the original data that are in the analysis and assessment set, respectively. When `cumulative = TRUE`, the analysis set will grow as resampling continues while the assessment set size will always remain static. 
`skip` enables the function to not use every data point in the resamples. When `skip = 0`, the resampling data sets will increment by one position. Suppose that the rows of a data set are consecutive days. Using `skip = 6` will make the analysis data set operate on *weeks* instead of days. The assessment set size is not affected by this option.
}
\examples{
set.seed(1131)
ex_data <- data.frame(row = 1:20, some_var = rnorm(20))
dim(rolling_origin(ex_data))
dim(rolling_origin(ex_data, skip = 2))
dim(rolling_origin(ex_data, skip = 2, cumulative = FALSE))
}
