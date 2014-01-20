\name{case2.b.initial}
\alias{case2.b.initial}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Initial Estimates of Parameter Functions
%%  ~~ Initial value of coefficients~~
}
\description{Obtain the initial estimates of functional parameters (mean, var, shape and skewness) when both the mean 
and variance are covariate depedent but the skewness is covariate independent. 
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
case2.b.initial(y, tp, cp, nbasis.mean = 10, gam.method = "REML", 
                bin = 10, skew.method = "mle", cate = 1)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{y}{
  observed data matrix 
}
  \item{tp}{ timepoint vector with length = \code{ncol(y)} 
%%     ~~Describe \code{tp} here~~
}
  \item{cp}{ covariate vector with length = \code{nrow{y}}
%%     ~~Describe \code{cp} here~~
}
  \item{nbasis.mean}{number of bases when smoothing the mean
%%     ~~Describe \code{nbasis.mean} here~~
}
  \item{gam.method}{smoothing method for the mean
%%     ~~Describe \code{gam.method} here~~
}

  \item{bin}{the length of bin to estimate the variance
%%     ~~Describe \code{bin} here~~
}
  \item{skew.method}{estimation method for skewness; See 'Details'
%%     ~~Describe \code{skew.method} here~~
}
  \item{cate}{method category, taking values as \code{1,2,3}; See 'Details'
%%     ~~Describe \code{cate} here~~
}
}
\details{
The variance is estimated using binning method with length = \code{bin}. The skewness
can be estimated by method of moment \code{mome} or maximum likelihood \code{mle}. Stepwise estimates 
are used here: the variance is based on the residuals after removing the mean effect; the skewness
is based on the scaled residuals after removing both the mean and variance effect. 

\code{cate} indiates the method cateory as follows: 
\itemize{
\item{\code{cate = 1}}{ all three parameter functions are to be estimated}
\item{\code{cate = 2}}{ the skewnewss parameter is fixed as 0} 
\item{\code{cate = 3}}{ the mean to be fixed at 0; typically used when a stepwise estimation procedure is used, e.g. \code{2cSFM} in 
\code{\link{cSFM.est}}}} 
%%  ~~ If necessary, more details than the description above ~~
}
\value{A list of initial estimate of parmeters (length 4: mean, variance, shape and skewness).
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{cSFM.est}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(data.simulation)
\dontrun{
cp.hat <- case2.b.initial(y = DST$obs, tp= DST$tp, cp=DST$cp)
# visulize the parameter function and the estimated function
par(mfrow = c(1,2))
persp(DST$cp, DST$tp, exp(DST$pars$logvar), theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="variance surface")
persp(DST$cp, DST$tp, cp.hat$var, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="initial estiamtes")
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
