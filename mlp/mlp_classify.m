function testclass = mlp_classify(testdata,weightsname)
%MLP_CLASSIFY Summary of this function goes here
%   Detailed explanation goes here
load(weightsname);

N=size(testdata,2);
extendedInput=[testdata;ones(1,N)];

vHidden=wHidden'*extendedInput;
yHidden = zeros(size(vHidden,1)+1,size(vHidden,2));
yHidden(1:size(vHidden,1),:)=sigmf(vHidden,[1 0]);
yHidden(end,:)=ones(1,N);
vOutput=wOutput'*yHidden;
yOutput=softmax(vOutput);

[tmp,testclass]=max(yOutput,[],1);
end

