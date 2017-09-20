
%--2013 (c)Fawad Karimi
% this script prepares the data for tof_par_fit.m and
% Zeit_Energieumrechnung_Simulation.m


% first, loop over the data saved in .dat files
% Load all files with .dat ending into an array named files
% Loop over all files starting with 1 till end (numel: number of array elements)


tic; % start a timer
files = dir('*.dat');
namen =cell(1,numel(files));
Laenge=0;
%---------Extract the numbers from the title--------
%---------put them in an array----------------------

Energien = {files.name} ; % put the names in a cell array of strings
Energien = strrep(Energien,'eV.dat','') ; % remove extension. replace string 'eV.dat' with emptiness ''
Energien = str2double(Energien); %convert the strings of the file name to numbers
%---------------------------------------------

Transmission=cell(numel(files),2); % define a cell to put eV vs Transmission
for k = 1:numel(files)
D = load(files(k).name); %files(k).name is a string! no need for commata ''
tof_einzeln = D(:,2)*1000;
Transmission{k}=files(k).name;
Transmission{k,2}=length(D);
namen{k}=tof_einzeln;% load each time of flight into a cell construct / construction
av_t=sum(tof_einzeln)/length(tof_einzeln);
tof_average(k)=av_t; % needed for tof_par_fit(E,t)
Laenge= length(D(:,2))+Laenge;
end


%Put all the tofs from each file in one big vector named TOF
TOF=[];
for k = 1:numel(files)
D = load(files(k).name);
d = D(:,2)*1000;
TOF=[TOF,d'];
end

%TOF =vertcat(namen{1},namen{2},namen{3},namen{4},namen{5});
%--------------------------------------------------------

% x and y needed for Zeit_Energieumrechnung_Simulation()
x = min(TOF):0.5:max(TOF);
y = hist(TOF,x);

%---------------------------------------------------------

[tof_parameter,fit_function]=tof_par_fit(Energien,tof_average);

C=tof_parameter(1);
U=tof_parameter(2);
t0=tof_parameter(3);
e_min=min(Energien)-2;
e_max=max(Energien)+2;

[energie_final,Intensitaet]=Zeit_Energieumrechnung_Simulation(y,x,C,U,t0,e_min,e_max);


toc %stops a stopwatch started by the tic function, and displays the time elapsed in seconds.
