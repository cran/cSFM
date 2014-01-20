     \name{Simulation}
     \docType{data}
     \alias{data.simulation}
     \alias{DST}
     \alias{DSV}
     \title{Data with Skewed Marginal Distributions and Gaussian Copula (Simulated)}
     \description{
       This simulated benchmark data follows the model with skewed normal distribution as the marginal distribution and Gaussian copula
       as the dependence structure. It can be used to demonstrate the usage of methods and validation. \code{DST} is the Data 
       Simulated for Training purpose; \code{DSV} is the Data Simulated for Validation (prediction) purpose. 
     }
     \usage{data(data.simulation) #load data sets: DST and DSV
DST  # data simulated for training
DSV  # data simulated for validation}

     \format{
     Each of \code{DST} and \code{DSV} is a list containing the following components: 
          \describe{
     \item{ \code{obs }}{matrix of 100 observations (as row), with 80 timepoints for each}
     \item{ \code{tp  }}{vector of time points, with length 80}
     \item{ \code{cp  }}{vector of covariates for each subject, with length 100}
      \item{  \code{pars}}{parameter list with \code{mean, logvar} (matrices of 100 by 80) and \code{shape, skew} (vectors of length 80)}
     \item{ \code{corr}}{correlation matrix to determine the Gaussian corpula}
     }


     In addition, each data set contains one specific component:
     \describe{
     \item{\code{quantile}}{3-dimensional array with dimension \code{c(5, 100, 80)} for the true quantiles of the quantile levels 
      \code{c(.50, .80, .90, .95, .99)}; only available for the training data set \code{DST}}
     \item{\code{obs.full}}{fully observed observation matrix with diemsnion \code{c(100, 80)}, in the validation data set \code{DSV};
     
     \code{obs} in \code{DSV}
     contains missing values, and \code{obs.full} can be used to measure the performance of predication at those points where missing     values are observed. 
     }}
     }
    
  
    
   %  \references{
   %    McNeil, D. R. (1977) \emph{Interactive Data Analysis}.
   %    New York: Wiley.
   %  }
   % require further explannation about the true parameter setting (or refer to the paper)
     \keyword{datasets}
     
     
