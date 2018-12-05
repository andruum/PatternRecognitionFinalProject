function s = similar_hist (hist1, hist2, threshold)
% return 1 if hist1 and hist2 are similar
% ie. distance between all counts is smaller than threshold

N = size(hist1, 2) ;
s = 0 ;

for i = 1:N
    if (abs(hist1(i) - hist2(i)) <= threshold)
        s = s + 1 ;
    end
end

if (s ~= 0)
    s = 1 ;
end

end