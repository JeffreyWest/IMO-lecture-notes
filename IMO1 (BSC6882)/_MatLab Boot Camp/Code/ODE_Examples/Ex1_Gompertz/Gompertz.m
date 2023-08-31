close all %close all figures
clear all %clear all variables
clc       %clear command window

% model parameters:
a = 0.2; K = 1000;
tspan = [0 20];

% Use ODE45 to solve the ordinary differential equation:

[t,y] = ode45(@(t,y) Gompertz_ODE(t,y,a,K), tspan, IC);

% [t,y] = ode45(@Gompertz_ODE,tspan,IC,[],pars); %[] for additional options 
                                               %(relative & absolute 
                                               %tolerances)
figure(1);
plot(t,y,'linewidth',6);
xlabel('Days');
ylabel('Tumor Volume');
title('Gompertz');
set(gca,'fontsize',20)
grid on