folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation';

n = [0 500 1000 1500 1800 1900 2000 2100 2200 2300 2400 2500];
Cmu = [0 0.16 0.32 0.48 0.69];
Cw = zeros(5,12);

list_2 = dir(folder);
for j = 1 :length(list_2) - 2
    if list_2(j+2).isdir
        data = importdata_spreadsheet_new([folder, '\', list_2(j+2).name,'\','Cw_Werte.xls']);
        for i=1:12
        Cw(j,i) = data(i);
        end
    end
end

x = n;
y1 = Cw(1,1:12);
y2 = Cw(2,1:12);
y3 = Cw(3,1:12);
y4 = Cw(4,1:12);
y5 = Cw(5,1:12);

ylabel ('C_{W} [-]');
xlabel ('n [-]');

figure()
plot(x,y1,x,y2,x,y3,x,y4,x,y5);
yyaxis left;
ylabel ('C_{W} [-]');
xlabel ('n [-]');

hold on
y6 = y1(1);
yyaxis right;
plot (x(1),y6*100)




%yyaxis left



% %%Für Leistungskoeffizient Jet
% 
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