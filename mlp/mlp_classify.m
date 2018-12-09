function class = mlp_classify(data,weightsname)
%MLP_CLASSIFY Classify the input data
%   class = mlp_classify(data,weightsname) Runs classification of data with NN and returns recognized class. 
%   data - preprocessed data
%   weightsname - path to weights for NN
%   class - recognized class
load(weightsname);

N=size(data,2);
extendedInput=[data;ones(1,N)];

vHidden=wHidden'*extendedInput;
yHidden = zeros(size(vHidden,1)+1,size(vHidden,2));
yHidden(1:size(vHidden,1),:)=tanh(vHidden);
yHidden(end,:)=ones(1,N);
vOutput=wOutput'*yHidden;
yOutput=softmax(vOutput);

[tmp,class]=max(yOutput,[],1);
end

