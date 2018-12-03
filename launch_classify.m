%% Sample parametes
addpath("C:\Users\pauline\Desktop\LUT - Pattern Recognition\Practical assignement - digits_3D\code\utils");
path_folder = "C:\Users\pauline\Desktop\LUT - Pattern Recognition\Practical assignement - digits_3D\training_data";

true_detection = zeros(10, 1) ; % each cell is the number of true detections for the digit (index-1)
false_detection = zeros (10, 1);  % each cell is the number of false detections for the digit (index-1)

for digit = 1:10
    for s = 71:100
        
        %Load sample
        points = loadsample(path_folder,digit-1,s);

        %Launch test
        C = digit_classify(points) ;
        
        % check results and count errors
        if (C == digit-1)
            true_detection(digit) = true_detection(digit) + 1 ;
        else
            false_detection(digit) = false_detection(digit) + 1 ;
        end
    end
end
%%
% display the results

TD_rate = true_detection./30*100 ;
FD_rate = false_detection./30*100 ;
display_results(TD_rate, FD_rate);
