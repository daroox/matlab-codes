function [energie_final,Intensitaet] = Zeit_Energieumrechnung_Simulation(Elektron_Signal,t_ns,C,U,t0,e_min,e_max)

energie = [];
t_echt=0;
original = [];
corr =[];
corr_red = [];
energie =[];
energie_red=[];
corr_red_interp = [];
energie_interpol = [];
original = Elektron_Signal;

e_intervall = 0.01;
energie_interpol = e_min:e_intervall:e_max; % Das sind die neuen Energie-
                                            %stützstellen              
                                                                 
%-------------------------------------------------------------------------
array_size = size(original);
vector_length=max(array_size);

%-------------------------------------------------------------------------

% Zeit in Energie umrechnen, bei negativen Flugzeiten wird die Energie auf
% -100 gestzt um die Werte später auszusortierenC
for k=1:max(vector_length)
    t_echt = t_ns(k)+t0;
    if t_echt>0
        energie(k) = (C/(t_echt))^(2)-U;          
    else 
        energie(k)=-100;
    end
end

% Korrigierte Signalhöhen ausrechnen.
   corr = [];

   
       for m = 1:vector_length
      
               corr(m) = original(m)*(C/((energie(m)+U)^1.5))/2;
        
       end
   

% Werte mit negativen Flugzeiten oder mit Energien kleiner als Uret
   % aussortieren, alle anderen Werte in corr_red schreiben
  
   corr_red = corr;
   energie_red = energie;

   for n = 1:vector_length
       if (energie(vector_length+1-n)<0)
         corr_red(vector_length+1-n,:)=[];
         energie_red(vector_length+1-n) = [];
       end
   end

%Energiewerte mit gleichmäßigem Abstand wählen und die Signalwerte
   %interpolieren
 
  
       y = corr_red;
      corr_red_interp = interp1(energie_red,y,energie_interpol,'linear');
       

    
%Daten über Energie und Delay plotten
   figure(2)
  
   plot(energie_interpol,corr_red_interp)
   ylabel('Electron Signal [arb. u.]','FontSize',12)
   xlabel('Kinetic Energy [eV]','FontSize',12)
  %saveas(gcf, 'test', 'pdf')
   %pdff= [files(k).name '.pdf']
%print(pdff)
  grid(gca,'minor')
  % set(gca,'XTick',Energien)
   
energie_final = energie_interpol;
Intensitaet = corr_red_interp;
end