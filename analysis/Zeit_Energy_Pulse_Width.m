%function [delay,energie_final,Intensitaet] = Time2EnergyStreaking(values,t_ns,e_min,e_max)

values = yb;
t_ns =tb;
e_min = 1;
e_max = 30;


energie = [];   t_echt=0;       original = [];      corr =[];
corr_red = [];  energie =[];    energie_red=[]; array_size = [];
length = [];    width = []; corr_red_interp = [];   x_d=[];
delay = [];     energie_interpol = [];

C = 690;
U = -1.1951;
t0 = 0;
td = 0;

original=values;
e_intervall = 0.02;
energie_interpol = e_min:e_intervall:e_max; % neue Energie                                            %stützstellen
%delta_t = (0.025); %Zeit die einem Delayschritt entspicht                                      %in ps    
%--------------------------------------------------------------------------
array_size = size(original);
length = array_size(1);
width = array_size(2);
%-------------------------------------------------------------------------
% Zeit in Energie umrechnen, bei negativen Flugzeiten wird die Energie auf
% -100 gestzt um die Werte später auszusortierenC
for k=1:length
    t_echt = t_ns(k)-td+t0;
    %t_echt = t_ns(k)-td-t0;
    if t_echt>0
        energie(k) = (C/(t_echt))^(2)-U;          
    else 
        energie(k)=-100;
    end
end

    % Korrigierte Signalhöhen ausrechnen.
   corr = [];
   for l = 1:width
       for m = 1:length   
              corr(m,l) = original(m,l)*(C/((energie(m)+U)^1.5))/2;
              end
   end
   % Werte mit negativen Flugzeiten oder mit Energien kleiner als Uret
   % aussortieren, alle anderen Werte in corr_red schreiben
   corr_red = corr;
   energie_red = energie;

   for n = 1:length
       if (energie(length+1-n)<0)
         corr_red(length+1-n,:)=[];
         energie_red(length+1-n) = [];
       end
   end

   %Energiewerte mit gleichmäßigem Abstand wählen und die Signalwerte
   %interpolieren
   
    corr_red_interp =[];
   for l = 1:width
       y = corr_red(:,l);
       N_interpol = interp1(energie_red,y,energie_interpol,'linear');
       corr_red_interp = [corr_red_interp N_interpol'];
   end
   size(energie_red)
   size(corr_red_interp)
  
%    energie = energie';
%    z = size(energie)
%    poo = size(corr_red_interp)
       figure(2); plot(energie_red,y)
       legend('w/o interp') 
       grid on
     figure(3);  plot(energie_interpol,N_interpol)
     legend('interpolated')
     grid on
     %minorgrid
     %figure(3); plot(energie_red,y)
   %Daten über Energie und Delay plotten
    %figure(3)
%    x_d = 1:width;
%    delay = x_d * delta_t;
    %imagesc(delay,energie_interpol,corr_red_interp)
   %colormap(parula)
  % caxis([-50 200])
  %colorbar[-50 200] ch1
  %caxis([-100 700])
%    xlabel('Delay (ps)','FontSize',12)
%    ylabel('Kinetic Energy (eV)','FontSize',12)

energie_final = energie_interpol;
Intensitaet = corr_red_interp;

%----------------------------------------------------------------
%                   CALL FOR PEAKFIT()
%----------------------------------------------------------------
%peakfit([energie_interpol,N_interpol],150,20,2,1,0,3)
