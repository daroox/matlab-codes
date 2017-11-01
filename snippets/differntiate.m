% numerical differntiation with matlab=
% f_p has one element lesser than f
%% 

clear;close
h = 0.1;
x = -pi:h:pi;
f = sin(x);
f_p = diff(f)/h;
plot(x,f,'mh',x(1,1:end-1),f_p)


%%
