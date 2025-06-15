format long e
echo off
clc;

fprintf('\n\n\n\n');
fprintf('TRANSFORMACIÓN TRIÁNGULO ESTRELLA \n');
fprintf('\n\n');

fprintf('\n\n');
fprintf('                   |-------|                             |------|           |-------|              \n');
fprintf('   O---------x-----|  ZB   |------x----------O    O------|  Z1  |-----x-----|  Z3   |------O  \n');
fprintf('             |     |-------|      |                      |------|     |     |-------|           \n');
fprintf('         |---|---|            |---|---|                           |---|---|                       \n');
fprintf('         |       |            |       |                           |       |                      \n');
fprintf('         |  ZA   |            |   ZC  |        =>                 |  Z2   |                      \n');
fprintf('         |       |            |       |                           |       |                        \n');
fprintf('         |---|---|            |---|---|                           |---|---|                       \n');
fprintf('             |                    |                                   |                         \n');
fprintf(' O-----------x--------------------x----------O      O-----------------x--------------------O   \n\n');



ZA = input('\nIngrese el valor de ZA:');
ZB = input('\nIngrese el valor de ZB:');
ZC = input('\nIngrese el valor de ZC:');

fprintf('\n------------------VALORES DE TRIÁNGULO---------------------\n');

fprintf('\nZA = %f',ZA);
fprintf('\nZB = %f',ZB);
fprintf('\nZC = %f',ZC);

fprintf('\n\n');

Z1 = (ZA*ZB)/(ZA + ZB + ZC);
Z2 = (ZA*ZC)/(ZA + ZB + ZC);
Z3 = (ZB*ZC)/(ZA + ZB + ZC);

fprintf('\n----------------VALORES DE ESTRELLA----------------------\n');

fprintf('\nZA = %f',Z1);
fprintf('\nZB = %f',Z2);
fprintf('\nZC = %f\n',Z3);

