clear;
clc;

E_out_E_in = 0.15;
E_in_E_out = 1/E_out_E_in;
Z_out = 56;

alfa = log(E_in_E_out)
Z1 = Z_out * (1 - 1/E_in_E_out);
Z2 = Z_out * (1/(E_in_E_out - 1));
Z3 = 0;


fprintf('\n');
fprintf('Valor de Z1 = %f\n', Z1);
fprintf('Valor de Z2 = %f\n', Z2);
fprintf('Valor de Z2 = %f\n', Z3);
fprintf('Valor de la atenuacion alfa del circuito propuesto = %f\n', alfa);