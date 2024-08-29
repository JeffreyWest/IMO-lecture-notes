function [dYdt] = PredatorPrey_ODE(t,y,alpha,beta,delta,gamma)

%% states
T = y(1);  
I = y(2); 

%% equations
dYdt=zeros(2,1);
dYdt(1) = alpha*T - beta*T*I;
dYdt(2) = delta*T*I - gamma*I;


end