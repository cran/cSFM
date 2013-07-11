\name{kpbb}
\alias{kpbb}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Kronecker Product Bspline Basis
%%  ~~ Kronecker Product Bspline Basis ~~
}
\description{Generate the B-spline basis matrix for a polynomial spline, applicable 
for both univariate basis and bivariate basis systems. 
}
\usage{
kpbb(tp, cp = NULL, nknots.tp, nknots.cp = NULL, 
     sub.case = 2, degree.poly = 3)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tp}{timepoint vector in the time direction; must be sorted
%%     ~~Describe \code{tp} here~~
}
  \item{cp}{covariate vector in the covariate direction; must be sorted
%%     ~~Describe \code{cp} here~~
}
  \item{nknots.tp}{number of knots for the time direction; See 'Details'
%%     ~~Describe \code{nknots.tp} here~~
}
  \item{nknots.cp}{number of knots for the covariate direction; See 'Details'
%%     ~~Describe \code{nknots.cp} here~~
}
  \item{sub.case}{
  indicator for univariate (\code{sub.case = 1}) or bivariate (\code{sub.case = 2})
}
  \item{degree.poly}{
      degree of polynomials for B-spline basis system; default is \code{3}, i.e. cubis splines
      }
      }
\details{
% \code{nknots.tp} or \code{nknots.cp} typically takes values as integers beginning from 0. 
% Here we use negative \code{nknots.tp} or \code{nknots.cp} to incorporate purly polinoial basis without any knots.
% For example, when \code{degree.poly = 3}, \code{nknots.tp = -1} corresponds to a cublic polynomial; 
% \code{nknots.tp = -2} corresponds to a quadratic polynomial; 
% \code{nknots.tp = -3} corresponds to a linear regression. The locations of knots are the quantiles of each direction. 

kpbb is built based on the function \code{\link{bs}}. For the time direction, the generated basis matrix has the dimension \code{length(tp)} by 
\code{nknots.tp + degree.poly + 1}, regardless whehter the number of knots is negative or not. 
When \code{sub.case = 2}, the generated basis matrix is the kronecker product of the two basis matrices.     
}
\value{
  A basis matrix, with attributes which are for the future use of \code{predict.kpbb}.
}
\references{
[1]. Meng Li, Ana-Maria Staicu and Howard D. Bondell (2013), Incorporating Covariates in Skewed Functional Data Models. 
Unpublished. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{bs}}, \code{\link{predict.kpbb}}, \code{\link{data.simulation}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(data.simulation) # load benchmark data 
y <- DST$obs # matrix of observation
# generate bivariate basis using 3 knots for each direction
basis <- kpbb(DST$tp, DST$cp, nknots.tp = 3, nknots.cp = 3)
# linear regression
lm.fit <- lm(as.vector(y) ~ basis - 1)
y.fit <- matrix(fitted(lm.fit), nrow = 100, ncol = 80)

# visualize the data and fitted surface
par(mfrow = c(1,2))
persp(DST$cp, DST$tp, y, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="data surface")
persp(DST$cp, DST$tp, y.fit, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="fitted surface via lm")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{basis}

