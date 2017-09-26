
%% (c) Fawad Karimi 2017
%   this script plots the THz-scan data from caen Digitizer

tic
clear all
close all
% find the number of files/ steps 
files = dir('*.dat');


u=[2,4]; %  needed to get rid of junk in the caen files
CH1=[];
CH2=[];
for k = 0:numel(files)-1
    % Create  filename, and load it into a structure called Data.
	datFile = sprintf('%d.dat', k);
		Data = load(datFile);
        ch = Data(u,:);
        ch1=ch(1,:);
        ch2 = ch(2,:);
        CH1=[CH1 ch1'];
        CH2=[CH2 ch2'];
end


%%   plott scans side by side 

subplot(1,2,1);
imagesc(CH1);
colorbar
title('channel 1')
xlabel('motor steps, w/o the step res')
ylabel('time of flight (ns)')

subplot(1,2,2);
imagesc(CH2);
colorbar
title('channel 2')
xlabel('motor steps, w/o the step res')
ylabel('time of flight (ns)')
toc
