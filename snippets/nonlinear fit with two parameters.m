t = linspace(-4,4);
y = 1/sqrt(2*pi)*exp(-t.^2/2);
plot(y)
plot(y,'.')
plot(t,y,'.')
fun = @(x)x(1)*exp(-t).*exp(-exp(-(t-x(2)))) - y;
lb = [1/2,-1]; % lower bound for x1 and x2; same for the following parameters
ub = [3/2,3];
x0 = [1/2,0];
x = lsqnonlin(fun,x0,lb,ub)
plot(t,y,'r-',t,fun(x)+y,'b-')
xlabel('t')
legend('Normal density','Fitted function')
plot(t,y,'r.',t,fun(x)+y,'b-')
plot(t,y,'y.',t,fun(x)+y,'b-')
plot(t,y,'v.',t,fun(x)+y,'b-')
plot(t,y,'m.',t,fun(x)+y,'b-')
plot(t,y,'m.',t,fun(x)+y,'bp')
p
plot(t,y,'mp',t,fun(x)+y,'bp')
plot(t,y,'mp',t,fun(x)+y,'bh')
grid on
legend('pseudo data','fit')
plot(t,y,'mp',t,fun(x)+y,'bh',t,y,'-')
legend('pseudo data','fit')
