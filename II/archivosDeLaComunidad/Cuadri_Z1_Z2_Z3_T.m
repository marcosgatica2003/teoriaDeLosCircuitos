format long e
echo off
clc;

fprintf('\n\n\n');
fprintf('        CÁLCULO DE Zim1 Y Zim2 EN T');
fprintf('\n\n\n');


fprintf('\n\n');
fprintf('       |------|           |-------|        \n');
fprintf('O------|  Z1  |-----x-----|  Z3   |------O \n');
fprintf('       |------|     |     |-------|        \n');
fprintf('                |---|---|                  \n');
fprintf('                |       |                  \n');
fprintf('Zim1            |  Z2   |            Zim2  \n');
fprintf('                |       |                  \n');
fprintf('                |---|---|                  \n');
fprintf('                    |                      \n');
fprintf('O-------------------x--------------------O \n\n');


Z1 = input('\nIngrese el valor de Z1:');
Z2 = input('\nIngrese el valor de Z2:');
Z3 = input('\nIngrese el valor de Z3:');

A = 1 + (Z1/Z2);
B = Z3 + [(Z1*Z3)/Z2] + Z1;
C = 1/Z2;
D = (Z3/Z2) + 1;

fprintf('\n-------------Parámetros de transmisión directa---------------\n');


fprintf('\nA = %f',A);
fprintf('\nB = %f',B);
fprintf('\nC = %f',C);
fprintf('\nD = %f',D);

fprintf('\n');
fprintf('\n');

Zim1 = sqrt ((A*B)/(C*D));
Zim2 = sqrt ((B*D)/(A*C));

fprintf('\n-------------------Impedancia imagen-------------------------\n');


fprintf('\nZim1 = %f',Zim1);
fprintf('\nZim2 = %f',Zim2);

fprintf('\n');
fprintf('\n');

