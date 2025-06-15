#!/usr/bin/octave
clc; clear;

#imshow('tipos_de_filtros.png');
fprintf('CONVERTIDOR DE K CONSTANTE A mDERIVADOS .. \n');
fprintf('Eliga el tipo de filtro k CONSTANTE .. \n');
fprintf('PASA-BAJOS[pb], PASA-ALTOS[pa], PASA-BANDA[PB] o ELIMINA-BANDA[EB]\n');
fprintf('\n');
tipo = input('Tipo de Filtro? [pb], [pa], [PB], [EB]  -->  ','s');

if(tipo == 'pb')
  ### PASA BAJOS
   fc = input('Valor de fc en [Hert] = ');
   fo = input('Valor de frecuencia infinita   en [Hertz] = ');
   L1_2= input('Valor de L/2 en [H] = ');
   C2 = input('Valor de C   en [F] = ');
  
  m = sqrt(1-(fc/fo)^2);
  L1m_2 = L1_2*m;
  C2_m = (C2*m);
  L2_m = 2*L1_2*((1-m^2)/(4*m));
  

  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BAJOS m derivados\n');
  fprintf('\t VALOR DE LA INDUCTANCIA L1/2 m (H) = %f[uH]\n', L1m_2/1e-6);
  fprintf('\t VALOR DEl CAPACITOR C2m = %f[nF]\n', C2_m/1e-9);
  fprintf('\t VALOR DE LA INDUCTANCIA L2/2 m = %f[uH]\n', L2_m/1e-6);
  fprintf('\t VALOR DE  m = %f\n',m);
  
  elseif(tipo == 'pa')
  ### PASA ALTOS
   fc = input('Valor de fc en [Hert] = ');
   fo = input('Valor de frecuencia infinita   en [Hertz] = ');
  
     C1_2= input('Valor de 2C kcte  en [F] = ');
     L= input('Valor de L kcte en [H] = ');
   
  m = sqrt(1-(fo/fc)^2);
  C1_m = C1_2/m;
  L2_m = (L/m);
  C_2_m = C1_2*(2*m/(1-(m)^2));               
  

  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BAJOS m derivados\n');
  
  fprintf('\t VALOR DEl CAPACITOR 2C1m = %f[uF]\n', C1_m/1e-6);
  fprintf('\t VALOR DE LA INDUCTANCIA L2 m = %f[uH]\n', L2_m/1e-3);
  fprintf('\t VALOR DEl CAPACITOR C2m = %f[nF]\n', C_2_m/1e-6);
  fprintf('\t VALOR DE  m = %f\n',m);
  
  
  elseif(tipo == 'PB')
  ### PASA BANDA HACER
    fc1 = input('Valor de fc1 en [Hert] = ');
    fc2 = input('Valor de fc2 en [Hert] = ');
    fco = input('Valor de frecuencia infinita   en [Hertz] = ');
  
    BW = (fc2-fc1)*2*pi;
    W1 = fc1*2*pi;
    W2 = fc2*2*pi;
    WO=  fco*2*pi;
    
    m = sqrt(1-((W2-W1)/((W2*WO/W2)-(W1/(WO/W2))))^2);
    
     
     
    L1_2= input('Valor de L1/2 en [H] = ');
    C_2 = input('Valor de 2C1  en [F] = ');
    L2= input('Valor de L2 en [H] = ');
    C_22 = input('Valor de C2  en [F] = ');
   
   
  Lm=L1_2*m;
  C_m = C_2/m;
  L2_m = (L2/m);
  C_2_m = C_22*m;
  L3 = L1_2*((1-m^2)/(2*m));
  C3 = C_2*((2*m)/(1-m^2));
    
  

  fprintf('\n');
  fprintf('\t Tipo de filtro = PASA-BANDA m derivados\n');
  fprintf('\t VALOR DE LA INDUCTANCIA Lm = %f[mH]\n', Lm/1e-3);
  fprintf('\t VALOR DEl CAPACITOR Cm = %f[nF]\n', C_m/1e-9);
  fprintf('\t VALOR DE LA INDUCTANCIA L2m = %f[mH]\n', L2_m /1e-3);
  fprintf('\t VALOR DEl CAPACITOR C2m = %f[nF]\n', C_2_m/1e-9);
  fprintf('\t VALOR DE LA INDUCTANCIA L3 = %f[mH]\n', L3/1e-3);
  fprintf('\t VALOR DEl CAPACITOR C3 = %f[nF]\n', C3/1e-9);
  
  fprintf('\t VALOR DE  m = %f\n',m);
  
  
  
  elseif(tipo == 'EB')
  ### ELIMINA BANDA 
    fc1 = input('Valor de fc1 en [Hert] = ');
    fc2 = input('Valor de fc2 en [Hert] = ');
    fco = input('Valor de frecuencia infinita   en [Hertz] = ');
  
    
    W1 = fc1*2*pi;
    W2 = fc2*2*pi;
    WO=  fco*2*pi;
    BW = (W2-W1);
    m = sqrt(1-((WO-(W1/(WO/W2)))/(W2-W1))^2)
    
     
    C_2 = input('Valor de 2C1  en [F] = ');
    L1= input('Valor de L1/2 en [H] = ');
    L2= input('Valor de L2 en [H] = ');
    C_22 = input('Valor de C2  en [F] = ');
    
   
   
  
  C_2m = C_2/m; 
  Lm = L1*m;
  L2m = L2/m;
  C2m = C_22*m;
  
  L3 = L1*((1-(m)^2)/(2*m));
  C3 = C_2 *((2*m)/(1-m^2));
    
  

  fprintf('\n');
  fprintf('\t Tipo de filtro = ELIMINA BANDA m derivados\n');
 
  fprintf('\t VALOR DEl CAPACITOR 2Cm = %f[nF]\n', C_2m/1e-9);
  fprintf('\t VALOR DE LA INDUCTANCIA L1/2 m = %f[mH]\n', Lm /1e-3);
  fprintf('\t VALOR DE LA INDUCTANCIA L2m m = %f[mH]\n', L2m/1e-3);
  fprintf('\t VALOR DEl CAPACITOR C2m = %f[nF]\n', C2m/1e-9);
  fprintf('\t VALOR DE LA INDUCTANCIA L3 = %f[mH]\n', L3/1e-3);
  fprintf('\t VALOR DEl CAPACITOR C3 = %f[nF]\n', C3/1e-9);
  
  fprintf('\t VALOR DE  m = %f\n',m);
  
endif