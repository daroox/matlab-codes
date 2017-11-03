clc
B=0;
for k =1:300
    B = min(CH2(:,k));
    CH2(:,k) = CH2(:,k)+ abs(B);
end
figure(22);plot(CH2(:,150))
