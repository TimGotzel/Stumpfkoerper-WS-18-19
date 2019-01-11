function [Cw] = wake_n(pressure)

%%separate pressures
total_pressure = pressure(1:22);
static_pressure = pressure(28:32);

%%positions as designed
position_pitot = 0:9:9*21;
position_prandtl = [0:40:160]+14.5;

% fit total pressure
%data = total_pressure;
%pos = position_pitot;
%[~,id] = min(data);
%middle = pos(id);
%beta = [0.001, -0.001, min(data),max(data), -middle];
%formula1 = @(beta,x) (1+beta(1).*(x+beta(5)).^2).*exp(beta(2).*(x+beta(5)).^2) * (beta(3) - beta(4)) + beta(4);
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
%data = static_pressure;
%pos = position_prandtl;
%beta = [min(data),max(data),beta1(5)];
%formula2 = @(beta,x) (1+beta1(1).*(x+beta(3)).^2).*exp(beta1(2).*(x+beta(3)).^2) * (beta(1) - beta(2)) + beta(2);

data = static_pressure;
pos = position_prandtl;
beta = [min(data),max(data),beta1(5)];
formula2 = @(beta,x) (1+beta1(1).*(x+beta(3)).^2) .* exp(beta1(2).*(x+beta(3)).^2) * (beta(1) - beta(2)) + beta(2);
[beta2,R2,~,~,~,~] = nlinfit(pos,data,formula2,beta);

disp(beta1)
disp(beta2)

%%Calculate Cd
    %%dyn_pressure_fs entspricht q_infty
dyn_pressure_fs= beta1(4) - beta2(2);
    %%static_pressure_fs entspricht p_infty
static_pressure_fs = beta2(2);
ref_length = 0.0534;
    
    %%siehe Formel 4.10 im Bericht
fun = @(x) (2 * sqrt((formula1(beta1,(x-beta1(5))) - formula2(beta2,(x-beta2(3)))) / dyn_pressure_fs) .* (1- sqrt((formula1(beta1,(x-beta1(5))) - static_pressure_fs) / dyn_pressure_fs)));
Cw = integral(fun,-max(position_prandtl),max(position_prandtl))/1000/ref_length


end