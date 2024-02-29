clc;clear;close all ;

alpha = 1; beta = 0.05; delta = 0.02; gamma = 0.5;

% set up initial condition vector:
T0 = 10; E0 = 10;
IC = [T0 E0];

tspan = 0:0.01:20;

[t,y] = ode45(@(t,y) model_ODE(t,y,alpha,beta,delta,gamma),tspan,IC);


% (check for time span error)

figure(1); hold on
plot(t,y(:,1),'linewidth',2)
plot(t,y(:,2),'linewidth',2)
xlabel('time');
ylabel('T(t), I(t)')
set(gca,'fontsize',20)
legend('Tumor','Immune')