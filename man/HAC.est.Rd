\name{cSFM.est}
\alias{cSFM.est}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Model Estimation with Bivariate Regression B-Splines
}
\description{
Function used for model estimation with bivariate (or univariate) B-splines, when the number of knots are given 
for each parameters (mean, variance and skewness). Kronecker product is used for bivariate case.  
It returns cSFM objects.  
}
\usage{
cSFM.est(data, tp, cp, nknots.tp, nknots.cp, degree.poly = c(3, 3, 3), 
        method = c("cSFM", "cSFM0", "2cSFM"), bi.level = 2,  
        nbasis.mean = 10, gam.method = "REML")
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
  \item{nknots.tp}{The vector ({k1,k2,k3}) for the number of knots (mean, variance, skewness) in the time direction  
%%     ~~Describe \code{nknots.tp} here~~
}
  \item{nknots.cp}{The vector ({s1,s2,s3}) for the number of knots (mean, variance, skewness) in the covariant direction; the effective length is \code{bi.level}. For example, if \code{bi.level = 2}, only the first two numbers (s1, s2) are used
%%     ~~Describe \code{nknots.cp} here~~
}
  \item{degree.poly}{The vector ({d1,d2,d3}) for the degree of B-splines (mean, variance, skewness) in both the time and covariant direction; 
  the cubic splines are the default splines. 
%%     ~~Describe \code{degree.poly} here~~
}
  \item{method}{Estimation method for the model. See 'Details'.  
%%     ~~Describe \code{method} here~~
}
  \item{bi.level}{Bivariate level taking values at 0, 1, 2, 3. See 'Details'. 
%%     ~~Describe \code{bi.level} here~~
}
  \item{nbasis.mean}{Number of basis functions to smooth the mean; only applicable when \code{method} is "2cSFM". 
%%     ~~Describe \code{nbasis.mean} here~~
}
  \item{gam.method}{Method to smooth the mean; only applicable when \code{method} is "2cSFM".  
%%     ~~Describe \code{gam.method} here~~
}

}
\details{
The three methods for the argument \code{method} are all based on skewed normal and corpula, but exploits different approaches to conduct the estimation. 
Method "\code{cSFM}" assumes the full model and estimate all the parameter functions (mean, variance, skewness) jointly; Method "\code{cSFM0}" enforces the skewness to be zero, 
and estimate the other two parameter functions jointly; Method "\code{2cSFM}" first estimate the mean function via penalized bivariate spline and then estimate the variance and 
skewness for the residulas, thus it is a Stepwise approach. 

The argument \code{bi.level} indicates the bivariate dependence for all three parameters. 
For example, Bi.level = 2 means the parameters are bivariate up to the 2nd momdnet, i.e. the mean and variance are bivariate while the skewness is univariate.  
}


    
\value{
A cSFM object as a list with components:

\item{beta.hat}{Estimated coefficients}
\item{cp.hat}{Estimated parameter functions including the mean, variance and skewness}
\item{copula}{Estimated copula for the data}
\item{corr.est}{Estimated correlation matrix for the copula}
\item{AIC}{AIC for the model}
\item{num.pars}{Number of parameters in the model}
\item{logL1}{Marginal loglikelihood value}
\item{logL2}{Loglikelihood value for the corpula}
\item{sm.basis}{Smoothing Matrices used as the basis}
\item{gam.mean}{Results when smoothing the mean, returned by \code{\link{gam}} function and is only applicable for method \code{2cSFM}}
}
\references{
[1]. Meng Li, Ana-Maria Staicu and Howard D. Bondell (2013), Incorporating Covariates in Skewed Functional Data Models. 
\url{http://www.stat.ncsu.edu/information/library/papers/mimeo2654_Li.pdf}.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{print.cSFM}}, \code{\link{predict.cSFM}}, \code{\link{fitted.cSFM}}, \code{\link{gam}}, \code{\link{data.simulation}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(data.simulation) # load benchmark data 
y <- DST$obs # matrix of observation
tp <- DST$tp; cp <- DST$cp

# fixed number of knots
# bivariate for mean and variance, univrariate for shape
nknots.tp <- c(2,2,2)
nknots.cp <- c(2,2)
\dontrun{
fit.cSFM <- cSFM.est(y, tp, cp, nknots.tp, nknots.cp, method = "cSFM")
fit.cSFM #print out the results briefly
# fitted mean, logvar and skewness; fitted quantiles
fitted.value <- fitted(fit.cSFM)  

# visualize the parameter function and the estimated function
par(mfrow = c(1,2))
persp(DST$cp, DST$tp, DST$pars$mean, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="parameter surface")
persp(DST$cp, DST$tp, fit.cSFM$cp.hat$mean, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="estimated surface via 'cSFM' method")

# predication for missing data 
y.valid <- DSV$obs # matrix of training data; include missing values
tp.valid <- DSV$tp; cp.valid <- DSV$cp
#predication for training data
yhat.predict <- predict(fit.cSFM, y.valid, cp.valid, tp.valid)  

# visualize the data and predicted surface
par(mfrow = c(1,2))
persp(DSV$cp, DSV$tp, y.valid, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="data surface (partically observed)")

persp(DSV$cp, DSV$tp, yhat.predict, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="predicted surface via 'cSFM' method")

# predication error
mean(((yhat.predict - DSV$obs.full)[!is.na(DSV$obs)])^2)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{cSFM}

