#!/usr/bin/octave
pkg load symbolic
clc;
clear;
warning('off', 'all');

syms w
syms P
syms A B C
syms a b c

num_P = a*P^2 + b*P + c;
den_P = A*P^2 + B*P + C;

disp('Funcion de transferencia = ')
disp(' ')

F_P = num_P/den_P

imshow('FT.png');

R1 = 20e3;
R2 = 20e3;
R3 = 1778;

C1 = 100e-6;
C2 = 281.25e-6;

a = 1;
b = ((C1*R2)+(C2*R3))/(C2*C1*R2*R3);
c = 1/(C2*C1*R2*R3);;

A = 1;
B =  ((C1*R2) + (C2*R3) + (C2*R2))/(C2*C1*R2*R3);
C = 1/(C2*C1*R2*R3);;

printf('\n');
printf('\tValor del coeficiente a de la Funcion de Transferencia F(p): %f\n', a);
printf('\tValor del coeficiente b de la Funcion de Transferencia F(p): %f\n', b);
printf('\tValor del coeficiente c de la Funcion de Transferencia F(p): %f\n', c);
printf('\tValor del coeficiente A de la Funcion de Transferencia F(p): %f\n', A);
printf('\tValor del coeficiente B de la Funcion de Transferencia F(p): %f\n', B);
printf('\tValor del coeficiente C de la Funcion de Transferencia F(p): %f\n', C);

num = a*P^2 + b*P + c;
den = A*P^2 + B*P + C;

z = num/den;
z = subs(z, P, (i*w));

v = [0 0.5 1 2 20 9999 inf];
x = double(subs(z, w, v));

printf('\n');
printf('\tValor de w \tValor Parte Real \tValor Parte Imaginaria\n');
for j=1 : length(v)
  printf('\t%f \t%f \t\t%f\n', v(j), real(x(j)) ,imag(x(j)));
endfor
