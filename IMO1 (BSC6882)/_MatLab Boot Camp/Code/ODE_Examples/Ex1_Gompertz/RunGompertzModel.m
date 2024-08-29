close all %close all figures
clear all %clear all variables
clc       %clear command window

% model parameters:
a = 0.2; K = 1000;
tspan = [0 20];

% Use ODE45 to solve the ordinary differential equation:
IC = 600;

[t,T] = ode45(@(t,T) Gompertz_ODE(t,T,a,K), tspan, IC);


figure(1);
plot(t,T,'linewidth',6);
xlabel('Days');
ylabel('Tumor Volume');
title('Gompertz');
set(gca,'fontsize',20)
grid on