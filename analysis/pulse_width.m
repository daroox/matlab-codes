
% calc the pulse width
% date 16 10 2017

p1str = 0.8175; % peak 1 streaked eV

p1xuv = 0.8485; % peak 1 unstreaked

p2str = 1.52;
p2xuv = 0.6727;

s = 0.00526^2; % streak speed eV/fs

aleph1  = p1str^2 - p1xuv^2;
aleph2  = p2str^2 - p2xuv^2;

tau1 = sqrt(aleph1/s)
tau2 = sqrt(aleph2/s)
