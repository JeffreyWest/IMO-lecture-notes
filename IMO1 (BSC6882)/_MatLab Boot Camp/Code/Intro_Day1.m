%%
%----------------Vectors, Matrices, Structures, and Cells------------------
%Vectors
a = [8; 7; 4; 3; 0; 9] %6x1 vector
a(3) %third element of a
a([2 6]) %second and sixth elements of a

b = [8 7 4 3 0 9] %1x6 vector
%   (equivalent to b = a' (transposes a))

r = [1 2 3 4 5]' %5x1 vector (tranpose (') changes it from 1x5 to 5x1)
s = [10; 4; 3; 8; 1] %5x1 vector
t = r+s
u = r*s %ERROR: inner matrix dimensions must agree (i.e RxS * SxT = RxT)
v = r*s' %(5x1 * 1x5 = 5x5)

%% --------------------------------------------------------------------------
%Matrices
c = [8 7; 4 3; 0 9]
c(1,:) %first row of c
c(:,2) %second column of c

d = [8 7 4; 3 0 9]
d(2,:) %second row of d
d(:,1) %first column of d
d(:,2:3) %second and third columns of d
d(:,[1 3]) %first and third columns of d
d(2,[3 2]) %third and second columns of second row (in that order)

c = c'
f = ones(2,3) %2x3 matrix of ones
g = zeros(3,2) %3x2 matrix of zeros
h = c+f
j = c*g

%% --------------------------------------------------------------------------
%Structures
data.name = 'Patient 1';
data.tumor = [10 14 17 20 26];
data.day = 1:7:29; %vector starting at 1, incrementing by 7, stopping at 29
data

data.tumor(3) = 19;
data

x = linspace(1,19,10); %10 equally spaced numbers between 1 and 19
y1 = x.^2; %period necessary for element-wise operation (error otherwise)
y2 = sin(x);

funx.x = x;
funx.squarex = y1;
funx.sinx = y2;
funx

%% --------------------------------------------------------------------------
%Arrays
C = {'USA','Canada','UK','Mexico','Australia'; 5 7 9 2 3}
C(1:2,2:3)

%%
%-----------------------------Handling & saving data-----------------------
%.mat files
A = [161 144 133 150 124 148 143 147 163 175 161];
B = [A 90 100 179 180]; %appends 4 elements on to the end of A
C = [10 20 30; 40 50 60; 70 80 90];
patient_name = 'Jack';
save patientData.mat A B C patient_name

clear all
load patientData.mat

clear all
load patientData.mat A

%%
clear
x = 2

%% --------------------------------------------------------------------------
%.csv files
data = csvread('Example1.csv',1); % starting from 1st row (skip 0th row)

%% COMMENT (This will be skipped)
% comments
%-----------------------------------Plotting-------------------------------
%2D Line Plot
clear;close all;
data.name = 'Patient 1';
data.tumor = [10 14 17 20 26];
data.day = 1:7:29; %vector starting at 1, incrementing by 7, stopping at 29
data.tumor(3) = 19;

x = data.day;
y = data.tumor;

figure(1);
plot(x,y)

figure(2);
plot(x,y,'g--') %makes line green

figure(3);
plot(x,y,'g--','linewidth',6) %makes line thicker

figure(4);
plot(x,y,'g--','linewidth',6)
xlabel('days') %label on x-axis
ylabel('tumor volume') %label on y-axis
title('Tumor Volume vs. Days') %title on top of graph

figure(5);
plot(x,y,'g--','linewidth',6)
xlabel('days')
ylabel('tumor volume')
title('Tumor Volume vs. Days')
set(gca,'fontsize',30) %increases font size

x = linspace(1,19,10); %10 equally spaced numbers between 1 and 19
y1 = x.^2; %period necessary for element-wise operation (error otherwise)

figure(6);
plot(x,y1)
title('x^2')
set(gca,'fontsize',30)

figure(7);
y2 = sin(x);
plot(x,y2)
title('sin(x)')
set(gca,'fontsize',30)
% (redo w/  better values for x)

figure(8);
plot(x,y1,'r',x,y2,'b*')

figure(9);
plot(x,y1,'r')
plot(x,y2,'b*')

figure(10); hold on %hold on prevents overriding (allows plotting more than one)
plot(x,y1,'r')
plot(x,y2,'b*')
legend('x^2','sin(x)')



c = parula(9); %color map with 9 colors

figure(11); hold on
plot(x,sqrt(y1),'Color',c(8,:))
plot(x,y2,'*','Color',c(4,:))
legend('x','sin(x)')

%% --------------------------------------------------------------------------
%3D Line Plot
x = linspace(1,19,10); %10 equally spaced numbers between 1 and 19
y1 = x.^2; %period necessary for element-wise operation (error otherwise)
y2 = cos(x);

figure(12);
scatter3(x,y1,y2,30,'filled','m')
xlabel('x')
ylabel('x^2')
zlabel('cos(x)')
set(gca,'fontsize',20)

figure(13);
scatter3(x,y1,y2,300,'filled','m')
xlabel('x')
ylabel('x^2')
zlabel('cos(x)')
set(gca,'fontsize',20)