clear;
clc;

pkg load symbolic

clc;
clear;
warning('off', 'all');

syms S real

num = input('Ingrese el valor del numerador= ');
den = input('Ingrese el valor del denominador= ');

##num = [1.288872e-7 0 510];
##den = [1.288872e-7 1.62e-3 510];

num_S = poly2sym(num, S);
den_S = poly2sym(den, S);

z_P = vpa(num_S / den_S, 10)

R = input('Ingrese el valor de la impedancia de carga = ');
##R = 510;
[n_row_num, n_col_num] = size(num);

if (!isempty(num))
Z = den(3); Y = den(2); X = den(1);
	#Normalizamos si es necesario
	if ((X > 0) && X != 1)
		num = num/den(1);
		X = X/den(1);
		Y = Y/den(1);
		Z = Z/den(1);
	endif
  if (n_col_num == 3)
    z = num(3); y = num(2); x = num(1);
  elseif (n_col_num == 2)
    y = num(2); x = num(1);
  elseif (n_col_num == 1)
    x = num(1);
  endif
endif

  C = 1/(R*Y);
  L = 1/(Z*C); 
  wc = sqrt(Z);
  fc = wc/(2*pi);
  Qo = sqrt(C/L) * R;

if (n_col_num == 1)
  %Filtro Pasivo pasa bajos
  categoria = 'pb'
  tipo ='PASA BAJOS';
elseif (n_col_num == 2)
  %Filtro Pasivo pasa banda
  categoria = 'PB';
  tipo ='PASA BANDA';
elseif (n_col_num == 3)
  if(z == 0)
  %Filtro Pasivo pasa altos
    categoria = 'pa'
    tipo ='PASA ALTOS';
    elseif(z != 0)
  %Filtro Pasivo pasa altos
    categoria = 'EB'
    tipo ='ELIMINA BANDA';

  endif
endif  

fprintf('\n');
fprintf('Tipo de filtro = %s\n', tipo);

if (categoria == 'pb')
  fprintf('Pulsacion de corte  (wc) = %f [rad/seg]\n', wc);
  fprintf('Frecuencia de corte (fc) = %f [Hz]\n', fc);
  fprintf('Valor del factor de merito (Qo) = %f[Adim]\n', Qo);
  fprintf('Tipo de impedancia "Z1" = L\n');
  fprintf('Valor de la impedancia "Z1" = %f[mH]\n', L/1e-3);
  fprintf('Tipo de impedancia "Z2" = C\n');
  fprintf('Valor de la impedancia "Z2" = %f[uF]\n', C/1e-6);
  fprintf('Tipo de impedancia "Z3" = R\n');
  fprintf('Valor de la impedancia "Z3" = %f[Ohm]\n', R);
elseif (categoria == 'pa')
  fprintf('Pulsacion de corte  (wc) = %f [rad/seg]\n', wc);
  fprintf('Frecuencia de corte (fc) = %f [Hz]\n', fc);
  fprintf('Valor del factor de merito (Qo) = %f[Adim]\n', Qo);
  fprintf('Tipo de impedancia "Z1" = C\n');
  fprintf('Valor de la impedancia "Z1" = %f[nF]\n', C/1e-9);  
  fprintf('Tipo de impedancia "Z2" = L\n');
  fprintf('Valor de la impedancia "Z2" = %f[mH]\n', L/1e-3);
  fprintf('Tipo de impedancia "Z3" = R\n');
  fprintf('Valor de la impedancia "Z3" = %f[Ohm]\n', R);
elseif (categoria == 'PB')
  fprintf('Pulsacion central  (wo) = %f [rad/seg]\n', wc);
  fprintf('Frecuencia central (fo) = %f [Hz]\n', fc);
  fprintf('Valor del factor de merito (Qo) = %f[Adim]\n', Qo);  
  fprintf('Tipo de impedancia "Z1" = R\n');
  fprintf('Valor de la impedancia "Z1" = %f[Ohm]\n', R);  
  fprintf('Tipo de impedancia "Z2" = L\n');
  fprintf('Valor de la impedancia "Z2" = %f[mH]\n', L/1e-3);
  fprintf('Tipo de impedancia "Z3" = C\n');
  fprintf('Valor de la impedancia "Z3" = %f[nF]\n', C/1e-9);
elseif (categoria == 'EB') 
  fprintf('Pulsacion central  (wo) = %f [rad/seg]\n', wc);
  fprintf('Frecuencia central (fo) = %f [Hz]\n', fc);
  fprintf('Valor del factor de merito (Qo) = %f[Adim]\n', Qo);    
  fprintf('Tipo de impedancia "Z1" = L\n');
  fprintf('Valor de la impedancia "Z1" = %f[mH]\n', L/1e-3);
  fprintf('Tipo de impedancia "Z2" = C\n');
  fprintf('Valor de la impedancia "Z2" = %f[nF]\n', C/1e-9);
  fprintf('Tipo de impedancia "Z3" = R\n');
  fprintf('Valor de la impedancia "Z3" = %f[Ohm]\n', R); 
endif



#link de interes:
#https://wilaebaelectronica.blogspot.com/2017/01/filtro-pasa-bajos-pasivo-de-2do-orden-rlc.html
#https://wilaebaelectronica.blogspot.com/2017/01/filtro-pasa-altos-pasivo-de-2do-orden-rlc.html
#https://wilaebaelectronica.blogspot.com/2017/01/filtro-pasa-banda-pasivo-de-2do-orden-RLC.html
#https://wilaebaelectronica.blogspot.com/2017/01/filtro-rechaza-banda-pasivo-de-2do-orden-rlc.html
#https://repositorio.innovacionumh.es/Proyectos/P_19/Tema_5/UMH_05.htm

