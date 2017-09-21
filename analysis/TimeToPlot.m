% (c) Fawad Karimi 2017
% this code takes the caen files and plots them

%% begin 
clear all
%% (c) Fawad Karimi 2017
%   this script plots the THz-scan data from caen Digitizer

%% clear junk and define variables and start & cutoff values
tic
clear all
close all
%find out the number of files 
files = dir('*.dat');

start_ch1 =200; % traces recorded are too long
cutoff_ch1=300;
start_ch2 =200;
cutoff_ch2=300;
U=0.5025;
 %  needed to get rid of junk in the caen files
%tmp = [1:2044]';
u=[2,4];
CH1=[];
CH2=[];
for k = 0:numel(files)-1
    % Create  filename, and load it into a structure called Data.
	datFile = sprintf('%d.dat', k);
    %if exist(datFile, 'file')
		Data = load(datFile);
        ch = Data(u,:);
        ch1=ch(1,:);
        ch1=ch1(start_ch1:cutoff_ch1);
        %ch1=(700./(ch1.^2))-U;
        ch2 = ch(2,:);
        ch2=ch2(start_ch2:cutoff_ch2); 
       % ch2=(700./(ch2.^2))-U;
        CH1=[CH1 ch1'];
        CH2=[CH2 ch2'];
 %else
	%	fprintf('File %s does not exist.\n', datFile);
  %  end
end
%   plott scans side by side 
subplot(1,2,1);
imagesc(CH1);
title('channel 1')
xlabel('number of steps')
ylabel('time of flight (ns)')
subplot(1,2,2);
imagesc(CH2);
title('channel 2')
xlabel('number of steps')
ylabel('time of flight (ns)')
  
toc %time keeping