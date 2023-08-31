function [ydot] = model_ODE(t,y,alpha,beta,delta,gamma)

%% states
T = y(1);  I = y(2); 

%% equations
ydot=zeros(2,1);
ydot(1) = alpha*T - beta*T*I;
ydot(2) = delta*T*I - gamma*I;


end