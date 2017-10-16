% March 2017
% Fawad Karimi
% script plots the data from THz-robot & rescale axes
%% if file is comma separated, change to dot separated
FileName ='12.5mm x 12.5mm 2000x2000 spike removed.dat'; 
NewFileName = FileName; %new file has the same,%it overwrites the old file!
TITLE = 'profile at xx cm behind the LiNBO3 crystal';  
SmallStepsX = 40; % number of steps between large steps
SmallStepsY = 40; % number of motor steps --//-- in y direction
%% remove commata with dots
Data = fileread(FileName);
Data = strrep(Data, ',', '.');
FID = fopen(NewFileName, 'w');
fwrite(FID, Data, 'char');
fclose(FID);
%% load the data
B = load(FileName);%load the file containing the data
%B =B*-1; % invert the values
A = imrotate(B,90); %rotate the image 90 degs
BigStepsX = size(B,1); % get the dimension of the matrix
BigStepsY = size(B,2); 
%%   convert the axes from steps into millimeters
convX = (BigStepsX*SmallStepsX*1.25)/200;
convY = (BigStepsY*SmallStepsY*1.25)/200;
newX = linspace(0,convX,6);
newY = linspace(0,convY,4);
xx = 1:size(newX,2);
yy = 1:size(newY,2);
%% plotting
imagesc(A) 	% plot the rotated ! matrix
%colorbar	%show the colorbar
colormap(jet) % options parula,jet,hsv,hot,gray
%title(TITLE);
ax1=gca; %get current axis (gca) and give it to ax1
ax2 = axes('YAxisLocation', 'right','XAxisLocation','top','Color','none');
x2 = 1:20;
set(ax2, 'XLim', [min(newX) max(newX)],'XColor','r')
set(ax2, 'YLim', [min(newY) max(newY)],'YColor','r')
ylabel(ax2,'distance (mm)')
xlabel(ax2,'distance (mm)')
ylabel(ax1,'number of steps ')
xlabel(ax1,'number of steps ')
%surf(B) 
%hold on
%imagesc(B)
