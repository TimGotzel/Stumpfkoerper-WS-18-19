%%Preallocate von den benötigten Matrizen
P_M = zeros(5,12);
PR = zeros(5,12);
PR_z = zeros(5,12);
PR_n = zeros(5,12);

%%Konstanten
Cw_bez = 0.804692213249081;
A_ref = 0.39*0.0534;
A_jet = 0.384*0.0003;
U_inf = 14.94;
rho = 1.17;
h_spalt_o = 0.00019;
b = 0.384;
A_jet = 0.384*h_spalt_o;
p_Plenum = [0 1000 2000 3000 4000];

folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Walzenpaar 50\Aktuation';

list_2 = dir(folder);
for j = 1 :length(list_2) - 2
    if list_2(j+2).isdir
        data2 = importdata_spreadsheet_new([folder, '\', list_2(j+2).name, '\','P_M.xlsx']);
        for i=1:12
        P_M(j,i) = data2(i);
        PR_z(j,i) = ((Cw_bez - Cw50(j,i))*0.5*rho*U_inf*U_inf*U_inf * A_ref);
        PR_n(j,i) = ((rho*((sqrt((2*p_Plenum(j))/rho))^3)*h_spalt_o*b) + P_M(j,i));
        PR(j,i) = (PR_z(j,i)/PR_n(j,i));
        end
     end
end



 x = n;
 x3 = n (2:12);
 
 y1 = PR(1,1:12);
 y2 = PR(2,1:12);
 y3 = PR(3,2:12);
 y4 = PR(4,1:12);
 y5 = PR(5,1:12);
 y6(1:12) =1;



figure()
plot(x,y1,x,y2,x3,y3,x,y4,x,y5,x,y6,'--');

ylabel ('PR [-]');
xlabel ('n [-]');