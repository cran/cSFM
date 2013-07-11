\name{cSFM.est.parallel}
\alias{cSFM.est.parallel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Knots Selection by AIC
%%  ~~function to do ... ~~
}
\description{Select the best number of knots to minimize AIC. This is a convinient function to implement \code{\link{cSFM.est}}
for different combination of knots by allowing parallel computing. 
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
cSFM.est.parallel(data, tp, cp, nknots.tp = NULL, nknots.cp = NULL, 
                  max.knots = NULL, parallel = TRUE, num.core = NULL, 
                  method = c("cSFM", "cSFM0", "2cSFM"), bi.level = 2, 
                  degree.poly = c(3, 3, 3), nbasis.mean = 10, gam.method = "REML")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{data}{The fully observed data matrix \eqn{n} by \eqn{m}. The number of row \eqn{n} is the number of subjects; 
  the number of columns \eqn{m} is the number of time points for each subject. 
%%     ~~Describe \code{data} here~~
}
  \item{tp}{The timepoint vector of length \eqn{m}, shared by each subject 
%%     ~~Describe \code{tp} here~~
}
  \item{cp}{The covariate vector of length \eqn{n} corresponding to \eqn{n} subjects
%%     ~~Describe \code{cp} here~~
}

  \item{nknots.tp}{knots matrix with each row to be a vector ({k1,k2,k3}) for the number of knots (mean, variance, skewness) in the time direction  
%%     ~~Describe \code{nknots.tp} here~~
}
  \item{nknots.cp}{knots matrix with each row to be a vector ({s1,s2,s3}) for the number of knots (mean, variance, skewness) in the covariant direction; the effective length is \code{bi.level}. For example, if \code{bi.level = 2}, only the first two numbers (s1, s2) are used}
  
  \item{max.knots}{the maximum number of knots to be considerred; \code{nknots.tp} and \code{nknots.cp} are not used if \code{max.knots} is provided; See "Details"}
    
  \item{parallel}{logical indicator; whether parallel computing will be used or not}
  \item{num.core}{number of cores to be used when \code{parallel = TRUE}; default to be the total available cores}
  \item{method}{Estimation method for the model. See \code{\link{cSFM.est}}}
  \item{bi.level}{Bivariate level taking values at 0, 1, 2, 3. See \code{\link{cSFM.est}}. 
%%     ~~Describe \code{bi.level} here~~
}
  \item{degree.poly}{The vector ({d1,d2,d3}) for the degree of B-splines (mean, variance, skewness) in both the time and covariant direction; the cubic splines are the default splines. 
%%     ~~Describe \code{degree.poly} here~~
}
  \item{nbasis.mean}{Number of basis functions to smooth the mean; only applicable when \code{method} is "2cSFM". 
%%     ~~Describe \code{nbasis.mean} here~~
}
  \item{gam.method}{Method to smooth the mean; only applicable when \code{method} is "2cSFM".  
%%     ~~Describe \code{gam.method} here~~
}
%%     ~~Describe \code{nknots.cp} here~~
}

\details{
This function is mainly based on \code{\link{cSFM.est}}, except that different sets of knots are considerred here. The parallel computing is based on the package \code{parallel}. 

When supplied, \code{max.kntos} will determine \code{(knots.tp, knots.cp)} as follows. For each direction (time and covariate) and each parameter (mean, variance and skewness), the number of knots is from 1 to \code{max.knots}; we enforce the lower moments have more knots than higher moments (for example, mean has more knots than variance), therefore delete those exceptions to give \code{(knots.tp, knots.cp)}.
}
\value{
\item{best.cSFM}{cSFM object with the minimal AIC value; see \code{\link{cSFM.est}} for a complete explanation of HAC object}
\item{knots.mat}{matrix for knots to be considerred; each row is a vector with length 6: first three are knots for time direction, while the last three are knots for covariate direction}
\item{AIC}{AIC vector for all sets of knots}
}

\note{
This function is the parallel version of \code{\link{cSFM.est}}. The major difference is that this function allows for a pool of knots combination and apply the parallel computing to save time. Most of the arguments are the same between the two functions. 
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{cSFM.est}}, \code{\link{clusterMap}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
\dontrun{
data(data.simulation)
# Example 1: use the convinient default to generate knots 
ret <- cSFM.est.parallel(DST$obs, DST$tp, DST$cp, max.knots = 4)
# AIC vector
ret$AIC
# best number of knots
ret$knots.mat[which.min(ret$AIC), ]
# Example 2: assign combinations of knots subjectively
nknots.tp = rbind(c(3,2,1), c(6,5,4))
nknots.cp = nknots.tp
ret2 <- cSFM.est.parallel(DST$obs, DST$tp, DST$cp, 
                          nknots.tp = nknots.tp, nknots.cp = nknots.cp)
                          }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{cSFM}

