\name{predict.kpbb}
\alias{predict.kpbb}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Evaluate a predefined Kronecker product B-spline basis at provided values 
}
\description{
Evaluate a predefined Kronecker product B-spline basis at provided values.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
\method{predict}{kpbb}(object, tp.valid, cp.valid = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
  the result returned by \code{\link{kpbb}} with corresponding attributes
%%     ~~Describe \code{object} here~~
}
  \item{tp.valid}{
  the new time points at which the evaluations are requested; mainly for validation purpose
%%     ~~Describe \code{tp.valid} here~~
}
  \item{cp.valid}{
  the new covariate points at which the evaluations are requested; mainly for validation purpose
%%     ~~Describe \code{cp.valid} here~~
}
  \item{...}{other arguments passed to the generic function}
}
\details{
When \code{cp.valid} is allowed to be \code{null}, when only an univariate basis is considerred at 
\code{object}.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
An object just like the inputed \code{object}, except evaluated at the new values of \code{tp.valid} and \code{cp.valid}.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{predict.kpbb}}, \code{\link{data.simulation}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(data.simulation) # load benchmark data 
y <- DST$obs # matrix of observation
y.valid <- DSV$obs # matrix of training data; include missing values
# generate bivariate basis using 3 knots for each direction
basis <- kpbb(DST$tp, DST$cp, nknots.tp = 3, nknots.cp = 3)
# linear regression
lm.fit <- lm(as.vector(y) ~ basis - 1)
# prediction 
new.basis <- predict(basis, tp.valid = DSV$tp, cp.valid = DSV$cp)
y.predict <- matrix(crossprod(t(new.basis),coef(lm.fit)), nrow = length(DSV$cp))

# visualize the data and predicted surface
par(mfrow = c(1,2))
persp(DSV$cp, DSV$tp, y.valid, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="data surface (partically observed)")

persp(DSV$cp, DSV$tp, y.predict, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="predicted surface via lm")

# predication error
mean(((y.predict - DSV$obs.full)[!is.na(DSV$obs)])^2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{basis}

