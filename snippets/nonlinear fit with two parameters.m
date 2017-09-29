% from https://de.mathworks.com/help/optim/ug/lsqnonlin.html#buuhch7-3
% this example shows how to use lsqnonlin fit with two parameters

% generate data
t = linspace(-4,4);   
y = 1/sqrt(2*pi)*exp(-t.^2/2);

% define a guess function
fun = @(x)x(1)*exp(-t).*exp(-exp(-(t-x(2)))) - y;
lb = [1/2,-1]; % lower bound for x1 and x2; same for the following parameters
ub = [3/2,3];
x0 = [1/2,0]; % initiate x(1) and x(2)

x = lsqnonlin(fun,x0,lb,ub)

plot(t,y,'mp',t,fun(x)+y,'bh',t,y,'-')
legend('pseudo data','fit')
