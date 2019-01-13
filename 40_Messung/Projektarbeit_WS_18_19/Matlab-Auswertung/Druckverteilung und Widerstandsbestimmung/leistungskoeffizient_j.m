function [C_Power_J] = leistungskoeffizient_j(volstr)
A_ref = 0.0534 * 0.39;
U_inf=14.94;
rho= 1.169;
A_jet = 0.384*0.0003;
C_Power_J = ((0.5*rho*(volstr/3600)*(((volstr/3600)/A_jet)^2))/(0.5*rho*U_inf*U_inf*U_inf*A_ref));
end