% Eingabe e=Energie-Vektor, t=Flugzeit-Vektor
function [tof_par,fitfun] =  tof_par_fit(e,t)
%Achtung t in ns angeben, SIMION gibt standardmässig us an. 
C0 = 300; %Fitparameter initalisieren
U0 = -4;
t0 = 3;

x0=[C0 U0 t0];
lb = [0 -1000 -1000]; %Untere Grenze der Fitparameter
ub = [5000 10 1000]; % Obere Grenze der Fitparameter
%lsqnonlin least square nonlinear 
[opt,resnorm] = lsqnonlin(@fit_res,x0,lb,ub,optimset('MaxFunEvals',1e5, 'MaxIter', 1e5));

tof_par = opt;

 function y = fit_res(x)
              t_fit=(x(1)./sqrt(e+x(2)))-x(3);
              y = (t-t_fit);
 end

fitfun = (tof_par(1)./sqrt(e+tof_par(2)))-tof_par(3);
plot(e,t,e,fitfun)
title('Time of Flight fit function')
xlabel('Energy [eV]')
ylabel('TOF [ns]')

end 