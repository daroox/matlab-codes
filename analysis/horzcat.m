randomData = rand(3,1)
allData = randomData;
for i = 1:2
    dataToAppend = randomData ;
    allData = [allData dataToAppend];
    % allData = cat(2, allData, dataToAppend);
    % allData = horzcat(allData, dataToAppend);
end
