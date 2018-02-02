close all
x1=min(X2):max(X2);
y1=2.8+23*exp(-.5*((x1+15)/190).^2);
plot(X2,Y2,'o',x1,y1,'LineWidth',1.2)
xlabel 'distance (mm)'
ylabel 'intensity (arb. units)'
legend('Measurement','Gaussian Fit')
axes('pos',[.03 .6 .5 .3]) % create second axis for foto
imshow('WTF-1.png')
