%% 
clc;clear;close all;
purple=[0.4392,0.1882,0.6275];green=[0,0.5216,0.2588];



figure(1);clf;

%% even-high-dose
subplot(4,1,1);
load('data/even-high-dose.mat');
plot(t,v,'.','MarkerSize',30,'Color',purple); hold on;
simulateAndPlotSingleDosingSchedule(t,v,d,purple);

%% uneven-high-dose
subplot(4,1,2);
load('data/uneven-high-dose.mat');
plot(t,v,'.','MarkerSize',30,'Color',green); hold on;
simulateAndPlotSingleDosingSchedule(t,v,d,green);

%% even-low-dose
subplot(4,1,3);
load('data/even-low-dose.mat');
plot(t,v,'.','MarkerSize',30,'Color',purple); hold on;
simulateAndPlotSingleDosingSchedule(t,v,d,purple);

%% uneven-low-dose
subplot(4,1,4);
load('data/uneven-low-dose.mat');
plot(t,v,'.','MarkerSize',30,'Color',green); hold on;
simulateAndPlotSingleDosingSchedule(t,v,d,green);


clean(); xlabel('time (weeks)');

function [time,total_volume] = simulateAndPlotSingleDosingSchedule(t,v,d,color)
    
    % load dose response information:
    load("save/Hill_parameters.mat");
    b1 = Hill_parameters(1);
    b2 = Hill_parameters(2);
    koff_kon = Hill_parameters(3);
    koff = 5;   % set koff \approx 5
    kon = koff/koff_kon; 

    % initial condition:
    v0 = [1,0]; % U, A or C1, C2

    % tracking vectors etc:
    tspan = [0 1]; % 1 week intervals
    time=[0];
    volume=[v0];

    % loop over every week
    for i = 1:1:length(d)
        dose = d(i);
        [tp,y] = ode45(@(t,y) UA_ode(t,y,dose,b1,b2,kon,koff),tspan,v0);
        
        v0 = y(end,:); 
        tspan = [tp(end),tp(end)+1];

        time=[time;tp(end)]; 
        volume = [volume;v0];        
    end

    total_volume = volume(:,1)+volume(:,2);

    plot(time,total_volume,':','LineWidth',3,'Color',color); hold on;
    ylabel('vol.');

end

