
clear all
U=0.5025;
u=[2,4];  %  needed to get rid of junk in the caen files

CH1=[];
for k = 1:4
    % Create  filename, and load it into a structure called Data.
	datFile = sprintf('%d.dat', k);
 %if exist(datFile, 'file')
		Data = load(datFile);
        ch = Data(u,:);
     
    one=sprintf('%dCh1',k);
    one=ch(1,:);
    CH1=[CH1,one];
 %else
	%	fprintf('File %s does not exist.\n', datFile);
  %  end
end
