clc;clear;close all;

%% Section 1: Linear Model
x = 0:5:30;

m = 2.75
b = 4.75
y = m.*x + b;

figure(1);
subplot(1,2,1);

g=plot(x,y,'k-o');
set(g,'MarkerSize',10)
title('Ground Truth')
xlabel('x-values'); ylabel('y-values')
legend('ground truth','Location','Northwest')

subplot(1,2,2)
% +noise
y_noise = y + 7.5.*randn(length(y),1)';
g=plot(x, y_noise, 'r.');
save('NoisyData','x','y_noise');
set(g,'MarkerSize',20)
title('Noisy Data')
xlabel('x-values'); ylabel('y-values')
legend('noisy data','Location','Northwest')


%% Section 2: Linear Model + Random Guess
% find the best fit for the model:
% y = mx + b (see "linear_fn.m")
figure(2);hold on;

g=plot(x, y_noise, 'r.','MarkerSize',20);

% an initial guess of the parameters for our model?
m_guess = 4; b_guess = 2;

I_guess = m_guess.*x + b_guess;
g=plot(x,I_guess,'b-o','MarkerSize',20);

legend('noisy data', 'guess model', 'Location', 'Northwest')
title('Random Guess')
xlabel('x-values'); ylabel('y-values')
    


%% Section 3: Introduction to lsqcurvefit
clear all;
load NoisyData.mat

xdata = x;          % input xdata
ydata = y_noise; % input ydata
params = lsqcurvefit(@linear_fn, [2 7], xdata, ydata);

m_fit = params(1); b_fit = params(2);
x_fit = 0:1:30;
y_fit = m_fit*x_fit + b_fit;

figure(4);hold on;

g=plot(x, y_noise, 'r.','MarkerSize',20); %original data

g = plot(x_fit,y_fit,'b-'); % best fit

legend('noisy data', 'fitted model', 'Location', 'Northwest')
title('Optimized Fit')
xlabel('x-values'); ylabel('y-values')
    
    