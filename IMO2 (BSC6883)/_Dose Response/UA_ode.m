function [ydot] = UA_ode(t,y,dose,b1,b2,kon,koff)
    cU = y(1);
    cA = y(2);

    ydot(1,1) = (b1 - kon*(dose))*cU + (koff*cA); %(unaffected)
    ydot(2,1) = (b2 - koff)*cA + (kon*(dose)*cU); %(affected)
end