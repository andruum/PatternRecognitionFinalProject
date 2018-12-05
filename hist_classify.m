function hist_class = hist_classify(points, nb_bins, threshold, training_hist)
% classify the sample 'points'
% parameter nb_bins, number of intervals of the histogram
% return integer = value of recognized digit
% if confusion, returns all confusion digits

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
% compare to all histograms
class = zeros(10, 1);
for digit=0:9
    hist_digit = training_hist(:, :, digit+1) ; % mean histogram for digit from training
    if (similar_hist(hist_digit(1,:), bx, threshold) == 1)
        class(digit+1) = class(digit+1) + 1 ;
    end
    if (similar_hist(hist_digit(2, :), by, threshold)== 1)
        class(digit+1) = class(digit+1) + 1 ;
    end
end
hist_class = find(class == max(class))-1 ;
end