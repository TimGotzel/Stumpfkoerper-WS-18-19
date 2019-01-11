function [Cw] = wake_n(pressure)
%%Creates and plots pressure distribtutions (fitting) and calculates Cw
%%separate pressures
total_pressure = pressure(1:22);
static_pressure = pressure(28:32);

%%positions as designed
position_pitot = 0:9:9*21;
position_prandtl = [0:40:160]+14.5;

% fit total pressure
data = [total_pressure(22), total_pressure];
pos = [position_pitot(22) + 100, position_pitot];
[~,id] = min(data);
middle = pos(id);

% original
beta = [0.001,-0.001,min(data),max(data),-middle];
formula1 = @(beta,x) (1+beta(1).*(x+beta(5)).^2) .* exp(beta(2).*(x+beta(5)).^2) * (beta(3) - beta(4)) + beta(4);

[beta1,R1,~,~,~,~] = nlinfit(pos,data,formula1,beta);

%%Fit static pressure
data = static_pressure;
pos = position_prandtl;
beta = [min(data),max(data),beta1(5)];
formula2 = @(beta,x) (1+beta1(1).*(x+beta(3)).^2) .* exp(beta1(2).*(x+beta(3)).^2) * (beta(1) - beta(2)) + beta(2);
[beta2,R2,~,~,~,~] = nlinfit(pos,data,formula2,beta);

disp(beta1)
disp(beta2)

%%Calculate Cw
%%dyn_pressure_fs is q_infty
dyn_pressure_fs= beta1(4) - beta2(2);
%%static_pressure_fs is p_infty
static_pressure_fs = beta2(2);
ref_length = 0.0534;
    
%%formula 4.10 (thesis)
fun = @(x) (2 * sqrt((formula1(beta1,(x-beta1(5))) - formula2(beta2,(x-beta2(3)))) / dyn_pressure_fs) .* (1- sqrt((formula1(beta1,(x-beta1(5))) - static_pressure_fs) / dyn_pressure_fs)));
Cw = integral(fun,-max(position_prandtl),max(position_prandtl))/1000/ref_length

%%plot of pressure distributions
x = linspace (-max(position_prandtl),max(position_prandtl),101);
ref_length = ref_length * 1000;
x_plot = x / ref_length;
position_pitot_plot = (position_pitot + beta1(5))/ref_length;
position_prandtl_plot = (position_prandtl + beta2(3))/ref_length;

figure()
plot(position_pitot_plot,total_pressure, 'x',position_prandtl_plot,static_pressure,'x',x_plot,formula1(beta1,(x-beta1(5))),x_plot,formula2(beta2,(x-beta2(3))))

ylabel('\Delta p [Pa]')
xlabel('y/d [-]')
set(gca,'box','on')
legend('p_t Daten', 'p Daten', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')

end