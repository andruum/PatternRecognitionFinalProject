function display_results(TD_rate, FD_rate)
% display the results on a graph
% parameter TD_rate true detection rate
% parameter TD_rate false detection rate

close all ;
figure('Name', 'True detection against false detection');
labels = {'0','1','2','3','4','5','6','7','8','9'};
plot(FD_rate,TD_rate,'x');
text(FD_rate,TD_rate,labels,'VerticalAlignment','bottom','HorizontalAlignment','right');
hold on ;
plot(0, 100, 'g*'); hold on;
plot(100, 0, 'r*'); hold on;
plot(50, 50, 'm*'); hold on;
axis([-10 110 -10 110]);
legend('results', 'best case', 'worst case', 'limit');

end