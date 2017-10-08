function z = drawGaussian(t_fwhm)

t = -(0.50*t_fwhm+t_fwhm):0.1:(0.50*t_fwhm+t_fwhm);
c =num2str(t_fwhm);
tau = t_fwhm;
LG = -4*log(2);
T = 0;
z =0;


for k = 1:size(t,2)
    T(k) = (t(k)/tau)^2;
    z(k) = exp(LG*T(k)); 
end

plot (t,z)
title(['Gaussian pulse with ', c, ' as' ])
xlabel('Time (as)')
ylabel('Power (normalized)')
grid on
grid minor

end
