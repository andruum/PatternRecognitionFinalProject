function mlp_train(traindata, trainclass, maxEpochs,weightsname,draw_convergence)
%MLP_TRAIN Train NN
%   mlp_train(traindata, trainclass, maxEpochs,weightsname,draw_convergence) Trains the NN with given data and saves weights of the NN.
%   traindata - vector of preprocessed data.
%   trainclass - vector of classes for traindata
%   maxEpochs - count of epochs
%   weightsname - path, where function will save weights for NN
%   draw_convergence - 0/1 boolean value. If it equals 1, function draws
%   plot of convergence for training process.
rng('default')

N=size(traindata,2);
d=size(traindata,1);
classes=10;

if ~exist('maxEpochs', 'var')
  maxEpochs=100000;
end

J=zeros(1,maxEpochs);

rho=0.001;

hidden=10; % number of hidden layer neurons

trainOutput=zeros(classes,N);
for i=1:N
  trainOutput(trainclass(i)+1,i)=1;
end

extendedInput=[traindata;ones(1,N)];

wHidden=(rand(d+1,hidden)-0.5)/10;

wOutput=(rand(hidden+1,classes)-0.5)/10;

if draw_convergence == 1
    fh1 = figure;
end
t=0;
while 1
  t=t+1;
  
  vHidden=wHidden'*extendedInput;
  yHidden = zeros(size(vHidden,1)+1,size(vHidden,2));
  yHidden(1:size(vHidden,1),:)=tanh(vHidden);
  yHidden(end,:)=ones(1,N);
  vOutput=wOutput'*yHidden;
  yOutput=softmax(vOutput);
  
  J(t)=0.5*sum(sum((yOutput-trainOutput).^2));
  
  if (mod(t,1000)==0 && draw_convergence == 1) % Plot convergence, but not for every epoch
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