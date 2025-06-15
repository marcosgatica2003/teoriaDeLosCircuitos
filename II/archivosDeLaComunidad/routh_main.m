#!/usr/bin/octave
pkg load symbolic
pkg load control

clear;
clc;
warning('off', 'all');

syms P real

fprintf('Ingerse los polinimios como vectores: \n');
NUM = input('Numerador = ');
DEN = input('Denominador = ');

fprintf('\n');
num = poly2sym(NUM, P);
den = poly2sym(DEN, P);

z = num/den;
simplify(z)

##NUM = [15 400];
##DEN = [6 -36 64 64 5 0];

lazo = input('Ingrese el criterio de Nyquist al "origen" (0) o "cerrado" (1) = '); 

if(lazo == 0)
  ## Nyquist Al ORIGEN
  num = poly2sym(NUM, P);
  den = poly2sym(DEN, P);

  num_routh = num;
  den_routh = den;
  
  fprintf('\n');  
  fprintf('\t ######## Numerador ######\n');
  fprintf('\t')
  disp(num_routh)
  fprintf('\n');  
  Z = routhhur(sym2poly(num_routh));

  fprintf('\n\n');
  fprintf('\t ###### Denominador ######\n');
  disp(den_routh)
  fprintf('\n');    
  P = routhhur(sym2poly(den_routh));

  N = Z - P;
  
  fprintf('\n');    
  fprintf('\t --> Rodeos al origen = %d \n', N);
  
  if(N<0)
    fprintf('\t --> SISTEMA INESTABLE\n');
  else
    fprintf('\t --> NO SE SABE POR NYQUIST\n');
  endif

elseif(lazo == 1)
  ## Nyquist a -1 + j0;
  num = poly2sym(NUM, P);
  den = poly2sym(DEN, P);

  num_routh = sum([num den]);
  den_routh = den;
  
  fprintf('\n');  
  fprintf('\t ######## Numerador ######\n');
  fprintf('\t')
  disp(num_routh)
  fprintf('\n');  
  Z = routhhur(sym2poly(num_routh));

  fprintf('\n\n');
  fprintf('\t ###### Denominador ######\n');
  disp(den_routh)
  fprintf('\n');    
  P = routhhur(sym2poly(den_routh));

  N = Z - P;
  
  fprintf('\n');  
  fprintf('\t --> Rodeos a -1 + j0 = %d \n', N);
  
  if(N>0)
    fprintf('\t --> SISTEMA INESTABLE\n');
  else
    fprintf('\t --> NO SE SABE POR NYQUIST\n');
  endif
  
endif