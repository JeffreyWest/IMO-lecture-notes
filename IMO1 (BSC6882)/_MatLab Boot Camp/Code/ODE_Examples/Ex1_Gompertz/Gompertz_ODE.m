function dTdt = Gompertz_ODE(t,y,a,K)
%Gompertz growth model (https://en.wikipedia.org/wiki/Gompertz_function)

%---------------------------------States-----------------------------------
T = y(1);

%----------------------------State Equations-------------------------------
dTdt = a*log(K/T)*T;

end