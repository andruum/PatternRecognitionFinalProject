%% Sample parametes
% execute by section to save time

addpath("C:\Users\pauline\Desktop\LUT - Pattern Recognition\Practical assignement - digits_3D\git_code\utils");
path_folder = "C:\Users\pauline\Desktop\LUT - Pattern Recognition\Practical assignement - digits_3D\training_data";

nb_test_samples = 30 ;

%% test mlp
td_mlp = zeros(10, 1) ; % each cell is the number of true detections for the digit (index-1)
fd_mlp = zeros (10, 1);  % each cell is the number of false detections for the digit (index-1)

for digit = 1:10
    for s = (100 - nb_test_samples + 1):100
        
        %Load sample
        points = loadsample(path_folder,digit-1,s);

        %Launch test
        mlp_class = digit_classify(points) ;
        
        % check results and count errors
        if (mlp_class == digit-1)
            td_mlp(digit) = td_mlp(digit) + 1 ;
        else
            fd_mlp(digit) = fd_mlp(digit) + 1 ;
        end
    end
end

%% test histogram
td_hist = zeros(10, 1) ;
fd_hist = zeros (10, 1);
threshold = 0.0015 ;
nb_bins = 10 ;
nb_train_samples = 100 - nb_test_samples ;
% train - to be moved to separate file ?
Y = hist_train(nb_bins , nb_train_samples) ;

% test
confusion = 0 ;
for digit = 1:10
    for s = (100 - nb_test_samples + 1):100
        %Load sample
        points = loadsample(path_folder,digit-1,s);

        %Launch test
        hist_class = hist_classify(points, nb_bins, threshold, Y) ;
        
        % check results and count errors
        if (size(hist_class, 1) ~= 1)
            disp('Histogram confusion:') ;
            disp(hist_class) ;
            confusion = confusion + 1 ;
        else
            if (hist_class == digit-1)
                td_hist(digit) = td_hist(digit) + 1 ;
            else
                fd_hist(digit) = fd_hist(digit) + 1 ;
            end
        end
    end
end


%% display the results
close all ;
TDR_mlp = td_mlp./nb_test_samples*100 ;
FDR_mlp = fd_mlp./nb_test_samples*100 ;
TDR_hist = td_hist./nb_test_samples*100 ;
FDR_hist = fd_hist./nb_test_samples*100 ;
figure('Name', 'Test results for MLP');
display_results(TDR_mlp, FDR_mlp);
figure('Name', 'Tests results for histogram');
display_results(TDR_hist, FDR_hist);