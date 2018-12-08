function [trainset,testset] = loaddataset(gooddataset,trainsetsize)
%LOADDATASET Summary of this function goes here
%   Detailed explanation goes here

N = 1000*trainsetsize; 
trainset = repmat(struct('points',[],'class',-1), N, 1);
testset = repmat(struct('points',[],'class',-1), 1000-N, 1);

shuffle = @(v)v(randperm(numel(v)));

ntrainset = 1;
ntestset = 1;
for d=0:9
   n = 0;
   for s=shuffle(find([gooddataset.class] == d))
        n=n+1;
        if n<=size(find([gooddataset.class] == d),2)*trainsetsize
            trainset(ntrainset).points = gooddataset(s).points;
            trainset(ntrainset).class = d;
            ntrainset = ntrainset + 1;
        else 
            testset(ntestset).points = gooddataset(s).points;
            testset(ntestset).class = d;
            ntestset = ntestset + 1;
        end
   end
end

trainset(ntrainset:end) = [];
testset(ntestset:end) = [];
end

