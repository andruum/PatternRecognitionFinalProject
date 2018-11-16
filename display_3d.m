function display_3d(data)
% displays data in 3D (1 sample = 1 column) 
figure('Position', [10 50 700 700]);
x = data(1,:) ;
y = data(2,:) ;
z = data(3,:) ;
scatter3(x, y, z, 'k.')
xlabel('x') ; ylabel('y') ; zlabel('z') ;
end

