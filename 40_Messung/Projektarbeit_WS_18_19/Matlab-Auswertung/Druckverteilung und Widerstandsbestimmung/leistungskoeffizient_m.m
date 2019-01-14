function [C_Power_M] = leistungskoeffizient_m(P_M)
A_ref = 0.0534 * 0.39;
U_inf=14.94;
rho= 1.169;
C_Power_M = (P_M/(0.5*rho*U_inf*U_inf*U_inf*A_ref));
end

folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Walzenpaar 50\Aktuation';
list_2 = dir(folder);
for j = 1 :length(list_2) - 2
if list_2(j+2).isdir
temp = [folder, '\', list_2(j+2).name,'\','P_M.xlsx'];
P_M(j) = temp;
C_Power_M50(j) = leistungskoeffizient_m(P_M(j));
end
end