%%F�r PR �ber
folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation';

%%Feste Werte f�r n und Cmu
n = [0 500 1000 1500 1800 1900 2000 2100 2200 2300 2400 2500];
Cmu = [0 0.16 0.32 0.48 0.69];

%%Preallocate von den ben�tigten Matrizen
Cw = zeros(5,12);
P_M = zeros(5,12);
PR = zeros(5,12);
PR_z = zeros(5,12);
PR_n = zeros(5,12);

%%Konstanten
Cw_bez = 0.876161980862324;
A_ref = 0.39*0.0534;
A_jet = 0.384*0.0003;
U_inf = 14.94;
rho = 1.17;
Volstr = [0 16.26 23 28.176 33.78];


list_2 = dir(folder);
for j = 1 :length(list_2) - 2
    if list_2(j+2).isdir
        data = importdata_spreadsheet_new([folder, '\', list_2(j+2).name,'\','Cw_Werte.xls']);
        data2 = importdata_spreadsheet_new([folder, '\', list_2(j+2).name, '\','P_M.xlsx']);
        for i=1:12
        Cw(j,i) = data(i);
        P_M(j,i) = data2(i);
        PR_z(j,i) = ((Cw_bez - Cw(j,i))*0.5*rho*U_inf*U_inf*U_inf * A_ref);
        PR_n(j,i) = (0.5 * rho * (Volstr(j)/3600) *(((Volstr(j)/3600)/A_jet)^2) + P_M(j,i));
        PR(j,i) = (PR_z(j,i)/PR_n(j,i));
        end
     end
end



 x = n;
 y1 = PR(1,1:12);
 y2 = PR(2,1:12);
 y3 = PR(3,1:12);
 y4 = PR(4,1:12);
 y5 = PR(5,1:12);
 y6(1:12) =1;



figure()
plot(x,y1,x,y2,x,y3,x,y4,x,y5,x,y6,'--');

ylabel ('PR [-]');
xlabel ('n [-]');

%%F�r Cw/Cw0 ueber Cmu
% folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation';
% 
% n = [0 500 1000 1500 1800 1900 2000 2100 2200 2300 2400 2500];
% Cmu = [0 0.16 0.32 0.48 0.69];
% Cw = zeros(5,12);
% 
% list_2 = dir(folder);
% for j = 1 :length(list_2) - 2
%     if list_2(j+2).isdir
%         data = importdata_spreadsheet_new([folder, '\', list_2(j+2).name,'\','Cw_Werte.xls']);
%         for i=1:12
%         Cw(j,i) = data(i);
%         end
%      end
% end
% 
% for j=1:5
%     for i=1:12
%     Cw_norm (j,i) = Cw(j,i)/Cw0(j,i);
%     end
% end
% 
% x = n;
% y1 = Cw_norm(1,1:12);
% y2 = Cw_norm(2,1:12);
%  y3 = Cw_norm(3,1:12);
%  y4 = Cw_norm(4,1:12);
%  y5 = Cw_norm(5,1:12);
% %  y1(1:12) = (Cw(1,1:12)/Cw0(1,1:12));
% %  y2(1:12) = (Cw(2,1:12)/Cw0(2,1:12));
% %  y3(1:12) = (Cw(3,1:12)/Cw0(3,1:12));
% %  y4(1:12) = (Cw(4,1:12)/Cw0(4,1:12));
% %  y5(1:12) = (Cw(5,1:12)/Cw0(5,1:12));
% 
% ylabel ('C_{W} [-]');
% xlabel ('n [-]');
% 
% figure()
% plot(x,y1,x,y2,x,y3,x,y4,x,y5);
% %yyaxis left;
% ylabel ('C_{W}/C_{W0} [-]');
% xlabel ('n [-]');

%%F�r Cw ueber Cmu

% folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation';
% 
% n = [0 500 1000 1500 1800 1900 2000 2100 2200 2300 2400 2500];
% Cmu = [0 0.16 0.32 0.48 0.69];
% Cw = zeros(5,12);
% 
% list_2 = dir(folder);
% for j = 1 :length(list_2) - 2
%     if list_2(j+2).isdir
%         data = importdata_spreadsheet_new([folder, '\', list_2(j+2).name,'\','Cw_Werte.xls']);
%         for i=1:12
%         Cw(j,i) = data(i);
%         end
%     end
% end
% 
% x = n;
% y1 = Cw(1,1:12);
% y2 = Cw(2,1:12);
% y3 = Cw(3,1:12);
% y4 = Cw(4,1:12);
% y5 = Cw(5,1:12);
% 
% ylabel ('C_{W} [-]');
% xlabel ('n [-]');
% 
% figure()
% plot(x,y1,x,y2,x,y3,x,y4,x,y5);
% %yyaxis left;
% ylabel ('C_{W} [-]');
% xlabel ('n [-]');
% 
% hold on
% y6 = y1(1);
% 
% 
% 
% 
% 
% %yyaxis left



% %%F�r Leistungskoeffizient Jet
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

%%F�r Leistungskoeffizient M
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