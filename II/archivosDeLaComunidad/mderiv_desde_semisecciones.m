#!/usr/bin/octave
clear; clc;
format long e
figure(1); imshow('pa_ss.png');
figure(2); imshow('pb_ss.png');
fprintf('Eliga el tipo de semiseccion m-derivado.. \n');
fprintf('PASA-BAJOS[pb], PASA-ALTOS[pa]\n');
fprintf('\n');
tipo = input('Tipo de Filtro? [pb], [pa] -->  ','s');

if(tipo == 'pb')
#Pasa Bajos m-Derviado
  L1m_2 = input('Valor de L1m/2 en [H] = ');
  L2m_2 = input('Valor de L2m   en [H] = ');
  Cm_2  = input('Valor de Cm    en [F] = ');

##  L1m_2 = 9.295775e-3
##  L2m_2 = 16.5258215e-3
##  Cm_2  = 3.0729833e-6

  L1m   = L1m_2*2;
  L2m   = L2m_2/2;  
  Cm    = Cm_2*2;
  
  Ro_m  = sqrt(L1m/Cm);
  m     = sqrt(L1m/(L1m + 4*L2m)); 
  wc_m  = (2*m)/(sqrt(L1m*Cm));
  fc_m  = wc_m/(2*pi);
  w_inf = 1/sqrt(L2m * Cm);
  f_inf = w_inf/(2*pi);
  w_in2 = wc_m * sqrt(1-m^2); 
  m2    = sqrt(1 - (wc_m/w_inf)^2);
    
  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BAJOS m-Derivado\n');
  fprintf('\t 2*L1m = %f[mH]\n',L1m_2/1e-3);
##  fprintf('\t   L1m = %f[mH]\n',L1m/1e-3);
  fprintf('\t   L2m = %f[mH]\n',L2m_2/1e-3);  
  fprintf('\t   Cm  = %f[uF]\n',Cm_2/1e-6);  
  fprintf('\t PULSACION DE CORTE (wc) = %f[rad/seg]\n', wc_m);
  fprintf('\t FRECUENCIA DE CORTE (fc) = %f[Hertz]\n', fc_m);
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', Ro_m);
  fprintf('\t VALOR DE m = %f\n', m);
  fprintf('\t PULSACION DE ATENUACION INFINITA  (w_inf) = %f[rad/seg]\n', w_inf);
  fprintf('\t FRECUENCIA DE ATENUACION INFINITA (f_inf) = %f[Hertz]\n', f_inf);

##  Lk_2 = L1m_2/m;
##  Lk   = Lk_2*2;
##  Ck   = Cm/m;
##  Ro_k = sqrt(Lk/Ck);
##  
##  wc_k = 2/(sqrt(Lk*Ck));
##  fc_k = wc_k/(2*pi);
##
##  fprintf('\n');
##  fprintf('\t Tipo de filtro = PASA-BAJOS Kcte\n');
##  fprintf('\t Lk/2 = %f[mH]\n', Lk_2/1e-3);
##  fprintf('\t   Lk = %f[mH]\n', Lk/1e-3);
##  fprintf('\t   Ck  = %f[uF]\n',Ck/1e-6);  
##  fprintf('\t PULSACION DE CORTE (wc) = %f[rad/seg]\n', wc_k);
##  fprintf('\t FRECUENCIA DE CORTE (fc) = %f[Hertz]\n', fc_k);
##  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', Ro_k);
##  
elseif(tipo == 'pa')
#Pasa Altos m-Derviado
  Lm_2  = input('Valor de Lm   en [H] = '); 
  C1m_2 = input('Valor de 2*C1m en [F] = ');
  C2m_2   = input('Valor de C2m   en [F] = ');

##  C1m_2   = 2.442002e-6;
##  C2m_2   = 1.373626e-6;
##  Lm_2    = 41.269841e-3;
    
  Lm    = Lm_2/2;
  C1m   = C1m_2/2;
  C2m   = C2m_2*2;
  
  Ro_m  = sqrt(Lm/C1m);
  m     = sqrt(C2m/(C2m + 4*C1m)); 
  wc_m  = 1/(2*m*sqrt(Lm*C1m));
  fc_m  = wc_m/(2*pi);
  w_inf = 1/sqrt(Lm * C2m);
  f_inf = w_inf/(2*pi);  
  w_in2 = wc_m * sqrt(1-m^2); 
  m2    = sqrt(1 - (w_inf/wc_m)^2);
    
  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-ALTOS m-Derivado\n');
  fprintf('\t 2*C1m = %f[uF]\n',C1m_2/1e-6);
%  fprintf('\t   C1m = %f[uF]\n',C1m/1e-6);
  fprintf('\t   C2m = %f[uF]\n',C2m_2/1e-6);  
  fprintf('\t   Lm  = %f[mH]\n',Lm_2/1e-3);  
  fprintf('\t PULSACION DE CORTE (wc) = %f[rad/seg]\n', wc_m);
  fprintf('\t FRECUENCIA DE CORTE (fc) = %f[Hertz]\n', fc_m);
  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', Ro_m);
  fprintf('\t VALOR DE m = %3.8f\n', m);
  fprintf('\t PULSACION DE ATENUACION INFINITA (w_inf) = %f[rad/seg]\n', w_inf);
  fprintf('\t FRECUENCIA DE ATENUACION INFINITA (f_inf) = %f[Hertz]\n', f_inf);

##
##  Ck_2 = C1m_2*m;
##  Ck   = Ck_2/2;
##  Lk    = Lm*m;
##  Ro_k  = sqrt(Lk/Ck);
##  
##  wc_k = 1/(2*sqrt(Lk*Ck));
##  fc_k = wc_k/(2*pi);
##
##  fprintf('\n');
##  fprintf('\t Tipo de filtro = PASA-ALTOS Kcte\n');
##  fprintf('\t 2*C = %f[uF]\n',Ck_2/1e-6);
##  fprintf('\t   C = %f[uF]\n',Ck/1e-6);
##  fprintf('\t   L = %f[mH]\n',Lk/1e-3);  
##  fprintf('\t PULSACION DE CORTE (wc) = %f[rad/seg]\n', wc_k);
##  fprintf('\t FRECUENCIA DE CORTE (fc) = %f[Hertz]\n', fc_k);
##  fprintf('\t VALOR DE LA IMPEDANCIA CARACTERISTICA (Zo) = %f\n', Ro_k);
##  
 endif
