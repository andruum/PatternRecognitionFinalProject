function Y = hist_train(nb_bins, nb_train_samples)
% computes the mean of all histograms along coordinates x and y, for each digit
% parameter nb_bins number of bins of the histograms
% parameter nb_train_samples, number of training samples to take from
% dataset (in order)
% return Y, 3D matrix of mean histograms along x and y, for each digit
% 1st line = x histogram, second line = y histogram

path_folder = 'C:\Users\pauline\Desktop\LUT - Pattern Recognition\Practical assignement - digits_3D\training_data';
% path_folder = "./training_data";

Y = zeros(2, nb_bins, 10);

for digit = 1:10
    bincount_x = zeros(1, nb_bins) ;
    bincount_y = zeros(1, nb_bins) ;
    
    for s = 1:nb_train_samples
        
        %Load sample
        points = loadsample(path_folder,digit-1,s);
        % preprocessing
        points(:,3) = [];
        points = points';
        points = data_normalize(points,'minmax');
        
        % histograms of sample
        [bx, ~] = histcounts(points(1, :), nb_bins); 
        [by, ~] = histcounts(points(2, :), nb_bins);
        % normalizing vertically
        bx = (bx-min(bx))/(max(bx)-min(bx)) ;
        by = (by-min(by))/(max(by)-min(by)) ;
        
        % summing histograms
        bincount_x = bincount_x + bx ;
        bincount_y = bincount_y + by ;
    end
        
    % getting the mean histograms of x and y coordinates   
    Y(1, :, digit) = bincount_x ./ nb_train_samples ;
    Y(2, :, digit) = bincount_y ./ nb_train_samples ;
end
    
end