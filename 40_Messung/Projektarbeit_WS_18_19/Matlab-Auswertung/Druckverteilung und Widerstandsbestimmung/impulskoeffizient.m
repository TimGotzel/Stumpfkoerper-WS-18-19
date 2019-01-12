function [C_mu] = impulskoeffizient(volumenstrom)

rho = 1.186;
U_inf = 14.9;
A_ref = 0.39*0.0534;
A_jet = 0.384*0.0003;
volstr = volumenstrom/3600;

C_mu = ((2*volstr) * (volstr/A_jet))/(0.5*(U_inf*U_inf)*A_ref);
end
