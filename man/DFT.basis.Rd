\name{DFT.basis}
\alias{DFT.basis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Discrete Fourier Transformation (DFT) Basis System 
%%  ~~function to do ... ~~
}
\description{Generate an orthogonal Fourier basis system in the interval [0, 1]. 
The set of basis functions are used to be the eigenfunctions 
to generate the covariance matrix of a latent process.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
DFT.basis(t, degree = 0, normalized = TRUE)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{t}{the set of values to be evaluated, taking values from [0, 1]
%%     ~~Describe \code{t} here~~
}
  \item{degree}{the degree of Fourier basis functions, taking values as \eqn{0, 1, 2, \ldots}; See 'Details'
%%     ~~Describe \code{degree} here~~
}
  \item{normalized}{logical value; If TRUE (default) then the values are normalized such that the \eqn{L2} norm of the function values is 1
%%     ~~Describe \code{normalized} here~~
}
}
\details{
The Fourier basis functions considered here are \deqn{{1, \sqrt{2}cos(2\pi t), \sqrt{2}sin(2\pi t), \sqrt{2}cos(4\pi t), \sqrt{2}sin(4\pi t),  \ldots},} 
which corresponding to \code{degree} = 0, 1, 2, 3, 4 \eqn{\ldots}. Typically the \code{degree} is even. 
}
\value{
A vector which are the evaluations of the Fourier basis function at \code{t}. 
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}



%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{legendre.polynomials}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# time points 
t <- seq(from = 0, to = 1, length = 100)
# basis matrix evaluated at the time points t
# an intercept column is included
Phi <- cbind(DFT.basis(t, degree = 0), DFT.basis(t, degree = 1),
             DFT.basis(t, degree = 2))
# check the orthogonality
crossprod(Phi) # is equal to I_3 up to rounding errors
# plot the basis system 
matplot(t, Phi, type = "l", lwd = 2, lty = 1:3, 
        ylab = "basis function", main = "Fourier Basis (normalized)")
legend("top", c("degree = 0", "degree = 1", "degree = 2"), 
       col = 1:3, lwd = 2, lty = 1:3)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{basis}

