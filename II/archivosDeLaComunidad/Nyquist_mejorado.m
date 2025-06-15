#!/usr/bin/octave
pkg load symbolic
pkg load control

clear;
clc;
warning('off', 'all');

syms P w real

fprintf('Ingerse los polinimios como vectores: \n');
NUM = input('Numerador = ');
DEN = input('Denominador = ');

##NUM = [15 -30];    
##DEN = [1 6 10 0];


###Grafico de Nyquist
##z = tf(NUM,DEN);
##nyquist(z)

fprintf('\n');
num = poly2sym(NUM, P);
den = poly2sym(DEN, P);

z = num/den;
expand(z)

z_jw = subs(z, P, i*w);

re = real(z_jw);
disp('REAL')
expand(re)
im = imag(z_jw);
disp('IMG')
expand(im)

[n_real, d_real] = numden(simplify(re));
[n_img,  d_img]  = numden(simplify(im)); 

n_root_real = roots(sym2poly(n_real));
n_root_img  = roots(sym2poly(n_img));

if(isreal(n_root_img))
  w_root_real = double(solve(im == 0));
  w_root_real = w_root_real(w_root_real > 0);
  root_real = double(subs(re, w, w_root_real));
else
  w_root_real = 0;
endif

if(isreal(n_root_real))
  w_root_imag = double(solve(re == 0));
  w_root_imag = w_root_imag(w_root_imag > 0);
  root_imag = double(subs(im, w, w_root_imag));
else
  w_root_imag = 0;
endif



#SALIDA
fprintf('\n');
fprintf('Existe corte al eje Real? = ');
if w_root_real > 0
  fprintf('SI\n');
  fprintf('Valor positivo de la pulsación de corte = %f\n', w_root_real);
  fprintf('Valor de corte en el eje real = %f\n', root_real);
else
  fprintf('NO\n');
endif

fprintf('\n');
fprintf('Existe corte al eje Imaginario? = ');
if w_root_imag > 0
  fprintf('SI\n');
  fprintf('Valor positivo de la pulsación de corte = %f\n', w_root_imag);
  fprintf('Valor de corte en el eje imaginario = %f\n', root_imag);
else
  fprintf('NO\n');
endif


fprintf('\n\n');
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