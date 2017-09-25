
%% (c) Fawad Karimi 2017
%   this script plots the THz-scan data from caen Digitizer

tic
clear all
close all
% find the number of files/ steps 
files = dir('*.dat');

%% USER DEFINED Parameters
res = 25;  % resolution of each step
start_ch1 =200; % traces recorded are too long
cutoff_ch1=300;
start_ch2 =200;
cutoff_ch2=300;
clims1 = [730 760]; % for colorbar
clims2 = [400 600]; % for colorbar
U=0.5025; % find this parameter by simulation

%%
u=[2,4]; %  needed to get rid of junk in the caen files
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

%% Define x and y axes for both plots

RangeOfStageinTime = (numel(files)*res)/1000; %picosecs
% define delay axis for the plot
d =0:RangeOfStageinTime;
% define y-axis in ns
y1 = start_ch1:cutoff_ch1;
y2 = start_ch2:cutoff_ch2;

%%   plott scans side by side 

subplot(1,2,1);
imagesc(d,y1,CH1,clims1);
colorbar
title('channel 1')
xlabel('Delay (ps)')
ylabel('time of flight (ns)')

subplot(1,2,2);
imagesc(d,y2,CH2,clims2);
colorbar
title('channel 2')
xlabel('Delay (ps)')
ylabel('time of flight (ns)')
toc
