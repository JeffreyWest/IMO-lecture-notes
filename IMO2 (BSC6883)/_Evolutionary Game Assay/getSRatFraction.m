function [t,S,R,yMax] = getSRatFraction(foldername,ti,fi,Nr)
filename = strcat(foldername,'data/condition',num2str(ti),'.csv');
data = dlmread(filename,',',1,0);
t = data(:,1); data = data(:,2:end);
yMax = max(max(data));

col = (fi-1)*Nr*2 + 1;
S = data(:,col:(col+(Nr-1)));
R = data(:,(col+Nr):(col+(2*Nr-1)));
end