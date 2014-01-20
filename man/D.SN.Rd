\name{D.SN}
\alias{D.SN}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Derivatives of Normalized Skewed Normal Parameterized by Shape
%%  ~~function to do ... ~~
}
\description{Calculate the derivatives of Skewed Normal density with \code{location} = 0 and
\code{scale} = 1 when parameterized by shape
parameter. The probability density function (pdf) is a bivariate function, wrt. \code{y} and \code{a}.
The first and second derivatives are calculated.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
D.SN(y,a)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{ vector or matrix of quantiles, taking values in the real line;
      Missing values (\code{NA}'s) and \code{Inf}'s are allowed
}
  \item{a}{ vector or matrix of shape parameters, taking values in the real line;
  should have the same dimension as  \code{y}
%%     ~~Describe \code{a} here~~
}
}
\details{In general, a skewed normal is parameterized
by three parameters (\code{location, scale, shape}). It is referred as \code{normalized} skewed normal
distribution in some cases when \code{location} = 0 and
\code{scale} = 1. A normalized skewed normal distribution with \code{location} = 0 and
\code{scale} = 1 has the density
\deqn{f(x, a) = 2 \phi(x) \Phi(x * a),}
where \code{a} is the \code{shape} parameter; here \eqn{\phi} is the pdf of the standard normal distribution, and \eqn{\Phi}
is the corresponding cdf. The function \code{D.SN(x,a)} calculates the function value of \eqn{f(x,a)}, along
with the first and second order derivatives.
}
\value{
A list with the following components
\item{\code{sn}}{function value of \eqn{f(x, a)}}
\item{\code{sn1}}{the first derivative \eqn{f'(x,a)} wrt. \code{x}}
\item{\code{sn11}}{the second derivative \eqn{f''(x,a)} wrt. \code{x}}
\item{\code{sn12}}{the cross-partial \eqn{f''(x,a)} wrt. \code{x} and \eqn{a}}
\item{\code{sn2}}{the first derivative \eqn{f'(x,a)} wrt. \eqn{a}}
\item{\code{sn22}}{the second derivative \eqn{f''(x,a)} wrt. \eqn{a}}
}
\references{
[1]. Azzalini, A. (1985). A class of distributions which includes the normal ones. 
Scandinavian Journal of Statistics, 171-178.

[2]. \href{http://azzalini.stat.unipd.it/SN/Intro/intro.html}{
A very brief introduction to the skew-normal distribution}
}



%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{skewness.cp}}, \code{\link{shape.dp}}, \code{\link{dsn}}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
\examples{
ret1 <- D.SN(0.1, 10)   # y = 0.1, a = 10
ret2 <- D.SN(-0.1, -10) # y = -0.1, a = 10
ret3 <- D.SN(rnorm(10), rnorm(10))   # y and a are a vector
# y and a are matrices
ret4 <- D.SN(matrix(rnorm(10), 2, 5), matrix(rnorm(10), 2, 5)) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{skewed normal distributions}

