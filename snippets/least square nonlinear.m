

clear all; close all; clc

tic
d = linspace(0,3); % creates hundred evenly spaced pts betw 0 and 3 
y = exp(-1.3*d) + 0.05*randn(size(d));

% now define your guess function, that could fit the data! 
fun=@(r)exp(-d*r)-y;
x0=4; % Arbitrarily choose an initial guess x0 = 4.

% start the optimization function, which returns a value to x variable
x = lsqnonlin(fun,x0)

plot(d,y,'ko',d,exp(-d*x),'b-')
legend('data','fit')
xlabel('t')
ylabel('exp(-tx)')
xlabel('time')
grid on
fprintf ('code executed in %0.2f seconds',toc)
