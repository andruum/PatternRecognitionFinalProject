function display_2d(data)
% displays data in 3D (1 sample = 1 column) 
figure('Position', [10 50 500 500]);
x = data(1,:);
y = data(2,:);
scatter(x,y)
xlabel('x') ; ylabel('y') ;
end