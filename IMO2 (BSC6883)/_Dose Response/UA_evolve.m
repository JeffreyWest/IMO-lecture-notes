function [ydot] = UA_evolve(t,y,dose,b1,b2,ai,a0,kon)
    cU = y(1);
    cA = y(2);
    koff = y(3);

    ydot(1,1) = (b1 - kon*(dose))*cU + (koff*cA); %(unaffected)
    ydot(2,1) = (b2 - koff)*cA + (kon*(dose)*cU); %(affected)
    ydot(3,1) = ai*koff;
    
    % re-sensitization (koff decays) if no drug:
    if (dose == 0)
        ydot(3,1) = a0*koff;
    end
end