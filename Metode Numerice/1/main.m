clear all;
close all;
clc;

output_precision(9)
f = @(x)log(2+cos(x.^2))

a=-inf

b=inf

n=4

result = gausshermi(f,a,b,4);

fprintf("Rezultatul pentru n=4:")
display(result)

rez = gausshermi(f,a,b,100);
display(result)

error = abs(rez - result);
fprintf("Marginea superioara a erorii:")
display(error)

fprintf("Deci putem scrie rezultatul pentru n=4 ca:\n")
disp(result)
disp("+-")
disp(error)

fprintf("Rezultatul pentru n=100 (precizie mare):")
display(rez)