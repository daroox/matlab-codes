![image](T2E.jpg)
----
#### Peakfit Properties

```javascript
[FitResults, GOF, baseline, coeff, residuals, xi, yi, BootResults]=peakfit(signal, center, window, NumPeaks, peakshape, extra, NumTrials, start, AUTOZERO, fixedparameters, plots, bipolar, minwidth, DELTA, clipheight))
```

The screen display is shown on the right; the upper panel shows the data as blue dots, the combined model as a red line (ideally overlapping the blue dots), and the model components as green lines. The dotted magenta lines are the first-guess peak positions for the last fit. The lower panel shows the residuals (difference between the data and the model).

![image](https://terpconnect.umd.edu/~toh/spectrum/peakfit7.png)

##### peakfit(signal)     
  Performs an iterative least-squares fit of a single unconstrained Gaussian peak to the entire data matrix "signal", which has x values in row 1 and Y values in row 2 (e.g. [x y]) or which may be a single signal vector (in which case the data points are plotted against their index numbers on the x axis).
  
  ##### peakfit(signal,center,window)      
  Fits a single unconstrained Gaussian peak to a portion of the matrix "signal". The portion is centered on the x-value "center" and has width "window" (in x units). 
  
  ##### peakfit(signal,center,window,NumPeaks,peakshape)
Number or vector that specifies the peak shape(s) of the model:  1=unconstrained Gaussian, 2=unconstrained Lorentzian, 3=logistic distribution, 4=Pearson, 5=exponentially broadened Gaussian; 6=equal-width Gaussians, 7=equal-width Lorentzians, 8=exponentially broadened equal-width Gaussians, 9=exponential pulse, 10= up-sigmoid (logistic function), 11=fixed-width Gaussians, 12=fixed-width Lorentzians, 13=Gaussian/Lorentzian blend; 14=bifurcated Gaussian, 15=Breit-Wigner-Fano resonance; 16=Fixed-position Gaussians; 17=Fixed-position Lorentzians; 18=exponentially broadened Lorentzian; 19=alpha function; 20=Voigt profile; 21=triangular; 23=down-sigmoid; 25=lognormal distribution; 26=linear baseline (see Example 28); 28=polynomial (extra=polynomial order; Example 30); 29=articulated linear segmented (see Example 29);  30=independently-variable alpha Voigt; 31=independently-variable time constant ExpGaussian; 32=independently-variable Pearson; 33=independently-variable Gaussian/Lorentzian blend;  34=fixed-width Voigt; 35=fixed-width Gaussian/Lorentzian blend; 36=fixed-width exponentially-broadened Gaussian; 37=fixed-width Pearson; 38= independently-variable time constant ExpLorentzian; 39= alternative independently-variable time constant ExpGaussian (see Example 39 below); 40=sine wave;  41=rectangle; 42=flattened Gaussian; 43=Gompertz function (3 parameter logistic: Bo*exp(-exp((Kh*exp(1)/Bo)*(L-t)+1))); 44=1-exp(-k*x);  45: Four-parameter logistic y = maxy*(1+(miny-1)/(1+(x/ip)^slope)); 46=quadratic baseline (see Example 38); 47=blackbody emission; 48=equal-width exponential pulse. (The function ShapeDemo demonstrates most of the basic peak shapes graphically, showing the variable-shape peaks as multiple lines).
##### Used by me currently:  peakfit(signal,center,window,NumPeaks,peakshape, extra, NumTrials)
----
#### Anonymous function
an anonymous function is simply a function that exists only in memory - not in an \*.m file
