function [tof_par,fitfun] =  tof_par_fit(e,t)
%Achtung t in ns angeben, SIMION gibt standardmässig us an. 
C0 = 550; %Fitparameter initalisieren
U0 = 0;
t0 = 0;


C0=double(C0);
U0=double(U0);
t0=double(t0);
x0=[C0 U0 t0];

lb = [0 -1000 -10000]; %Untere Grenze der Fitparameter
ub = [100000 1000 10000]; % Obere Grenze der Fitparameter

[opt,resnorm] = lsqnonlin(@fit_res,x0,lb,ub,optimset('MaxFunEvals',1e5, 'MaxIter', 1e5));

tof_par = opt;
 function y = fit_res(x)
            t_fit=(x(1)./sqrt(e+x(2)))-x(3);
              y = (t-t_fit);
end

fitfun = (tof_par(1)./sqrt(e+tof_par(2)))-tof_par(3);
plot(e,t,e,fitfun)



end
