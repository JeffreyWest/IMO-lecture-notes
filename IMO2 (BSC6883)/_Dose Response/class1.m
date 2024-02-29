%% goal: find initial dose response, and find a best fit.
clc;clear;close all;

%% First, plot an in vivo dose response curve:
%  >   x_data is values of dose (mg / kg)
%  >   y_data is values of drug-induced proliferation rate (DIP rate)

figure(1); hold on;
x_data = [0,12.5,25,50];
y_data_mean = [0.7601   -0.8467   -1.8874   -1.6815];
y_data_std = [0.1014    0.3375    0.6722    0.7830];
errorbar(x_data,y_data_mean,y_data_std,'.k','MarkerSize',60,'LineWidth',4);


%% Next, find the best fit dose response function using a Hill function:
H = @(p,x) (1/log(2)) .* (p(3)*p(1) + (x).*p(2)) ./ (p(3)+(x));

Hill_parameters = lsqcurvefit(H,[1,1,1],x_data,y_data_mean); % best fit


%% Finally, plot the best fit on top of the data:
xfit = 0:0.1:50;
DIPFit = H(Hill_parameters,xfit);
plot(xfit,DIPFit,'--k','LineWidth',4);

%% fix the plot's axes / labels:
xlim([-5,55]); xlabel('dose, x (mpk)');
ylim([-3,1]); ylabel('drug-induced prolif. rate (DIP)');
clean();

Hill_parameters

%% save the best-fit parameters for later use:
save('save/Hill_parameters.mat','Hill_parameters');


