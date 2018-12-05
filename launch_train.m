% Sample parametes
clear all;
addpath("./utils");
path_folder = "./training_data";
nb_train_samples = 70 ;


%% train mlp
weights_name = "weights.mat" ;
classes = [];
imgs = [];
for d=0:9
   for s=1:nb_train_samples
        pnts = loadsample(path_folder,d,s);
        pnts(:,3) = [];
        pnts=pnts';
        classes = [classes d];
        pnts = data_normalize(pnts,'minmax');
        pnts = removegaps(pnts);
        img = coord2img(pnts);
        imgs = cat(3,imgs,img);
   end
end

mlp_train(imgs,classes,20000,weights_name);

