function [C_Power_J] = leistungskoeffizient_j50(p_Plenum)
A_ref = 0.0534 * 0.39;
U_inf=14.94;
rho= 1.169;
h_spalt_o = 0.00019;
b = 0.384;
A_jet = 0.384*h_spalt_o;
C_Power_J = ((rho*((sqrt((2*p_Plenum)/rho))^3)*h_spalt_o*b)/(0.5*rho*U_inf*U_inf*U_inf*A_ref));
end