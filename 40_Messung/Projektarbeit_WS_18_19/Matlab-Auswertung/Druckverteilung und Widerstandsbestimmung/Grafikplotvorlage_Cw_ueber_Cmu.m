%n = [0 500 1000 1500 2000 2500];
C_mu = [0 0.16 0.32 0.48 0.69];
C_w = [0.8761 0.6061 0.4766 0.399 0.3311];

x = C_mu;
y = C_w;
figure()
plot(x,y)

%title(['Cw:_',num2str(
ylabel('C_{W} [-]')
xlabel('C_{\mu} [-]')
%set(gca,'box','on')
%legend('p_t Daten', 'p Daten', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')