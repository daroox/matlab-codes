

% routine to determine the pulse width

clear; close; clc
files =dir('*.dat');
s = size(files,1);
fac = 1; %where to start plotting traces

fileName = 'un-streakedCH1.txt';
% create file/overwrite existing 
fileID = fopen(fileName,'w'); 
fprintf(fileID,'%6s %12s\r\n','% peak1 fwhm','peak2 fwhm');%header

for k = 0:s-1
    datFile = sprintf('C1TOF1_Xe_zero crossing_Lower harmonic0000%d.dat',k);
    %char = sprintf('A%d',k)
    %fi = sprintf('figure(%d)',k+1); 
         D = load(datFile);
         t = D(fac:end,1)*1e9; 
         values = D(fac:end,2)*-1000;
%call function with variables
[delay,energie_interpol,Intensitaet,N_interpol]=Time2EnergyStreaking(values,t,1,50);
% put the above func into peakfit         
[Fit,GOF,baselin,coeff,res,xi,yi]=peakfit([energie_interpol',N_interpol'],22,10,2,1,0,5, [22.3 1 23.5 1], 2);

% put fitresults in a file 
fileID = fopen(fileName,'a');
myformat = '%d \t %3.4f \t %3.4f\n';
fprintf(fileID,myformat ,Fit(1,1),Fit(1,4),Fit(2,4));
fclose(fileID);
end
% calc average of fwhm of peaks
GG = load('un-streakedCH1.txt');
P1 = GG(:,2);
P2 = GG(:,3);
av1 = sum(P1)/length(P1);
av2 = sum(P2)/length(P2);
fileID = fopen(fileName,'a');
fprintf(fileID,'%6s %12s\r\n','% average1','average2');%header
fprintf(fileID,myformat,Fit(1,1),av1,av2);
fclose(fileID);
