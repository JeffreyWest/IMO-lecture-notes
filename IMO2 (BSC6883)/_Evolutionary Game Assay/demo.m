clc;clear;close all;
colors = [0,0,0; 0.2,0.5,0.7; 0.8,0.2,0.1]; % black, blue, red


foldername = 'Example/';
Nr = 3; %# of replicates
fraction = [0,10,25,50,75,90,100]/100; % fraction of resistant cells at time 0
Nf=length(fraction);  %# of resistant fractions



ti = 1; % untreated case only:

figure(1);
[a,b,c,d,point_x,point_y]=plotFitness(foldername,ti,Nf,Nr,fraction);
ylim([0.015, 0.035]);




[p,q,COV1,COV2] = getCovarianceMatrices(foldername,ti,Nf,Nr,fraction);
COV1
COV2

% find mean values:
a_mean = q(1);
b_mean = p(1) + q(1);
c_mean = q(2);
d_mean = p(2) + q(2);

% find variance:
a_var = COV1(2,2);
b_var = COV1(1,1) + COV1(1,2) + COV1(2,1) + COV1(2,2);
c_var = COV2(2,2);
d_var = COV2(1,1) + COV2(1,2) + COV2(2,1) + COV2(2,2);

A = [a_mean,b_mean,c_mean,d_mean]

% take sqrt to find standard deviation:
Avar = sqrt([a_var,b_var,c_var,d_var])

figure(2);
errorbar([1,2,3,4],A,Avar,'.k','LineWidth',3,'MarkerSize',30);
xlim([0 5]);

xticks([1,2,3,4])
xticklabels({'a','b','c','d'})
ylabel('payoff matrix value')

clean();

