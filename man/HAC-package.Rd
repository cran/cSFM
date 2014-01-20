\name{cSFM-package}
\alias{cSFM-package}
\alias{cSFM}
\docType{package}
\title{
Covariate-adjusted Skewed Functional Model 
}
\description{
This package provides functions for functional data analysis, when covariate effect is present and high-moment information is 
considerred. Skewed normal distributions are used for the pointwise distributions, and the dependence is 
modeled by a Gaussian copula.
}
\details{
\tabular{ll}{
Package: \tab cSFM\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2014-01-20\cr
License: \tab GPL-2\cr
}
The main function \code{\link{cSFM.est}} applies one of the proposed method \code{cSFM} and its variates \code{2cSFM}
and \code{cSFM0} to the observed data. The generic functions \code{\link{print}}, \code{\link{fitted}} and \code{\link{predict}} are applicable for summarizing the output, obtaining fitted values (including quantile estimation) and predicting at new data point.
See \code{\link{data.simulation}} for an example of the simulated data where various methods including cSFM and other variantes can be applied to.  
Kronecker product basis is exploited for bivariate parameter functions. The smoothness is 
controlled by the number of knots which is selected by minimizing AIC; 
the function \code{\link{cSFM.est.parallel}} allows parallel computing for various combinations of knots when the facility is available to the users. 
}

\references{
[1]. Meng Li, Ana-Maria Staicu and Howard D. Bondell (2013), Incorporating Covariates in Skewed Functional Data Models. 
\url{http://www.stat.ncsu.edu/information/library/papers/mimeo2654_Li.pdf}. 
%~~ Literature or other references for background information ~~
}
%%~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
%%~~ the R documentation directory ~~
\keyword{ package }
\seealso{
\code{\link{cSFM.est}}, \code{\link{cSFM.est.parallel}}, \code{\link{data.simulation}}. 
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}

