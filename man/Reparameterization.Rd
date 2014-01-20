\name{Reparameterization}
\alias{skewness.cp}
\alias{shape.dp}
\alias{D.gamma}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Reparameterize Skewed Normal Parameterized using Shape and Skewness. 
%%  ~~function to do ... ~~
}
\description{The transformation functions used to reparameterize 
skewned normal from shape (direct parameter) to skewness (central parameter), and 
vice visa.   
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
skewness.cp(alpha)
shape.dp(gamma)
D.gamma(alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{alpha}{shape parameters
}
  \item{gamma}{skewness parameters
}
}
\details{For skewed normal distributions, there is a one-to-one mapping from the shape 
to the skewness, regardless of the other parameters such as mean and variances. The parameters
(mean, variance, skewness) are called centeral parameters (cp), while (location, scale, shape)
are called direct parameters (dp).  
When estimating model parameters, skewness (central parameter)
is more stable than the shape parameter. Note that the skewness for a 
skewed normal is bounded.  
}
\value{
\code{skewness.cp(alpha)} gives the skewness corresponding to the shape alpha; 
\code{shape.dp(gamma)} gives the shape value corresponding to the skewness gamma. 

\code{D.gamma(alpha)} gives the first and second derivative of skewness wrt. the shape alpha.
}
\references{
[1]. Azzalini, A. (1985). A class of distributions which includes the normal ones. Scandinavian
journal of statistics, 171-178.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{D.SN}}, \code{\link{cp2dp}}, \code{\link{dp2cp}}}
%% ~~objects to See Also as \code{\link{help}}, ~~~

\examples{
gamma1 <- skewness.cp(10) # the skewness when the shape is 10
alpha1 <- shape.dp(gamma1) # the shape when the skewenss is gamma1; should be 10
ret <- D.gamma(10) # the derivatives of the skewness as a function of the shape
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{skewed normal distributions}
