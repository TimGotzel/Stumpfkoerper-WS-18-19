function [C_Power_M] = leistungskoeffizient_m(P_M)
A_ref = 0.0534 * 0.39;
U_inf=14.94;
rho= 1.169;
C_Power_M = (P_M/(0.5*rho*U_inf*U_inf*U_inf*A_ref));
end