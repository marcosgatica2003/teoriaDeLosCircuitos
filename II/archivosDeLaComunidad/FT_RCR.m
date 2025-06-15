#!/usr/bin/octave
pkg load symbolic
clc;
clear;
warning('off', 'all');

syms w
syms P
syms A B C

num_P = A*(P + B);
den_P = (P + C);

disp('Funcion de transferencia = ')
disp(' ')

F_P = num_P/den_P

imshow('images/RCR.png');

R1 = input('Ingrese el valor del R1 en [Ohm] = ');
R2 = input('Ingrese el valor del R2 en [Ohm] = ');
C1 = input('Ingrese el valor del C1 en [F] = ');

A = C1*R2/(C1*(R1 + R2));
B = 1/(C1*R2);
C = 1/(C1*(R1 + R2));

printf('\n');
printf('\tValor del coeficiente A de la Funcion de Transferencia F(p): %f\n', A);
printf('\tValor del coeficiente B de la Funcion de Transferencia F(p): %f\n', B);
printf('\tValor del coeficiente C de la Funcion de Transferencia F(p): %f\n', C);

num = A*(P + B);
den = (P + C);

z = num/den;
z = subs(z, P, (i*w));

v = input('Introduzca los valores de "w": ');
x = double(subs(z, w, v));

printf('\n');
printf('\tValor de w \tValor Parte Real \tValor Parte Imaginaria\n');
for j=1 : length(v)
  printf('\t%f \t%f \t\t%f\n', v(j), real(x(j)) ,imag(x(j)));
endfor
