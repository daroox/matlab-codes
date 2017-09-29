

clear all; close all; clc   % clc clears the screen

tic   % starts a stopwatch to be stopped by the function toc
d = linspace(0,3); % creates hundred evenly spaced pts betw 0 and 3   | this line is the independent variable
y = exp(-1.3*d) + 0.05*randn(size(d));              %                 | this is so to say the measured quantity

% now define your guess function, that could fit the data tendence ! 
fun = @(r)exp(-d*r) - y;  % notice that the exp function is substracted by y! we are minimizing
x0=4; % Arbitrarily choose an initial guess x0 = 4.

% start the optimization function, which returns a value to x variable
x = lsqnonlin(fun,x0)

plot(d,y,'dc',d,exp(-d*x),'b-')   % 'dc' d:diamond  c:cyan
legend('data','fit')
xlabel('t')
ylabel('exp(-tx)')
xlabel('time')
grid on
fprintf ('code executed in %0.2f seconds',toc)    % stops a stopwatch started by the function tic
