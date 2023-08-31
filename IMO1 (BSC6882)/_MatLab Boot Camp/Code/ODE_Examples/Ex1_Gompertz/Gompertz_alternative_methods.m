close all %close all figures
clear all %clear all variables
clc       %clear command window

[pars,IC] = Gompertz_pars; %pars contains parameters and IC contains initial 
                      %conditions

tspan = [0 20];

%Three ways to solve ODE
% a = 0.2; K = 500;
% [t,y] = ode45(@(t,T) a*log(K/T)*T, tspan, IC);

[t,y] = ode45(@(t,y) Gompertz_ODE(t,y,pars), tspan, IC);

% [t,y] = ode45(@Gompertz_ODE,tspan,IC,[],pars); %[] for additional options 
                                               %(relative & absolute 
                                               %tolerances)
figure(1); hold on
plot(t,y,'linewidth',6)
xlabel('Days')
ylabel('Tumor Volume')
title('Gompertz')
% set(gca,'fontsize',30)
grid on