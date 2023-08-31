close all;
%K = 1000; K2 = 500;
C = 100;
r = 0.1; r3 = 0.05;

t=1:5:100;

m = 50*C.*exp(r.*t);
m2 = 1000*C.*exp(r.*t);
m3 = 2000*C.*exp(r.*t);

figure;plot(t,m,'k',t,m2,'r',t,m3,'b')

legend('P1','P2','P3')

P1 = [m; m; m] + 9e7*randn(3,20);
P2 = [m2; m2; m2] + 9e7*randn(3,20);
P3 = [m3; m3; m3] + 9e7*randn(3,20);
P1(P1<0)=0;
P2(P2<0)=0;
P3(P3<0)=0;

figure;plot(t,P1,'k.',t,P2,'r.',t,P3,'b.')
legend('P1','P2','P3')
save('BacterialGrowthRates','t','P1','P2','P3')