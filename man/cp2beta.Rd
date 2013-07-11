\name{cp.beta}
\alias{cp2beta}
\alias{beta2cp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transformation between Parameters and B-spline Coefficients
%%  ~~ Transfer from parameters to coefficients ~~
}
\description{Given a B-spline basis, transfer parameters (mean, variance, skewness)
to the corresponding coefficients, and vice versa. 
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
cp2beta(cp.list, Basis.list)
beta2cp(vec.beta, Basis.list)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cp.list}{
list of parameters with names to be \code{(mean, var, skew)} corresponding to (mean, variance, skew)
}
  \item{Basis.list}{
list of basis matrices for the mean, variance and skewness
}
  \item{vec.beta}{vector of coefficients}
}

\value{
\code{cp2beta} returns a vector of coefficients with the same form of \code{vec.beta}; \code{beta2cp} returns a list of parameters
with the same form of \code{cp.list}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
[1]. Meng Li, Ana-Maria Staicu and Howard D. Bondell (2013), Incorporating Covariates in Skewed Functional Data Models. 
Unpublished. 
}



%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
data(data.simulation)
# bivariate for mean and variance; univariate for shape parameter
cases = c(2,2,1)   
# 2 knots at time direction for each parameter
nknots.tp = c(2,2,2) 
# 2 knots at covariate direction for mean and variance
nknots.cp = c(2,2)   
basis.list <- lapply(1:3, function(k) 
  kpbb(DST$tp, DST$cp, nknots.tp = nknots.tp[k],
       nknots.cp= nknots.cp[k], sub.case=cases[k]))
cp.hat <- DST$pars # true parameters 
cp.hat$var <- exp(cp.hat$logvar) # follow the fomart stricely: (mean, var, skew)
beta <- cp2beta(cp.hat, basis.list)
cp.recover <- beta2cp(beta, basis.list)
norm(cp.hat$mean - cp.recover$mean) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{basis}

