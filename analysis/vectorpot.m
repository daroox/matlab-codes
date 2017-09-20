delay_time = MaxXAvgTracesEnergy(:,1);
center     = MaxXAvgTracesEnergy(:,2);

interpolateSingleShot = 'on';
degree_of_Interpolation = 2;

if(strcmp(interpolateSingleShot,'on'))
center_ss = center;
[delay_time_Median,center_Median] = f_interpolateMedian(delay_time,center_ss,degree_of_Interpolation); 
end

figure
plot(delay_time,center,'-xb');
ylabel('W [eV]');
xlabel('delay time [ps]');

if(strcmp(interpolateSingleShot,'on'))
hold on
plot(delay_time_Median,center_Median,'-r');
hold off

% satisfied ?
delay_time = delay_time_Median;
center = center_Median;
end

W0 = 21.5; % eV
Delta_W = 4.76; % eV
D_Ekin = center-W0; %eV
e = 1.602e-19; % C per electron
me = 9.11e-31; % mass per electron;
nu_THz = 0.6; % [THz]
s_max = 6.8; % linear fit from plot
time_offset = 0;



A = (D_Ekin*e)/e*sqrt(me/(2*W0*e));  %[Vs/m]
Amax = 5.54*sqrt(me/(2*W0*e));        %[Vs/m]

windowSize = 5;
A_interp = filter(ones(1,windowSize)/windowSize,1,A);
A_interp(1:windowSize)=A(1:windowSize);

D_Ekin_interp = filter(ones(1,windowSize)/windowSize,1,D_Ekin);
D_Ekin_interp(1:windowSize)=D_Ekin(1:windowSize);

%A_interp = spline(delay_time,A,linspace(min(delay_time),max(delay_time),round(length(delay_time)*2)));
%figure;
%plot(delay_time, A_interp,'-k',delay_time, A,'xb');
delay_time_spline = linspace(min(delay_time),max(delay_time),round(length(delay_time)));
A_spline = spline(delay_time,A_interp,delay_time_spline);
D_Ekin_spline = spline(delay_time,D_Ekin_interp,delay_time_spline);
%figure;
%plot(delay_time, A_interp,'-ok',delay_time_spline, A_spline,'xb');

dt = delay_time_spline(2)-delay_time_spline(1);
s = diff(D_Ekin_spline)/(dt);
E = diff(A_spline)/(dt*1e-12)/1e6;
Emax = Amax*2*pi*nu_THz*1e12/1e6;  % [MV/m]
delay_time_spline_diff = delay_time_spline(1:end-1)+time_offset;
figure;
plot( delay_time_spline_diff,E,'-xb');
hold on
plot( delay_time_spline_diff(end),Emax,'or');
hold off
ylabel('E [MV/m]');
xlabel('delay time [ps]');

figure;
plot( delay_time_spline_diff,s,'-xb');
hold on
plot( delay_time_spline_diff(end-1),s_max,'or');
hold off
ylabel('s [meV/fs]');
xlabel('delay time [ps]');
