#!/usr/bin/octave
pkg load symbolic
pkg load control

clear;
clc;
warning('off', 'all');

fprintf('Ingerse los polinimios como vectores: \n');
NUM = input('Numerador = ');
DEN = input('Denominador = ');

z = tf(NUM,DEN);
nyquist(z)

syms P w real

fprintf('\n');
%fprintf('Ingrese los polinomion con "P". ej= 15*P^2 - 15.\n');

num = poly2sym(NUM, P);
den = poly2sym(DEN, P);

z = num/den;
expand(z)

z_jw = subs(z, P, i*w);

re = real(z_jw);
expand(re)
im = imag(z_jw);
expand(im)

w_root_imag = double(solve(re == 0));
w_root_imag = w_root_imag(w_root_imag > 0);
root_imag = double(subs(im, w, w_root_imag));

w_root_real = double(solve(im == 0));
w_root_real = w_root_real(w_root_real > 0);
root_real = double(subs(re, w, w_root_real));

fprintf('\n');
fprintf('Existe corte al eje Real? = ');
if w_root_real > 0
  fprintf('SI\n');
  fprintf('Valor positivo de la pulsación de corte = %f\n', w_root_real);
  fprintf('Valor de corte en el eje real = %f\n', root_real);
else
  fprintf('NO\n');
endif

fprintf('\n');
fprintf('Existe corte al eje Imaginario? = ');
if w_root_real > 0
  fprintf('SI\n');
  fprintf('Valor positivo de la pulsación de corte = %f\n', w_root_imag);
  fprintf('Valor de corte en el eje imaginario = %f\n', root_imag);
else
  fprintf('NO\n');
endif
