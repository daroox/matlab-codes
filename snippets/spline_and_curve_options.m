t=2*pi;
x=1:t;
y=sin(x);
pts = 1:0.1:t;
v = interp1(x,y,pts,'spline');
plot(x,y,':.',pts,v,'-');
