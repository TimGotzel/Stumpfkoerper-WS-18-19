n = [0 500 1000 1500 1800 1900 2000 2100 2200 2300 2400 2500];
x = n;
y = CwWerteRK([1:12]);
y_2 = CwWerte([1:12]);
figure()
plot(x,y,'-x', x, y_2, '-o')

%'Color',[1.00,0.41,0.16],'MarkerSize',6,

%title(['Cw:_',num2str(
ylabel('C_{W} [-]')
xlabel('n [min^{-1}]')
%set(gca,'box','on')
%legend('p_t Daten', 'p Daten', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')