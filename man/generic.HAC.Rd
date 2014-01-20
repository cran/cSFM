\name{cSFM object}
\alias{print.cSFM}
\alias{fitted.cSFM}
\alias{predict.cSFM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generic Method for 'cSFM' Objects
}
\description{
Print, extract fitted values and predict for cSFM object. 

Methods of the generic function \code{\link{print}}, \code{\link{fitted}} and \code{\link{predict}} for objects inheriting from class cSFM. 
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
\method{print}{cSFM}(x, ...)
\method{fitted}{cSFM}(object, quantile = TRUE, 
                     quantile.level = c(0.5, 0.8, 0.9, 0.95, 0.99), ...)
\method{predict}{cSFM}(object, newdata, cp.valid, tp.valid = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A cSFM object; returned by the function \code{\link{cSFM.est}}}
  \item{object}{A cSFM object; returned by the function \code{\link{cSFM.est}}}
  \item{quantile}{logical; if TRUE(default), estimates of quantiles are returned }
  \item{quantile.level}{quantile vector; quantile levels to be estimated when \code{quantile = TRUE}}
  \item{newdata}{the partically observed new data set (missing data allowed) to be predicated}
  \item{cp.valid}{observed covariate vector for \code{newdata} with length \code{nrow{newdata}}}
  \item{tp.valid}{observed timepoint vector for \code{newdata} with length \code{ncol{newdata}}; See "Details".} 
  \item{...}{other arguments passed to the generic functions}
%%     ~~Describe \code{x} here~~
}
\details{
When use the function \code{predict}, each row of \code{newdata} corresponds to covariate information \code{cp.valid}, 
while the column is for the time points \code{tp.valid}. When \code{tp.valid} is \code{null}, then we assume the validation 
data set has the same time points as the training data set, which is used to obtain \code{object}.  
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{cSFM.est}}, \code{\link{print}}, \code{\link{fitted}}, \code{\link{predict}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

