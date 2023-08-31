clc;clear;close all;
colors = [0,0,0; 0.2,0.5,0.7; 0.8,0.2,0.1]; % black, blue, red


foldername = 'Example/';
Nr = 3; %# of replicates
fraction = [0,10,25,50,75,90,100]/100; % fraction of resistant cells at time 0
Nf=length(fraction);  %# of resistant fractions

exps = {'Untreated','Immunotherapy','Radiation'};
ti=1;
%% create one csv file for each treatment condition:
for ti=1:3
    experiment = exps{ti}
    close all;
    %plotTrajectories(foldername,ti,Nf,Nr,experiment);
end

close all;

%% set up state-space figure:
del=0.01; figure(100); 
addGridAndArrows(del);

for ti = 1:1:3
    % plot fitness, as a functin of %R
    figure(ti);
    [a,b,c,d,point_x,point_y]=plotFitness(foldername,ti,Nf,Nr,fraction);
    ylim([0.015, 0.035]);
    
    % save the file:
    printPNG(figure(ti),strcat(foldername,'plots/fitness ',char(exps{ti}),'.png'))

    figure(100);
    addGameMarker(point_x,point_y,colors(ti,:));
end

% save the state space:
printPNG(figure(100),strcat(foldername,'plots/statespace.png'))


function [] = printPNG(figure_handle, filename)    
    set(figure_handle,'Units','Inches');
    pos = get(figure_handle,'Position');
    set(figure_handle,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
    print(figure_handle,filename,'-dpng','-r0');

end


