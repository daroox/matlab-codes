%% this code does:
% gets rid of useless lines saves files in *.dlm
tic
clear all
files = dir('*.dat');
u=[2,4];


for k = 0:numel(files)-1
	datFile = sprintf('%d.dat', k);
   		Data = load(datFile);
        ch = Data(u,:);
        ch(:,1000:end)=[];
        datFile = sprintf('%d.dlm',k);
        dlmwrite(datFile,ch);
end

fprintf('done in %0.2f seconds' ,toc)
