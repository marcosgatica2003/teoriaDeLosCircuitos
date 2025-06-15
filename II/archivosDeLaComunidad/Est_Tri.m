format long e
echo off
clc;

fprintf('\n\n\n\n');
fprintf('TRANSFORMACIÓN ESTRELLA A TRIÁNGULO \n');
fprintf('\n\n');

fprintf('\n\n');
fprintf('       |------|           |-------|                          |-------|                       \n');
fprintf('O------|  Z1  |-----x-----|  Z3   |------O   O---------x-----|  ZB   |------x----------O      \n');
fprintf('       |------|     |     |-------|                    |     |-------|      |                \n');
fprintf('                |---|---|                          |---|---|            |---|---|            \n');
fprintf('                |       |                          |       |            |       |             \n');
fprintf('                |  Z2   |                 =>       |  ZA   |            |   ZC  |            \n');
fprintf('                |       |                          |       |            |       |             \n');
fprintf('                |---|---|                          |---|---|            |---|---|             \n');
fprintf('                    |                                  |                    |                \n');
fprintf('O-------------------x--------------------O   O---------x--------------------x----------O       \n\n');



Z1 = input('\nIngrese el valor de Z1:');
Z2 = input('\nIngrese el valor de Z2:');
Z3 = input('\nIngrese el valor de Z3:');

fprintf('\n------------------VALORES DE ESTRELLA---------------------\n');

fprintf('\nZ1 = %f',Z1);
fprintf('\nZ2 = %f',Z2);
fprintf('\nZ3 = %f',Z3);

fprintf('\n\n');

ZA = (Z1*Z2 + Z1*Z3 + Z2*Z3)/Z3;
ZB = (Z1*Z2 + Z1*Z3 + Z2*Z3)/Z2;
ZC = (Z1*Z2 + Z1*Z3 + Z2*Z3)/Z1;

fprintf('\n----------------VALORES DE TRIÁNGULO----------------------\n');

fprintf('\nZA = %f',ZA);
fprintf('\nZB = %f',ZB);
fprintf('\nZC = %f\n',ZC);

