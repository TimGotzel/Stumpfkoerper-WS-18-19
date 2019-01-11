n = [0 500 1000 1500 2000 2500];
x = n;
y = CwWerte([1:4,7,12]);
figure()
plot(x,y)

%title(['Cw:_',num2str(
ylabel('C_{W} [-]')
xlabel('n [min^{-1}]')
%set(gca,'box','on')
%legend('p_t Daten', 'p Daten', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')