clear all;
close all;


a=load('Scanresult Step 9Average Trace.dat');
%caen digitizer throws 8 rows
%only row 2 and row 4 are data
u=[2 4];
A=a(u,:);
%AA=A';
%

ch1=A(1,:);
ch2=A(2,:);
% 
%traces are too long, define a cutoff
start =230;
cutoff=290; 
x=start:cutoff;
x=x';

ch2=ch2(start:cutoff); 
%substract the baseline
T=ch2-597;
T=T*-1;
% x=x(230:270);
% y=ch2(230:270);
% %ch2t=ch2t*-1;
 
peakfit([x,T'],250,30,3,1,0,10)
 
 %plot(x,ch2,'-')
