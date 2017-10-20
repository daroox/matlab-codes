%% this code does:
% get rid of useless lines full of zeroes and subtracts the background
%
%saves files in *.dlm
% if new .dlm files are desired delete the all dlm files using
% delete *.dlm

%%

clc; tic; clear all

%   delete *.dlm       %   take care not to delete bg.dlm


files = dir('*.dat');
u=[2,4]; % selects rows 2 and 4 
col = 500;
BG = load('BG_both_channels.dat'); %    load background
BG = BG(u,:);
BG(:,col:end)=[];
numberoffiles = numel(files);
last = numberoffiles-2;
for k = 0:last

    datFile = sprintf('%d.dat', k);
   		Data = load(datFile);
        ch = Data(u,:);
        ch(:,col:end)=[]; % delete col to end col
        ch = ch-BG;   % subtract Background
        ch = -1*ch;
        datFile = sprintf('%d.dlm',k);
        dlmwrite(datFile,ch);
end

fprintf('done in %0.2f seconds' ,toc)
