

figure(222); plot(energie_interpol,N_interpol,'.',xi,yi(1,:),xi,yi(2,:),xi,yi(1,:)+yi(2,:),'LineWidth',1.5)


legend('energy from time of flight ','fit: peak 1','fit: peak 2','sum: peak 1 and peak 2')
ylabel 'Amplitude (a.u.)'
xlabel 'Energy (eV)'

ylim([0 480])
xlim([15 17.5])
legend('Location','west')
