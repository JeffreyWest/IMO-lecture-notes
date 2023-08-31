close all
x = 1:5:40;

y = fun1(x);

figure(1); hold on
plot(x,y,'Color','k','linewidth',8)

figure(2); hold on
plot(x,y.^2)

figure(3); hold on
plot(x,y.^3)
