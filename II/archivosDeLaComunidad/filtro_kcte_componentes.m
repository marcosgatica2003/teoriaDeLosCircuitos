#!/usr/bin/octave
clc; clear;

imshow('tipos_de_filtros.png');
fprintf('Eliga el tipo de filtro .. \n');
fprintf('PASA-BAJOS[pb], PASA-ALTOS[pa], PASA-BANDA[PB] o ELIMINA-BANDA[EB]\n');
fprintf('\n');
tipo = input('Tipo de Filtro? [pb], [pa], [PB], [EB]  -->  ','s');

if(tipo == 'pb')
  ### PASA BAJOS
  L_2 = input('Valor de L/2 en [H] = ');
  C   = input('Valor de C   en [F] = ');

  L = L_2*2;

  wc = 2/sqrt(L*C);
  fc = wc/(2*pi);
  zo = (L*wc)/2;

  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BAJOS\n');
  fprintf('\t PULSACION DE CORTE (wc) = %f[rad/seg]\n', wc);
  fprintf('\t FRECUENCIA DE CORTE (fc) = %f[Hertz]\n', fc);
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', zo);

elseif(tipo == 'pa')
  ### PASA ALTOS
  L   = input('Valor de L   en [H] = ');  
  C_2 = input('Valor de 2*C en [F] = ');

  C = C_2/2;

  wc = 1/(2*sqrt(L*C));
  fc = wc/(2*pi);
  zo = 1/(2*wc*C);

  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-ALTOS\n');
  fprintf('\t PULSACION DE CORTE (wc) = %f[rad/seg]\n', wc);
  fprintf('\t FRECUENCIA DE CORTE (fc) = %f[Hertz]\n', fc);
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', zo);

elseif(tipo == 'PB')
  ### PASA BANDA
  L1_2 = input('Valor de L1/2 en [H] = ');
  C1_2 = input('Valor de 2*C1 en [F] = ');
  L2   = input('Valor de L2   en [H] = ');
  C2   = input('Valor de C2   en [F] = ');

  L1 = L1_2*2;
  C1 = C1_2/2;
  
  wo = 1/sqrt(L2*C2);
  fo = wo/(2*pi);
  BW = 2/(sqrt(L1*C2));
  wc1 = roots([1 BW -(wo)^2]);
  wc1 = wc1(wc1>0);
  wc2 = BW + wc1;
  zo = 2/(C2*BW);

  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BANDA\n');
  fprintf('\t PULSACION DE RESONANCIA (wo) = %f[rad/seg]\n', wo);
  fprintf('\t FRECUENCIA DE RESONANCIA (fo) = %f[Hertz]\n', fo);
  fprintf('\t ANCHO DE BANDA [BW] = %f [rad/seg]\n', BW);
  fprintf('\t PULSACION DE CORTE INFERIOR (wc1) = %f[rad/seg]\n', wc1);
  fprintf('\t PULSACION DE CORTE SUPERIOR (wc2) = %f[rad/seg]\n', wc2);
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', zo);

elseif(tipo == 'EB')
  ### ELIMINA BANDA
  L1_2 = input('Valor de L1/2 en [H] = ');
  C1_2 = input('Valor de 2*C1 en [F] = ');
  L2   = input('Valor de L2   en [H] = ');
  C2   = input('Valor de C2   en [F] = ');

  L1 = L1_2*2;
  C1 = C1_2/2;

  wo = 1/sqrt(L2*C2);
  fo = wo/(2*pi);
  BW = 1/(2*sqrt(L2*C1));
  wc1 = roots([1 BW -(wo)^2]);
  wc1 = wc1(wc1>0);
  wc2 = BW + wc1;
  zo = 2*L2*BW;

  fprintf('\n');
  fprintf('\t Tipo de filtro = ELIMINA-BANDA\n');
  fprintf('\t PULSACION DE RESONANCIA (wo) = %f[rad/seg]\n', wo);
  fprintf('\t FRECUENCIA DE RESONANCIA (fo) = %f[Hertz]\n', fo);
  fprintf('\t ANCHO DE BANDA [BW] = %f [rad/seg]\n', BW);
  fprintf('\t PULSACION DE CORTE INFERIOR (wc1) = %f[rad/seg]\n', wc1);
  fprintf('\t PULSACION DE CORTE SUPERIOR (wc2) = %f[rad/seg]\n', wc2);
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', zo);
endif
