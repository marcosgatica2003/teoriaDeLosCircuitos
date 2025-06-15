#!/usr/bin/octave
clear; clc;
format short e

imshow('filtro_desnormalizado.png');
fprintf('Eliga el tipo de filtro .. \n');
fprintf('PASA-BAJOS[pb], PASA-ALTOS[pa]\n');
fprintf('\n');
tipo = input('Tipo de Filtro? [pb], [pa] -->  ','s');


if(tipo == 'pb')

  fc = input('Ingrese la frecuencia de corte = ');
  Ro = input('Ingrese la impedancia caracteristica Ro =');
  wc=2*pi*fc;
  ###Filtro Pasa Altos
  L    = (2*Ro)/wc;
  C    = 2/(Ro*wc);
  wc_2 = 2/sqrt(L*C);
  
  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BAJOS\n');
  fprintf('\t Reactancia desnormalizada L/2  = %f[mH]\n', L/(2*1e-3));
  fprintf('\t Reactancia desnormalizada C    = %f[uF]\n', C/1e-6);
  fprintf('\t Pulsacion de corte (wc) = %f[rad/seg]\n', wc);
  
elseif(tipo == 'pa')
  fc = input('Ingrese la frecuencia de corte = ');
  Ro = input('Ingrese la impedancia caracteristica Ro =');
  wc=2*pi*fc;
  ###Filtro Pasa Altos
  C    = 1/(2*Ro*wc);   
  L    = Ro/(2*wc);
  wc_2 = 1/(2*sqrt(L*C));
  
  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-Altos\n');
  fprintf('\t Reactancia desnormalizada 2*C  = %f[uF]\n', 2*C/1e-6);
  fprintf('\t Reactancia desnormalizada L    = %f[mH]\n', L/1e-3);
  fprintf('\t Pulsacion de corte (wc) = %f[rad/seg]\n', wc);
endif
