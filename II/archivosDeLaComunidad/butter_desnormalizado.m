clear
clc
A_max = 1; %[dB]
L1n = 1.53073;
C1n = 1.57716;
L2n = 1.08239;
C2n = 382.683e-3;
R = 175;

fp = 238.7325;
wp = 2*pi*fp;

n = 4;

epsilon = sqrt((10^(0.1*A_max))-1);
L1_d = L1n * epsilon^(1/n) * R/wp;
C1_d = C1n * epsilon^(1/n) * 1/(R*wp);
L2_d = L2n * epsilon^(1/n) * R/wp;
C2_d = C2n * epsilon^(1/n) * 1/(R*wp);

fprintf('\n');
fprintf('FILTRO BUTTERWORTH PASA BAJOS DESNORMALIZADO PARA Ro = %d\n', R);
fprintf('Valor de la pulsacion de corte banda pasante wp = %f[rad/seg]\n',wp);
fprintf('Valor de la frecuencia de corte banda pasante fp = %f[rad/seg]\n',fp);
fprintf('Orden del filtro propuesto n = %d\n', n)
fprintf('Valor del nuevo factor epsilon (e) = %f\n', epsilon);
fprintf('Valor desnormalizado del inductor  L1 = %f[mH]\n', L1_d/1e-3);
fprintf('Valor desnormalizado del capacitor C1 = %f[uf]\n', C1_d/1e-6);
fprintf('Valor desnormalizado del inductor  L2 = %f[mH]\n', L2_d/1e-3);
fprintf('Valor desnormalizado del capacitor C2 = %f[uf]\n', C2_d/1e-6);
