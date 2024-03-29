function [trainset,testset] = loaddataset(folderpath,trainsetsize)
%LOADDATASET Load dataset from disk
%   [trainset,testset] = loaddataset(folderpath,trainsetsize)
%   folderpath - path to dataset folder
%   trainsetsize - size of training set (the rest of the set will be the test set)
%   trainset - vector of the training set
%   testset - vector of the test set
%   All sets will be shuffled

N = 1000*trainsetsize;    
trainset = repmat(struct('points',[],'class',-1), N, 1);
testset = repmat(struct('points',[],'class',-1), 1000-N, 1);

% Shuffle function
shuffle = @(v)v(randperm(numel(v)));

ntrainset = 1;
ntestset = 1;
for d=0:9
   n = 0;
   for s=shuffle(1:100)
        n=n+1;
        pnts = loadsample(folderpath,d,s);
        if n<=100*trainsetsize
            trainset(ntrainset).points = pnts;
            trainset(ntrainset).class = d;
            ntrainset = ntrainset + 1;
        else 
            testset(ntestset).points = pnts;
            testset(ntestset).class = d;
            ntestset = ntestset + 1;
        end
   end
end

end

