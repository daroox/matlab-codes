

omgh = 1: 100;

n = size(omgh,2);

%length = size(omgh,2);
PP =[];
for k = 1:n
    gg(n-k+1) = omgh(k);
    
end
PP=[gg' omgh']
