#!/usr/bin/octave
clear;
clc;

fprintf('Eliga el tipo de filtro .. \n');
fprintf('PASA-BANDAS[PB], ELIMINA-BANDA[EB]\n');
fprintf('\n');
tipo = input('Tipo de Filtro? [PB], [EB] -->  ','s');

if(tipo == 'EB')

  imshow('chevy_EB.png');
  L1n = 1.50885;
  C1n = 662.757e-3;
  L2n = 750.052e-3;
  C2n = 1.33324;
  L3n = 1.01180;  
  C3n = 988.341e-3;
  R   = 600;

  fc1 = 318.30988;
  fc2 = 1114.0846;

  wc1 = (2*pi*fc1);
  wc2 = (2*pi*fc2);

  wo_2 = wc1 * wc2;
  wo   = sqrt(wo_2);
  BW   = wc2 - wc1;
  won_2 = wo_2/(BW^2);
  
  C1    = C1n/(R*BW);
  C2    = C2n/(R*won_2*BW);
  C3    = C3n/(R*BW);
  L1    = (L1n*R)/(won_2*BW);
  L2    = (L2n*R)/BW;
  L3    = (L3n*R)/(won_2*BW);

  fprintf('\n');
  fprintf('FILTRO ELIMINA BANDA DESNORMALIZADO PARA Ro = %d\n', R); 
  fprintf('Valor de la pulsacion natural o de resonancia w_o = %f[rad/seg]\n',wo);
  fprintf('Valor del Ancho de Banda BW = %f[rad/seg]\n', BW);
  fprintf('Valor de la pulsacion normalizada w_on^2 = %f\n', won_2);
  fprintf('Valor del capacitor C1 = %f[nf]\n', C1/1e-9);
  fprintf('Valor del inductor  L1 = %f[mH]\n', L1/1e-3);
  fprintf('Valor del inductor  L2 = %f[mH]\n', L2/1e-3);
  fprintf('Valor del capacitor C2 = %f[nf]\n', C2/1e-9);
  fprintf('Valor del capacitor C3 = %f[nf]\n', C3/1e-9);
  fprintf('Valor del inductor  L3 = %f[mH]\n', L3/1e-3);

elseif(tipo == 'PB')

  imshow('chevy_PB.png');
  C1n = 662.757e-3;
  L1n = 1.50885;
  L2n = 750.052e-3;
  C2n = 1.33324;
  C3n = 988.341e-3;
  L3n = 1.01180;
  R   = 600;

  fc1 = 318.30988;
  fc2 = 1114.0846;

  wc1 = (2*pi*fc1);
  wc2 = (2*pi*fc2);

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
  fprintf('Valor del capacitor C2 = %f[nf]\n', C2/1e-9);
  fprintf('Valor del capacitor C3 = %f[nf]\n', C3/1e-9);
  fprintf('Valor del inductor  L3 = %f[mH]\n', L3/1e-3);

endif