function [testclass, t, wHidden, wOutput] = ...
  mlp_train(traindata, trainclass, maxEpochs,weightsname)
%MLP_TRAIN Summary of this function goes here
%   Detailed explanation goes here

[rows,cols,depth] = size(traindata);
traindata_tmp = zeros(rows*cols,depth);
for i=1:depth
    layer = traindata(:,:,i);
    traindata_tmp(:,i) = layer(:);
end
traindata = traindata_tmp;

N=size(traindata,2);
d=size(traindata,1);
classes=10;

if ~exist('maxEpochs', 'var')
  maxEpochs=100000;
end

J=zeros(1,maxEpochs);

rho=0.0001;

hidden=100; % number of hidden layer neurons

trainOutput=zeros(classes,N);
for i=1:N,
  trainOutput(trainclass(i)+1,i)=1;
end

extendedInput=[traindata;ones(1,N)];

wHidden=(rand(d+1,hidden)-0.5)/10;

wOutput=(rand(hidden+1,classes)-0.5)/10;

fh1 = figure;
t=0;
while 1
  t=t+1;
  
  vHidden=wHidden'*extendedInput;
  yHidden=tanh(vHidden);
  yHidden=[yHidden;ones(1,N)];
  vOutput=wOutput'*yHidden;
  yOutput=vOutput;
  
  J(t)=0.5*sum(sum((yOutput-trainOutput).^2));
  
  if (mod(t,1000)==0) % Plot convergence, but not for every epoch
    semilogy(1:t,J(1:t));
    title(sprintf('Convergence (epoch %d)', t));
    xlabel('Number of iterations');
    ylabel('SSE');
    drawnow;
  end
  
  if (J(t)<1e-12)
    break;
  end;
  
  if (t>=maxEpochs) 
    break;
  end
  
  if t > 1
      if abs(J(t)-J(t-1)) < 1e-12
       break;
      end
  end
  
  deltaOutput=(yOutput-trainOutput);
  
  deltaHidden=(wOutput(1:end-1,:)*deltaOutput).*(1-yHidden(1:end-1,:).^2);
  
  deltawHidden=-rho*extendedInput*deltaHidden';
  deltawOutput=-rho*yHidden*deltaOutput';
  wOutput=wOutput+deltawOutput;
  wHidden=wHidden+deltawHidden;
end

save(weightsname,'wOutput','wHidden')