%% Parametes
addpath("./utils");
addpath("./mlp");
weights_name = "./weights/weights.mat";
%% Preprocess
classes = zeros(size(trainset,1),1);

imgs = zeros(20*15*2,size(trainset,1));
for i=1:size(trainset,1)
    classes(i) = trainset(i).class;
    img = preprocess(trainset(i).points);
    imgs(:,i) = img;
end
%% train mlp

mlp_train(imgs,classes,1000,weights_name,0);

