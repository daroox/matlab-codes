
tic 
clear all; close all;  

offset = 600;
C = 655.1772;
U = -0.1951;
t0 = -9.9444;
td=5.5;
files = dir('*.dlm');
E=[];

for j =1:numel(files)-1
   	datFile = sprintf('%d.dlm', j);
   	Data = load(datFile);
    amp_t=-1*(Data(2,:)-offset);
    s =size(amp_t,2);
    tof=1:s;
for k=1:s
    %tof(k)=tof(k)-td;
        energy1(k)=C/((td+t0-tof(k))^2)-U;
end

for l = 1:s
     amp_e(l) = amp_t(l)*(C/((energy1(l)+U)^1.5))/2;
  % corr(m,l) =     i(m)*(C/((energie(m)+U)^1.5))/2;
  %*
  %(sqrt(C)/(2*((energy1(l)+U)^(3/2))))
end
E =[E amp_t'];
end

% time in ps;  50 k steps = 50 ps
res = 25;  % resolution of each step, in motor steps
RangeOfStageinTime = (numel(files)*res)/1000; %picosecs
d =0:RangeOfStageinTime; % define delay axis for the plot
energy1range=energy1(1)-energy1(numel(energy1));

% energy in eV
resolution=energy1(numel(energy1)):energy1range/numel(energy1):energy1(1);

subplot(3,1,1);
imagesc(d,resolution, E)
colorbar
subplot(3,1,2)
plot(tof,amp_t)
subplot(3,1,3)
plot(energy1,amp_e)
fprintf('done in %0.2f seconds',toc )


