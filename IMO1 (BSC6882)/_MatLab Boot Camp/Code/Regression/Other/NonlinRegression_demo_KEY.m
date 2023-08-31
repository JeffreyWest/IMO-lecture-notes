clear all; close all; clc
load BacterialGrowthRates.mat

P1_vec = [P1(1,:) P1(2,:) P1(3,:)];
P2_vec = [P2(1,:) P2(2,:) P2(3,:)];
P3_vec = [P1(3,:) P1(3,:) P3(3,:)];


xdata = [t t t];          % input xdata
ydata = P1_vec; % input ydata

params = lsqcurvefit(@logistic_fn, [100 70 10], xdata, ydata, [0 0 0],[2000 200 20]);

K1_fit = params(1)
C1_fit = params(2)
r1_fit = params(3)


t_vec = 0:0.5:100;
P1_fit = K1_fit./(1+C1_fit*exp(-r1_fit*t_vec));

figure
plot(t_vec,P1_fit,'r',xdata,ydata,'b.'); title('P1')

xdata = [t t t];          % input xdata
ydata = P2_vec; % input ydata

params = lsqcurvefit(@logistic_fn, [100 70 10], xdata, ydata, [0 0 0],[2000 1000 20]);

K2_fit = params(1)
C2_fit = params(2)
r2_fit = params(3)


t_vec = 0:0.5:100;
P2_fit = K2_fit./(1+C2_fit*exp(-r2_fit*t_vec));

figure
plot(t_vec,P2_fit,'r',xdata,ydata,'b.'); title('P2')

xdata = [t t t];          % input xdata
ydata = P3_vec; % input ydata

params = lsqcurvefit(@logistic_fn, [100 70 10], xdata, ydata, [0 0 0],[2000 1000 20]);

K3_fit = params(1)
C3_fit = params(2)
r3_fit = params(3)


t_vec = 0:0.5:100;
P3_fit = K3_fit./(1+C3_fit*exp(-r3_fit*t_vec));

figure
plot(t_vec,P3_fit,'r',xdata,ydata,'b.'); title('P3')

figure
plot(t_vec,P1_fit,t_vec,P2_fit,t_vec,P3_fit)
legend('P1','P2','P3')