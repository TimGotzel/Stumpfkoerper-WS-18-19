n = [0 500 1000 1500 1800 1900 2000 2100 2200 2300 2400 2500];

%%Für Leistungskoeffizient Jet

x1 = C_Power_0kPa_RK;
x2 = C_Power_0kPa;
for k=1:12
Delta_Cw_RK(k) = CwWerteRK(k)/CwWerteRK(1);
Delta_Cw(k) = CwWerte(k)/CwWerte(1);
end
y = Delta_Cw_RK([1:12]);
y_2 = Delta_Cw([1:12]);
figure()
plot(x1,y, '-', x2, y_2, '-')

%'Color',[1.00,0.41,0.16],'MarkerSize',6,

%title(['Cw:_',num2str(
ylabel('\Delta C_{W} [-]')
xlabel('C_{Power,M} [-]')
%set(gca,'box','on')
%legend('p_t Daten', 'p Daten', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')

%%Für Leistungskoeffizient M
% x1 = C_Power_0kPa_RK;
% x2 = C_Power_0kPa;
% for k=1:12
% Delta_Cw_RK(k) = CwWerteRK(k)/CwWerteRK(1);
% Delta_Cw(k) = CwWerte(k)/CwWerte(1);
% end
% y = Delta_Cw_RK([1:12]);
% y_2 = Delta_Cw([1:12]);
% figure()
% plot(x1,y, '-', x2, y_2, '-')
% 
% %'Color',[1.00,0.41,0.16],'MarkerSize',6,
% 
% %title(['Cw:_',num2str(
% ylabel('\Delta C_{W} [-]')
% xlabel('C_{Power,M} [-]')
% %set(gca,'box','on')
% %legend('p_t Daten', 'p Daten', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')