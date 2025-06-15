clc;
clear;

A_max = input('Ingrese atenuacion maxima Amax en [dB] = ');
A_min = input('Ingrese atenuacion minima Amin en [dB] = ');

wp = input('Ingrese la pulsacion pasante wp = ');
ws = input('Ingrese la pulsacion rechazada ws = ');

if (wp == 0)
  fp = input('Ingrese la frecuencia pasante fp = ');
  wp = fp*2*pi;
endif

if (ws == 0)
  fs = input('Ingrese la frecuencia rechazada fs = ');
  ws = fs*2*pi;
endif

##A_max = 1;
##A_min = 25;
##
##wp = 100;
##ws = 150;

epsilon = sqrt((10^(A_max/10)) - 1);
delta   = sqrt((10^(A_min/10)) - 1);
K_s = wp/ws;
K_d = (epsilon/delta);
n = log10(K_d)/log10(K_s);
n_ceil = ceil(n);
Omega_N = (epsilon^(1/n)) * (ws/wp);

fprintf('\n');
fprintf('Valor del factor de selectividad Ks = %f\n', K_s);
fprintf('Valor del factor de selectividad Kd = %f\n', K_d);
fprintf('Valor de la pulsacion normalizada Omega_N= %f\n', Omega_N);
fprintf('Valor del coeficiente epsilon = %f\n', epsilon);
fprintf('Valor del coeficiente delta = %f\n', delta);
fprintf('Valor calculado del orden "n" del filtro = %f\n', n);
fprintf('Valor propuesto del orden "n" del filtro = %f\n', n_ceil);