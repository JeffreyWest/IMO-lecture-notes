%Create a function that takes in x and evaluates y = 3x^2 - 6x + 9 and
%returns the square of y

function [y] = fun1(x)

y1 = 3*x.^2 - 6*x + 9;
disp(y1)

y = y1.^2;

end