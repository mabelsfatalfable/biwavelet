% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xwt.R
\name{xwt}
\alias{xwt}
\title{Compute cross-wavelet}
\usage{
xwt(d1, d2, pad = TRUE, dj = 1/12, s0 = 2 * dt, J1 = NULL,
  max.scale = NULL, mother = "morlet", param = -1, lag1 = NULL,
  sig.level = 0.95, sig.test = 0, arima.method = "CSS")
}
\arguments{
\item{d1}{Time series 1 in matrix format (\code{n} rows x 2 columns). The
first column should contain the time steps and the second column should
contain the values.}

\item{d2}{Time series 2 in matrix format (\code{n} rows x 2 columns). The
first column should contain the time steps and the second column should
contain the values.}

\item{pad}{Pad the values will with zeros to increase the speed of the
transform.}

\item{dj}{Spacing between successive scales.}

\item{s0}{Smallest scale of the wavelet.}

\item{J1}{Number of scales - 1.}

\item{max.scale}{Maximum scale. Computed automatically if left unspecified.}

\item{mother}{Type of mother wavelet function to use. Can be set to
\code{morlet}, \code{dog}, or \code{paul}. Significance testing is only
available for \code{morlet} wavelet.}

\item{param}{Nondimensional parameter specific to the wavelet function.}

\item{lag1}{Vector containing the AR(1) coefficient of each time series.}

\item{sig.level}{Significance level.}

\item{sig.test}{Type of significance test. If set to 0, use a regular
\eqn{\chi^2} test. If set to 1, then perform a time-average test. If set to
2, then do a scale-average test.}

\item{arima.method}{Fitting method. This parameter is passed as the
\code{method} parameter to the \code{\link{arima}} function.}
}
\value{
Returns a \code{biwavelet} object containing:
\item{coi}{matrix containg cone of influence}
\item{wave}{matrix containing the cross-wavelet transform}
\item{wave.corr}{matrix containing the bias-corrected cross-wavelet transform
  using the method described by \code{Veleda et al. (2012)}}
\item{power}{matrix of power}
\item{power.corr}{matrix of bias-corrected cross-wavelet power using the
  method described by \code{Veleda et al. (2012)}}
\item{phase}{matrix of phases}
\item{period}{vector of periods}
\item{scale}{vector of scales}
\item{dt}{length of a time step}
\item{t}{vector of times}
\item{xaxis}{vector of values used to plot xaxis}
\item{s0}{smallest scale of the wavelet }
\item{dj}{spacing between successive scales}
\item{d1.sigma}{standard deviation of time series 1}
\item{d2.sigma}{standard deviation of time series 2}
\item{mother}{mother wavelet used}
\item{type}{type of \code{biwavelet} object created (\code{\link{xwt}})}
\item{signif}{matrix containg significance levels}
}
\description{
Compute cross-wavelet
}
\examples{
library(biwavelet)

t1 <- cbind(1:100, rnorm(100))
t2 <- cbind(1:100, rnorm(100))

# Compute Cross-wavelet
xwt.t1t2 <- xwt(t1, t2)
plot(xwt.t1t2, plot.cb = TRUE, plot.phase = TRUE,
     main = "Plot cross-wavelet and phase difference (arrows)")

# Real data
data(enviro.data)

# Cross-wavelet of MEI and NPGO
xwt.mei.npgo <- xwt(subset(enviro.data, select = c("date", "mei")),
                    subset(enviro.data, select = c("date", "npgo")))
                    
# Make room to the right for the color bar
par(oma = c(0, 0, 0, 1), mar = c(5, 4, 4, 5) + 0.1)
plot(xwt.mei.npgo, plot.cb = TRUE, plot.phase = TRUE)
}
\references{
Cazelles, B., M. Chavez, D. Berteaux, F. Menard, J. O. Vik, S. Jenouvrier,
and N. C. Stenseth. 2008. Wavelet analysis of ecological time series.
\emph{Oecologia} 156:287-304.

Grinsted, A., J. C. Moore, and S. Jevrejeva. 2004. Application of the cross
wavelet transform and wavelet coherence to geophysical time series.
\emph{Nonlinear Processes in Geophysics} 11:561-566.

Torrence, C., and G. P. Compo. 1998. A Practical Guide to Wavelet Analysis.
\emph{Bulletin of the American Meteorological Society} 79:61-78.

Torrence, C., and P. J. Webster. 1998. The annual cycle of persistence in the
El Nino/Southern Oscillation. \emph{Quarterly Journal of the Royal
Meteorological Society} 124:1985-2004.

Veleda, D., R. Montagne, and M. Araujo. 2012. Cross-Wavelet Bias Corrected by
Normalizing Scales. \emph{Journal of Atmospheric and Oceanic Technology}
29:1401-1408.
}
\author{
Tarik C. Gouhier (tarik.gouhier@gmail.com)
Code based on WTC MATLAB package written by Aslak Grinsted.
}
