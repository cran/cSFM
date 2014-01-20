\name{SSN}
\alias{g}
\alias{D.lg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Standard Skewed Normal Parameterized using Skewness. 
%%  ~~function to do ... ~~
}
\description{Calculate the density function, log density function, 
and derivatives of the standard skewed normal (SSN) distribution parameterized using skewness.   
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
g(y, gamma, log = FALSE)
D.lg(y, gamma)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{function arigument, taking values in the real line
}
  \item{gamma}{skewness parameter; should have the same dimension as \code{y}
}
  \item{log}{logical; if TRUE, the log of \code{g(y, gamma)} is given}
}
\details{Calculate the pdf (probability density function) and derivatives of standard
skewed normal when parameterized by skewness. 
}
\value{
\code{g(y, gamma)} gives the pdf value at \code{y} and \code{gamma} as the skewness; 
\code{g(y, gamma, log = TRUE)} gives the log of the pdf value at \code{y} and \code{gamma} as the skewness;
\code{D.lg(y, gamma)} gives the list of derivatives of the log pdf at \code{y} and \code{gamma} with
the following components: 
\item{\code{D1}}{1st derivative of \code{log.g(y,gamma)} wrt. \code{y}}
\item{\code{D2}}{1st derivative of \code{log.g(y,gamma)} wrt. \code{gamma}}
\item{\code{D12}}{2nd cross-partial derivative of \code{log.g(y,gamma)} wrt. \code{y} and \code{gamma}}
\item{\code{D11}}{2nd derivative of \code{log.g(y,gamma)} wrt. \code{y}}
\item{\code{D22}}{2nd derivative of \code{log.g(y,gamma)} wrt. \code{gamma}}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{D.SN}}, 
\code{\link{shape.dp}}, \code{\link{skewness.cp}}, \code{\link{D.gamma}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# pdf of SSN
ret1 <- g(seq(-3, 3, length = 100), 0.9)  
# plot the pdf
plot(seq(-3, 3, length = 100), ret1, type = "l", 
     xlab = "x", ylab = "pdf", main = "Plot of Stardard Skewed Normal Density")
# derivatives of pdf 
ret2 <- D.lg(10, 0.5) 
# y and a are a vector
ret3 <- D.lg(rnorm(10), seq(0.1,0.5,length = 10))   
# y and a are matrices
ret4 <- D.lg(matrix(rnorm(10), 2, 5), matrix(seq(0.1,0.5,length = 10), 2, 5))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{skewed normal distributions}

