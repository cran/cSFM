\name{legendre.polynomials}
\alias{legendre.polynomials}
%- Also NEED an '\alias' for EACH other topic documented here.


\title{Orthogonal Legendre Polynomials Basis System 
%%  ~~function to do ... ~~
}
\description{Generate Legendre polynomials as an orthogonal basis system in the interval [0, 1]. 
The set of polynomial functions are used to be the eigenfunctions 
to generate the covariance matrix of a latent process. 
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
legendre.polynomials(t, degree, normalized = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{t}{the set of values to be evaluated, taking values from [0, 1]
%%     ~~Describe \code{t} here~~
}
  \item{degree}{the polynomial degree of the function, taking values as 0 (constant), 1 (linear), 2 (quadratic) and 3 (cubic)
%%     ~~Describe \code{degree} here~~
}
  \item{normalized}{ logical value; If TRUE (default) then the values are normalized such that the \eqn{L2} norm of the function values is 1
%%     ~~Describe \code{normalized} here~~
}
}
\details{
  Legendre polynomials can take any integers as \code{degree}, however, it is sufficent for most applications up to \code{degree = 3}. 
  It is also messy to obtain the exploit expression for a degree greater than 3. 
  
  The logical value \code{normalized} take \code{TRUE} as the default, which means the generated eigenfunction basis matrix will be 
  an orthogonal matrix. 
}
\value{
A vector which are the evaluations of the Legendre polynomial function at \code{t}. 
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}



\seealso{
\code{\link{DFT.basis}}
}
\examples{
# time points 
t <- seq(from = 0, to = 1, length = 100)
# basis matrix evaluated at the time points t
# an intercept column is included
Phi <- cbind(legendre.polynomials(t, degree = 0), legendre.polynomials(t, degree = 1),
             legendre.polynomials(t, degree = 2), legendre.polynomials(t, degree = 3))
# check the orthogonality
crossprod(Phi) # is equal to I_4 up to rounding errors
# plot the basis system excluding the constant column
matplot(t, Phi[,2:4], type = "l", lwd = 2, lty = 1:3, 
        ylab = "basis function", main = "Legendre Polynomials (normalized)")
legend("top", c("linear", "quadratic", "cubic"), col = 1:3, lwd = 2, lty = 1:3)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{basis}
