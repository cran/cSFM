\name{uni.fpca}
\alias{uni.fpca}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Functional Principle Component Analysis with Corpula   
}
\description{
\code{uni.fpca} is used to do regular FPCA for univariate data with given covariance matrix. 
The sample covariance matrix will be used if covariance matrix is not given. 
}
\usage{
uni.fpca(Y, Kendall = NULL, Y.pred = NULL, 
         nbasis.mean = 10, nbasis = 10, pve = 0.99, npc = NULL, 
         center = TRUE, gam.method = "REML")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
matrix for the fully observed curves; each row corresponds to one subject 
}
  \item{Kendall}{
given covariance matrix for Y (raw matrix up to smoothing); typically obtained using Kendall's Tau approach. See 'Details'
}
  \item{Y.pred}{
partically observed curves to be predicted; default is \code{null} indicating no predication on new data set
}
  \item{nbasis.mean}{
number of basis functions to smooth the mean 
}
  \item{nbasis}{
  number of basis functions for each direction to smooth the covariance matrix 
%%     ~~Describe \code{nbasis} here~~
}
  \item{pve}{
 threshold of the percentage of variance explained to select number of principal components 
}
  \item{npc}{
 prespecified value for the number of principal components to be included in the expansion (if given, this overrides 'pve').
}
  \item{center}{
if \code{TRUE}, we center the curves; otherwise, do not center the curves and assume the curves have mean 0 already
}
  \item{gam.method}{
estimation method when using \code{\link{gam}}
}
}
\details{
This function is build in the spirit of the function \code{fpca.sc} in the package \code{refund}, but here the corpula plays a role. The covariance 
matrix \code{Kendall} is typically estimated before the application of this function, for instance, via Kendall's Tau approach. It is highly 
recommended that the Knedall's Tau covariance matris should be provided here since it is more stable.
}
                  
\value{
A list of the following components: 
\item{Yhat}{matrix whose rows are the estimates through Functional FPCA of the curves in \code{Y}}
\item{scores}{matrix of estimated principal component scores}
\item{mu}{estimated mean function}
\item{efunctions}{matrix of estimated eigenfunctions of the functional covariance operator, i.e., the FPC basis functions}
\item{evalues}{estimated eigenvalues of the covariance operator, i.e., variances of FPC scores}
\item{npc}{number of FPCs: either the supplied npc, or the minimum number of basis functions needed to explain proportion pve of the variance in the observed curves}
\item{K.tilde}{Smoothed covariance matrix of \code{Y} after removing white noises}
\item{K.hat}{Smoothed covariance matrix of \code{Y}}
\item{sigma2}{estimated measurement error variance}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
[1]. Yao, F., Mueller, H.-G., and Wang, J.-L. (2005). Functional data analysis for sparse longitudinal
data. Journal of the American Statistical Association, 100(470):577-590. 


[2]. Goldsmith, J., Greven, S., and Crainiceanu, C. (2013). Corrected confidence bands for functional data using principal components. Biometrics, 69(1), 41-51.
%% ~put references to the literature/web site here ~
}


%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
data(data.simulation)
fpca <- uni.fpca(Y = DST$obs, Y.pred=DSV$obs)

# visualize the data and predicted surface
par(mfrow = c(1,2))
persp(DSV$cp, DSV$tp, DSV$obs, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="data surface (partically observed)")
persp(DSV$cp, DSV$tp, fpca$Yhat, theta=60, phi=15,
      ticktype = "detailed", col="lightblue", 
      xlab = "covariate", ylab = "time",
      zlab="data", main="predicted surface via univariate FPCA")

# predication error
mean(((fpca$Yhat - DSV$obs.full)[!is.na(DSV$obs)])^2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{FPCA}

