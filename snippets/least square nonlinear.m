d=linspace(0,3) %creates 
y = exp(-1.3*d) + 0.05*randn(size(d));
plot (y)
plot (y,'.')
grid on
randn(size(d))
size(d)
y = exp(-1.3*d) + 0.05*randn(1);
plot (y,'.')
randn(1)
randn(1)*0.05
y = exp(-1.3*d) + 0.05*randn(1);
plot (y,'.')
y = exp(-1.3*d) + 0.05*randn(size(d));
plot (y,'.')
plot (d,y,'.')
plot (y,'.')
plot (d,y,'.')
fun=@(r)exp(-d*r)-y;
x0=4;
x=lsqnonlin(fun,x0)
plot(d,y)
plot(d,y,'ko')
plot(d,y,'ko',d,exp(-d*x)
plot(d,y,'ko',d,exp(-d*x))
plot(d,y,'ko',d,exp(-d*x),'b-')
legend('data','fit')
xlabel('t')
ylabel('exp(-tx)')
xlabel('time')
grid on
