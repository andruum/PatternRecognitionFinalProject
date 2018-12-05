function testclass = mlp_classify(testdata,weightsname)
%MLP_CLASSIFY Summary of this function goes here
%   Detailed explanation goes here
load(weightsname);

testdata = testdata(:);

N=size(testdata,2);
extendedInput=[testdata;ones(1,N)];

vHidden=wHidden'*extendedInput;
yHidden=tanh(vHidden);
yHidden=[yHidden;ones(1,N)];
vOutput=wOutput'*yHidden;
yOutput=vOutput;

[tmp,testclass]=max(yOutput,[],1);
end

