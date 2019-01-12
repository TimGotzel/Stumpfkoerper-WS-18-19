%n = [0 500 1000 1500 2000 2500];
C_mu = [0 0.16 0.32 0.48 0.69];
C_w = [0.8761 0.6061 0.4766 0.399 0.3311];
C_mu50 = [0 0.0639 0.2704 0.4162 0.5823];
C_w50 = [0.804 0.61 0.577 0.455];

x1 = C_mu;
y1 = C_w;
x2= C_mu50([1:2,4:5]);
y2= C_w50;
figure()
plot(x1,y1,'-x',x2,y2,'-o')

%title(['Cw:_',num2str(
ylabel('C_{W} [-]')
xlabel('C_{\mu} [-]')
%set(gca,'box','on')
%legend('p_t Daten', 'p Daten', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')