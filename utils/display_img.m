function display_img(img)
% displays data in 3D (1 sample = 1 column) 
figure('Position', [10 50 500 500]);
hold on
[rows,cols,depth] = size(img);
for i=1:rows
    for j=1:cols
        if img(i,j,2)~=0
            scatter(j,i,12,'b','filled')
        end
    end
end
hold off
xlabel('x') ; ylabel('y') ;
end