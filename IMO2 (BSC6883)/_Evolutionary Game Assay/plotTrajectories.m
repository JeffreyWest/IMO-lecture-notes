function [] = plotTrajectories(foldername,ti,Nf,Nr,name)
    for fi=1:1:Nf        
        % across all replicates:
        plotTrajectory(foldername,ti,fi,Nr);
        figure(fi);
        subplot(211);
%         set(gca,'YScale','log');
        ylim([1,4e4]);
        printPNG(figure(fi),strcat(foldername,'plots/',name,'-', num2str(fi),'.png'));
    end    
end


function [gS,gR] = plotTrajectory(foldername,ti,fi,Nr)
    green0 = [0,133,66]/255; red0 = [214, 45, 36]/255; green=green0;red=red0;
    
    
    %% get fitness for all replicates:
    [gS,gR,t,S,R,yMax,tFit,sFit,rFit] = getFitness(foldername,ti,fi,Nr);

    figure(fi);
    subplot(211);

    % sensitive
    mplot(t,S,'Color',green); hold on;
    if (~isempty(sFit))
        plot(tFit,sFit,'Color',green,'LineWidth',1); hold on;
    end

    % resistance
    
    mplot(t,R,'Color',red); hold on;
    if (~isempty(rFit))
        plot(tFit,rFit,'Color',red,'LineWidth',1); hold on;
    end
    
    ylim([0,yMax*1.05]);
    clean();
    xlabel('time');ylabel('cells');

    subplot(212);
    x=[mean(S(1,:)),mean(R(1,:))];
    x=x./sum(x);
    h=pie(x);
    
    if (min(x)>0)
        h(1).FaceColor = green;
        h(3).FaceColor = red;
    else
        if (fi==1)
            h(1).FaceColor = green;
            h(3).FaceColor = green;
        else
            h(1).FaceColor = red;
            h(3).FaceColor = red;
        end
    end
    clean();        
end




