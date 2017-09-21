%% (c) Fawad Karimi 2017
%   this script plots the THz-scan data from caen Digitizer

%% clear junk and define variables and start & cutoff values
clear all
close all
tic
start_ch1 =100; % traces recorded are too long
cutoff_ch1=300;
start_ch2 =100;
cutoff_ch2=300;
U=0.5025;
u=[2,4];  %  needed to get rid of junk in the caen files
%tmp = [1:2044]';
CH1=[];
CH2=[];
for k = 1:300
    % Create  filename, and load it into a structure called Data.
	datFile = sprintf('%d.dat', k);
    %if exist(datFile, 'file')
		Data = load(datFile);
        ch = Data(u,:);
        one=ch(1,:);
        one=one(start_ch1:cutoff_ch1);
        two = ch(2,:);
        two=two(start_ch2:cutoff_ch2); 
        CH1=[CH1 one'];
        CH2=[CH2 two'];
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
