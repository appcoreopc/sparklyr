% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sdf_interface.R
\name{ml_create_dummy_variables}
\alias{ml_create_dummy_variables}
\title{Create Dummy Variables}
\usage{
ml_create_dummy_variables(x, input, reference = NULL, levels = NULL,
  labels = NULL, envir = new.env(parent = emptyenv()))
}
\arguments{
\item{x}{An object coercable to a Spark DataFrame (typically, a
\code{tbl_spark}).}

\item{input}{The name of the input column.}

\item{reference}{The reference label. This variable is omitted when
generating dummy variables (to avoid perfect multi-collinearity if
all dummy variables were to be used in the model fit); to generate
dummy variables for all columns this can be explicitly set as \code{NULL}.}

\item{levels}{The set of levels for which dummy variables should be generated.
By default, constructs one variable for each unique value occurring in
the column specified by \code{input}.}

\item{labels}{An optional \R list, mapping values in the \code{input}
column to column names to be assigned to the associated dummy variable.}

\item{envir}{An optional \R environment; when provided, it will be filled
with useful auxiliary information. See \strong{Auxiliary Information} for
more information.}
}
\description{
Given a column in a Spark DataFrame, generate a new Spark DataFrame
containing dummy variable columns.
}
\details{
The dummy variables are generated in a similar mechanism to
\code{\link{model.matrix}}, where categorical variables are expanded into a
set of binary (dummy) variables. These dummy variables can be used for
regression of categorical variables within the various regression routines
provided by \code{sparklyr}.
}
\section{Auxiliary Information}{


The \code{envir} argument can be used as a mechanism for returning
optional information. Currently, the following pieces are returned:

\tabular{ll}{
\code{levels}:\tab The set of unique values discovered within the input column.\cr
\code{columns}:\tab The column names generated.\cr
}

If the \code{envir} argument is supplied, the names of any dummy variables
generated will be included, under the \code{labels} key.
}

