function [meanresult,worsedigit] = mlp_validate(testdataset,weightsname,draw_results)
%MLP_VALIDATE Summary of this function goes here
%   Detailed explanation goes here

td_mlp = zeros(10, 1) ; % each cell is the number of true detections for the digit (index-1)
fd_mlp = zeros (10, 1);  % each cell is the number of false detections for the digit (index-1)

for i=1:size(testdataset)
    sample = testdataset(i);
    C = digit_classify(sample.points);
    if C == sample.class
        td_mlp(sample.class+1) = td_mlp(sample.class+1)+1;
    else 
        fd_mlp(sample.class+1) = fd_mlp(sample.class+1)+1;
    end
end

for i=1:10
    td_mlp(i) = td_mlp(i)/size(find([testdataset.class] == i-1),2);
    fd_mlp(i) = fd_mlp(i)/size(find([testdataset.class] == i-1),2);
end

[t,worsedigit] = min(td_mlp);
meanresult = mean(td_mlp);
worsedigit=worsedigit-1;

if draw_results == 1
    TDR_mlp = td_mlp.*100 ;
    FDR_mlp = fd_mlp.*100 ;
    figure('Name', 'Test results for MLP');
    display_results(TDR_mlp, FDR_mlp);
end

end