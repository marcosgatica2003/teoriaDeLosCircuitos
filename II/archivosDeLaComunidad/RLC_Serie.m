#!/usr/bin/octave
pkg load symbolic

clc;
clear;
warning('off', 'all');

syms P real

num = input('Ingrese el valor del numerador= ');
den = input('Ingrese el valor del denominador= ');

%num = [4000];
%den = [2.5 4250 45156250];

num_P = poly2sym(num, P);
den_P = poly2sym(den, P);

z_P = vpa(num_P / den_P, 15)


if num > 0
X = den(1); Y = den(2); Z = den(3);
	#Normalizamos si es necesario
	if X > 1
		num = num/den(1);
		X = X/den(1);
		Y = Y/den(1);
		Z = Z/den(1);
	endif
endif



#Ingreso valor dato, en caso que no exista ingresar 0.
L = input('Ingrese el valor del inductor = ');
R = input('Ingrese el valor de la resistencia = ');
C = input('Ingrese el valor del capacitor = ');
E = input('Ingrese el valor de la fuente = ');

#Dato L
if (L>0) && (R == 0) && (C == 0)
  R = Y * L;
  C = 1/(L*Z);
  E = num * L;
endif

#Dato C
  if (C>0) && (L == 0) && (R == 0)
    L = 1/(C*Z);
    R = Y*L;
    E = num*L;400
  endif

#Dato R
  if (R>0) && (L == 0) && (C == 0)
  L = R/Y;
  C = 1/(L*Z);
  E = num*L;

  endif

#Pulsacion Natural
 W_0 = 1/sqrt(L*C); 


#Resistencia Critica
  Rc = 2 * sqrt(L/C);

#Calculo de zita
  zita = R/Rc;

#Raices y Comportamiento
  if zita == 1
    raices = "REALES E IGUALES";
    comportamiento = "AMORTIGUAMIENTO CRITICO";
  endif

  if zita < 1
    raices = "COMPLEJAS CONJUGADAS";
    comportamiento = "SUB-AMORTIGUADO";
  endif

  if zita > 1
    raices = "REALES Y DISTINTAS";
    comportamiento = "SOBRE-AMORTIGUADO";
  endif

  if zita == 0
    raices = "IMAGINARIAS PURAS";
    comportamiento = "OSCILATORIO";
  endif


printf('\n');
printf('\tEl valor de la pulsacion natural w0 es %f [rad/seg]\n', W_0);
printf('\tEl valor del factor de amortiguamiento zita es %f \n', zita);
printf('\tEl valor del inductor "L" es de %f [mH]\n', L/1e-3);
printf('\tEl valor del resistor "R" es de %f [Ohm]\n', R);
printf('\tEl valor del capacitor "C" es de %f [uF]\n', C/1e-6);
printf('\tEl valor de la Resistencia Critica "Rc" es de %f [Ohm]\n', Rc);
printf('\tEl valor de la Tension de la fuente "E" es de %f [Voltios]\n', E);
printf('\tLas raices de la ecuacion caracteristica seran %s\n', raices);
printf('\tEl comportamiento del circuito es %s\n', comportamiento);



