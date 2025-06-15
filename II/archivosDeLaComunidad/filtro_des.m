clear;
clc;

format long e

L1_pb = 1.34649;
C1_pb = 1.30015;
L2_pb = 798.140e-3; 

C1n = 1/L1_pb;
L1n = L1_pb;
C2n = C1_pb;
L2n = 1/C1_pb;
C3n = 1/L2_pb;
L3n = L2_pb;
R   = 250;

fc1 = 1193.663;
fc2 = 1989.4368;
wc1 = 2*pi*fc1;
wc2 = 2*pi*fc2;


wo_2 = wc1 * wc2;
wo   = sqrt(wo_2);
BW   = wc2 - wc1;
won_2 = wo_2/(BW^2);

C1    = C1n/(R*won_2*BW);
C2    = C2n/(R*BW);
C3    = C3n/(R*won_2*BW);
L1    = (L1n*R)/BW;
L2    = (L2n*R)/(won_2*BW);
L3    = (L3n*R)/BW;

fprintf('\n');
fprintf('FILTRO PASA BANDA DESNORMALIZADO PARA Ro = %d\n', R);
fprintf('Valor de la pulsacion natural o de resonancia w_o = %f[rad/seg]\n',wo);
fprintf('Valor del Ancho de Banda BW = %f[rad/seg]\n', BW);
fprintf('Valor de la pulsacion normalizada w_on^2 = %f\n', won_2);
fprintf('Valor del capacitor C1 = %f[nf]\n', C1/1e-9);
fprintf('Valor del inductor  L1 = %f[mH]\n', L1/1e-3);
fprintf('Valor del inductor  L2 = %f[mH]\n', L2/1e-3);
fprintf('Valor del capacitor C2 = %f[uf]\n', C2/1e-6);
fprintf('Valor del capacitor C3 = %f[nf]\n', C3/1e-9);
fprintf('Valor del inductor  L3 = %f[mH]\n', L3/1e-3);