
clc
for k = 1:261 % adapt the length!!!!
    
    if y2(k) < 14
        y2(k) = (y2(k+1)+ y2(k-1))/2;
    end
     if y2(k) > 18.2
        y2(k) = (y2(k+1)+ y2(k-1))/2;
    end
end
for k = 1:260
    if y2(k) - y2(k+1) > 0.2
         y2(k+1) = (y2(k+1) + y2(k-1))/2;
     end
%      if y2(k+1) - y2(1) < 0.5
%           y2(k) = (y2(k+1) + y2(k-1))/2;
%      end
end

plot(x2,y2,'rx',x2,peak2(:,2),'o')
