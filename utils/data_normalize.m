function y = data_normalize (data, method)
% y = data_normalize (data, method)
% function that normalize data according to given method
% data is a 2D matrix, 1 column = 1 sample
% method is a string that is either 'minmax', 'meanvar', or 'softmax'
% return y a matrix of normalized data, 0 if error

a = data(1,:);
b = data(2,:);

if (strcmp(method, 'minmax') == true)
    %min-max normalization
    Xminmax(1,:) = (a-min(a))/(max(a)-min(a)) ;
    Xminmax(2,:) = (b-min(b))/(max(b)-min(b)) ;
    y = Xminmax ;
    
elseif (strcmp(method, 'meanvar') == true || strcmp(method, 'softmax') == true)
    %mean-variance normalization
    Xmeanvar(1,:) = (a-mean(a))/std(a);
    Xmeanvar(2,:) = (b-mean(b))/std(b);
    
    if (strcmp(method, 'softmax') == true)
        %softmax-scaling
        Xsoftmax = 1./(1+exp(-Xmeanvar));
        y = Xsoftmax ;
    else
        y = Xmeanvar ;
    end
else
    y = 0 ;
end

end