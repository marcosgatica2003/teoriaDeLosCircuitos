#!/usr/bin/octave
clear; clc;
format long e
figure(1); imshow('pa_ss.png');
figure(2); imshow('pb_ss.png');
figure(3); imshow('PB_ss.png');
figure(4); imshow('EB_ss.png');
fprintf('Eliga el tipo de semiseccion m-derivado.. \n');
fprintf('PASA-BAJOS[pb], PASA-ALTOS[pa]\n');
fprintf('PASA-BANDA[PB], ELIMINA-BANDA[EB]\n');
fprintf('\n');
tipo = input('Tipo de Filtro? [pb], [pa], [PB], [EB] -->  ','s');
m = 0.6;

if(tipo == 'PB')
#Semiseccion PASA BANDA m-Derviado
  L1_2 = input('Valor de L1/2 en [H] = ');
  C1_2 = input('Valor de 2*C1 en [F] = ');
  L2   = input('Valor de L2   en [H] = ');
  C2   = input('Valor de C2   en [F] = ');
  
##  L1_2 = 0.027284;
##  C1_2 = 3.7893e-8;
##  L2   = 0.0068209;
##  C2   = 1.5158e-7;
##  
  L1 = L1_2*2;
  C1 = C1_2/2;
  
  wo = 1/sqrt(L2*C2);
  fo = wo/(2*pi);
  BW = 2/(sqrt(L1*C2));
  wc1 = roots([1 BW -(wo)^2]);
  wc1 = wc1(wc1>0);
  wc2 = BW + wc1;
  zo = 2/(C2*BW);
  
  L1m_2 = (L1*m)/2;
  C1m_2 = (C1/m)*2;
  L2m   = (L2/m)*2;
  C2m   = (C2*m)/2;
  L3m   = L1 * ((1-m^2)/(2*m));
  C3m   = C1 * ((2*m)/(1-m^2));

    
  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BANDA Kcte\n');
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f[Omhs]\n', zo);
  fprintf('\t VALOR DE m = %f\n', m);
  fprintf('\t Valor de L1m/2 en la semiseccion = %f[mH]\n', L1m_2/1e-3);
  fprintf('\t Valor de 2*C1m en la semiseccion = %f[uF]\n', C1m_2/1e-6);
  fprintf('\t Valor de L2m   en la semiseccion = %f[mH]\n', L2m/1e-3);
  fprintf('\t Valor de C2m   en la semiseccion = %f[uF]\n', C2m/1e-6);
  fprintf('\t Valor de L3m   en la semiseccion = %f[mH]\n', L3m/1e-3);
  fprintf('\t Valor de C3m   en la semiseccion = %f[uF]\n', C3m/1e-6);

elseif(tipo == 'EB')
#Semiseccion ELIMINA BANDA m-Derviado
  L1_2 = input('Valor de L1/2 en [H] = ');
  C1_2 = input('Valor de 2*C1 en [F] = ');
  L2   = input('Valor de L2   en [H] = ');
  C2   = input('Valor de C2   en [F] = ');
  
##  L1_2 = 5.617233e-3;
##  C1_2 = 212.20659e-9;
##  L2   = 1.657864e-3;
##  C2   = 719.00586e-9;
  
  L1 = L1_2*2;
  C1 = C1_2/2;
  
  wo = 1/sqrt(L2*C2);
  fo = wo/(2*pi);
  BW = 1/(2*sqrt(L2*C1));
  wc1 = roots([1 BW -(wo)^2]);
  wc1 = wc1(wc1>0);
  wc2 = BW + wc1;
  zo = 2*L2*BW;
  
  L1m_2 = (L1*m)/2;
  C1m_2 = (C1/m)*2;
  L2m   = (L2/m)*2;
  C2m   = (C2*m)/2;
  L3m   = L1 * ((1-m^2)/(2*m));
  C3m   = C1 * ((2*m)/(1-m^2));

    
  fprintf('\n');
  fprintf('\t Tipo de filtro = ELIMINA-BANDA Kcte\n');
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f[Omhs]\n', zo);
  fprintf('\t VALOR DE m = %f\n', m);
  fprintf('Valor de L1m/2 en la semiseccion = %f[mH]\n', L1m_2/1e-3);
  fprintf('Valor de 2*C1m en la semiseccion = %f[nF]\n', C1m_2/1e-9);
  fprintf('Valor de L2m   en la semiseccion = %f[mH]\n', L2m/1e-3);
  fprintf('Valor de C2m   en la semiseccion = %f[nF]\n', C2m/1e-9);
  fprintf('Valor de L3m   en la semiseccion = %f[mH]\n', L3m/1e-3);
  fprintf('Valor de C3m   en la semiseccion = %f[nF]\n', C3m/1e-9);

 endif
