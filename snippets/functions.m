
% https://de.mathworks.com/help/matlab/ref/function.html?searchHighlight=function&s_tid=doc_srchtitle

% writing a function has the following conventions
% one function per script; functions defined in a function file are just locally available
% the following function for example should be saved as stat.m
% it takes one argument and returns two values

function [m,s] = stat(x)
n = length(x);
m = sum(x)/n;
s = sqrt(sum((x-m).^2/n));
end

% -----------------------------------------------------
%% the following funtion should be saved as average.m

function y = average(x)
if ~isvector(x)
    error('Input must be a vector')
end
y = sum(x)/length(x); 
end

% ------------------------------------------------


%% some advanced stuff
% Compute the value of the integrand at 2*pi/3.
x = 2*pi/3;
y = myIntegrand(x)

% Compute the area under the curve from 0 to pi.
xmin = 0;
xmax = pi;
f = @myIntegrand;
a = integral(f,xmin,xmax)

function y = myIntegrand(x)
y = sin(x).^3;
end
