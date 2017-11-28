nfig = 546;

figure(nfig);


figure(nfig);plot(energie_interpol,N_interpol,'.', xi,yi(1,:),':',xi,yi(2,:),':', xi,yi(3,:),':',xi,zi,'LineWidth',1.5)

xlabel 'Energy (eV)'

ylabel 'Amplitude (a.u.)'
%legend('\Delta\tau_X(fs)\Delta\epsilon (eV) = 1.825','Location','northwest')
legend('measurement','peak #1','peak #2','peak #3','sum','Location','northwest')

grid on
grid minor
