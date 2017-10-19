
%% description
% routine to determine the pulse width. First it loads the files
% calls for Time2EnergyStreaking.m then passes the energy Vs counts to
% peakfit.m which determines the peak-width (FWHM). After that the returned
% fitparmeters are sorted and the average is saved in a text file.
% 2017 FK Hamburg

%% 
clear; close; clc
P = [];
files =dir('*.dat');
s = size(files,1);
fac = 1;     %where to start plotting traces
myformat = '%3.4f \t %3.4f\n';
fileName = 'pulsewidths.txt';

for k = 0:s-1
    datFile = sprintf('C2TOF2_Xe_zero crossing_Lower harmonic xuv thz0000%d.dat',k);
         D = load(datFile);
         t = D(fac:end,1)*1e9; 
         values = D(fac:end,2)*-1000;
%call function with variables
[delay,energie_interpol,Intensitaet,N_interpol]=Time2EnergyStreaking(values,t,1,50);
% put the above func into peakfit         
[Fit,GOF,baselin,coeff,res,xi,yi]=peakfit([energie_interpol',N_interpol'],19.3,10,2,1,0,10, [22.3 1 23.5 1], 2);
P =[P;Fit];
end
% calc average of fwhm of peaks
P
P = sortrows(P,2);
fileID = fopen(fileName,'W');
fprintf(fileID,'%6s %12s\r\n','% av1','av2');%header
fprintf(fileID,myformat,mean(P(1:3,4)),mean(P(4:6,4)));
fclose(fileID);
P
copyfile pulsewidths.txt ..\..