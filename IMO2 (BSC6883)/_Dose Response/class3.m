%% fit for values of alpha(x)
clc;clear;close all;
purple=[0.4392,0.1882,0.6275];green=[0,0.5216,0.2588];
colors = [purple;green;purple;green];

% load all data:
load('data/all-data.mat');

%parameters=[alpha0,alpha12,alpha25,alpha50]
lower_bounds = [-1,0,0,0];
upper_bounds = [1,1,1,1];    
guess = [0.1,0.1,0.1,0.1];


% (parameters,time)
[best_fit_parameters, resnorm, RESIDUAL] = lsqcurvefit(@simulateAllFourDosingSchedules,guess,t,v,lower_bounds,upper_bounds,'');
best_fit_parameters

[volume,time] = simulateAllFourDosingSchedules(best_fit_parameters,t);



%% plot the resulting best fit:
figure(1);clf;
for i = 1:1:4
    subplot(4,1,i);
    
    % plot data:
    plot(t,v(i,:),'.','MarkerSize',30,'Color',colors(i,:)); hold on;

    % plot simulation:
    plot(time,volume(i,:),':','LineWidth',3,'Color',colors(i,:)); hold on;

    clean();

end

%% "global" function to simulate all experiments at once,
%  can decide which parameters are global here.
function [volume,t] = simulateAllFourDosingSchedules(parameters,time)
    load('data/all-data.mat');

    %parameters=[alpha0,alpha12,alpha25,alpha50]
    alpha0=parameters(1);
    alpha12=parameters(2);
    alpha25=parameters(3);
    alpha50=parameters(4);


    % even-high-dose
    [t,v1] = simulateSingleDosingSchedule(t,v(1,:),d(1,:),[],alpha25);

    % uneven-high-dose
    [t,v2] = simulateSingleDosingSchedule(t,v(2,:),d(2,:),alpha0,alpha50);


    % % even-low-dose
    [t,v3] = simulateSingleDosingSchedule(t,v(3,:),d(3,:),[],alpha12);

    % uneven-low-dose
    [t,v4] = simulateSingleDosingSchedule(t,v(4,:),d(4,:),alpha0,alpha25);

    % combine the results into a single matrix
    t=[t;t;t;t];
    volume = [v1;v2;v3;v4];

end

%% function to simulate a single experiment
function [time,total_volume] = simulateSingleDosingSchedule(t,v,d,alphaOFF,alphaON)
    
    % load dose response information:
    load("save/Hill_parameters.mat");
    b1 = Hill_parameters(1);
    b2 = Hill_parameters(2);
    koff_kon = Hill_parameters(3);
    kon = 5/koff_kon; % set koff \approx 0.5
    k0 = koff_kon *kon; %koff(t=0)

    % initial condition: [U0,A0,K0]
    v0 = [1,0,k0]; % all unaffected cells

    % tracking vectors etc:
    tspan = [0 1]; % 1 week intervals
    time=[0];
    volume=[v0];

    % loop over every week
    for i = 1:1:(length(d)-1)
        dose = d(i);

        [tp,y] = ode45(@(t,y) UA_evolve(t,y,dose,b1,b2, alphaON, alphaOFF,kon),tspan,v0);
        
        v0 = y(end,:); 
        tspan = [tp(end),tp(end)+1];

        time=[time;tp(end)]; 
        volume = [volume;v0];        
    end

    time = time';
    total_volume = volume(:,1)'+volume(:,2)';

end

