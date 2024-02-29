function Tdot = Gompertz_ODE(t,T,a,K)
%Gompertz growth model (https://en.wikipedia.org/wiki/Gompertz_function)

%---------------------------------States-----------------------------------
T = T(1);

%----------------------------State Equations-------------------------------
Tdot = a*log(K/T)*T;

end