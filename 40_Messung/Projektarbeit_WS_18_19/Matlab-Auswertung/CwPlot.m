C_w = [0.861 0.605 0.479 0.402 0.332]; 
C_mu = [0 0.16 0.32 0.48 0.69];

%%plot
x = C_mu;
y = C_w;

figure()
plot(x,y)


ylabel('C_{W} [-]')
xlabel('C_{\mu} [-]')
set(gca,'box','on')
%legend('p_t Daten (Rechen)', 'p Daten(Rechen)', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeast')