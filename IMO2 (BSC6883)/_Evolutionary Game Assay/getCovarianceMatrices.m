function [p,q,COVS,COVR] = getCovarianceMatrices(foldername,ti,Nf,Nr,fraction)
    % Nr trials, Nf fractions
    fitnessS = zeros(Nr,Nf);
    fitnessR = zeros(Nr,Nf); 
    
    for fi=1:Nf
        % gS & gR are dim: [1,Nr]
        [gS,gR,~,~,~,~,~,~,~] = getFitness(foldername,ti,fi,Nr);
        fitnessS(:,fi) = gS';
        fitnessR(:,fi) = gR';
    end

    %% plot best fit of fitness:
    [a,b,c,d,fFit,sFit,rFit,point_x,point_y,rav,rbv,gav,gbv,COVS,COVR,p,q] = getGame(fraction(1:end-1),fraction(2:end),fitnessS(:,1:end-1),fitnessR(:,2:end)); 


end