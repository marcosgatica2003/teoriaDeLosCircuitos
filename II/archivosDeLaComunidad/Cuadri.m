format long e
echo off
clc;
fprintf('\n\n\n\n');
fprintf('          CALCULO DE PARAMETROS DE CUADRIPOLOS');
fprintf('\n\n');
fprintf('              |------|        |------|\n');
fprintf('       0------|  Z1  |----|---|  Z3  |------0\n');
fprintf('              |------|    |   |------|\n');
fprintf('                        |-|-|         \n');
fprintf('                        |   |         \n');
fprintf('                        | Z2|         \n');
fprintf('                        |   |         \n');
fprintf('                        |-|-|         \n');
fprintf('                          |           \n');
fprintf('       O------------------|-----------------O\n\n');
Z1=input('  Valor de Z1 ?');
Z2=input('  Valor de Z2 ?');
Z3=input('  Valor de Z3 ?');

Z11= Z1+Z2;
Z12=Z2;
Z22=Z2+Z3;

AZ=(Z11.*Z22)-(Z12.^2);

% Calculo de los parámetros de Transmisión Directa
A=Z11/Z12;
B=AZ/Z12;
C=1/Z12;
D=Z22/Z12;

if(A~=D) 
%**************************************************************
% En este caso el cuadripolo no es simetrico 
%**************************************************************

%Cálculo de las impedancias Iterativas
ZK1=(-(A-D)/(2*C))+sqrt(((A-D)/(2*C))^2+(B/C));
ZK2=(-(D-A)/(2*C))+sqrt(((D-A)/(2*C))^2+(B/C));

%Cálculo de las Impedancias Imágenes
ZIM1=sqrt((A*B)/(C*D));
ZIM2=sqrt((B*D)/(A*C));

%Cálculo de la función de Propagación en Base Iterativa
Fun_Prop_It= ((A+D)/2)+sqrt(((A+D)/2)^2-1);

%Cálculo de la función de Propagación en Base Imagen
Fun_Prop_Im= sqrt(A/D)*(sqrt(A*D)+sqrt((A*D)-1));

fprintf('\n');

format long g;
fprintf('  PARAMETROS IMPEDANCIA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^ \n');
z11=num2srt(Z11);
fprintf('\n Z11 = %s',z11);

z12=NUM2STR(Z12);
fprintf('\n Z12 = %s',z12);

z22=NUM2STR(Z22);
fprintf('\n Z22 = %s',z22);

Az=NUM2STR(AZ);
fprintf('\n AZ = %s',Az);

fprintf('\n\n');
fprintf('  PARAMETROS TRANSMISION DIRECTA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
a=NUM2STR(A);
fprintf('\n A = %s',a);

b=NUM2STR(B);
fprintf('\n B = %s',b);

c=NUM2STR(C);
fprintf('\n C = %s',c);

d=NUM2STR(D);
fprintf('\n D = %s',d);

fprintf('\n');
fprintf('\n');

fprintf('  CALCULO DE LA IMPEDANCIA ITERATIVA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
zK1=NUM2STR(ZK1);
fprintf('\n ZK1 = %s',zK1);

zK2=NUM2STR(ZK2);
fprintf('\n ZK2 = %s',zK2);
fprintf('\n\n');

fprintf('  CALCULO DE LA IMPEDANCIA IMAGEN \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
zIM1=NUM2STR(ZIM1);
fprintf('\n ZIM1 = %s',zIM1);

zIM2=NUM2STR(ZIM2);
fprintf('\n ZIM2 = %s',zIM2);
fprintf('\n\n');

fprintf(' CALCULO DE LA FUNCION DE PROPAGACIÓN EN BASE ITERATIVA \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fun_Prop_It=NUM2STR(Fun_Prop_It);
fprintf('\n Fun_Prop_ZIt= %s',fun_Prop_It);
fprintf('\n\n');

fprintf(' CALCULO DE LA FUNCION DE PROPAGACIÓN EN BASE IMAGEN \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fun_Prop_Im=NUM2STR(Fun_Prop_Im);
fprintf('\n Fun_Prop_ZIm= %s',fun_Prop_Im);
fprintf('\n\n ');

% Comprobacion haciendo Funcion de Propagacion = Ein / Eout
fprintf('\n\n');
fprintf(' COMPROBACION DE LA FUNCION DE PROPAGACIÓN EN BASE ITERATIVA \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fprintf(' Fun_Prop_Zit_COMP=Ein/Eout \n');
Ein=Z1+(Z2*(Z3+ZK2)/(Z2+Z3+ZK2));
Eout=(Z2*(Z3+ZK2)/(Z2+Z3+ZK2))*ZK2/(Z3+ZK2);
Fun_Prop_Zit_COMP=Ein/Eout;

fun_Prop_Zit=NUM2STR(Fun_Prop_Zit_COMP);
fprintf('\n Fun_Prop_Zit_COMP= %s',fun_Prop_Zit);
fprintf('\n\n');

fprintf(' COMPROBACION DE LA FUNCION DE PROPAGACIÓN EN BASE IMAGEN \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fprintf(' Fun_Prop_Zim_COMP=Ein/Eout \n');
Ein=Z1+(Z2*(Z3+ZIM2)/(Z2+Z3+ZIM2));
Eout=(Z2*(Z3+ZIM2)/(Z2+Z3+ZIM2))*ZIM2/(Z3+ZIM2);
Fun_Prop_Zim_COMP=Ein/Eout;
fun_Prop_Zim=NUM2STR(Fun_Prop_Zim_COMP);
fprintf('\n Fun_Prop_Zim_COMP= %s',fun_Prop_Zim);
fprintf('\n\n ');

else fprintf('\n   CUADRIPOLO SIMETRICO  \n');
%**************************************************************
% En este caso el cuadripolo es simetrico 
%**************************************************************
%Cálculo de la impedancias Caracteristica
Zo=sqrt((B/C));

%Cálculo de la función de Propagación en Base Caracteristica
Fun_Prop_Zo= (A)+sqrt(A^2-1);


fprintf('\n');
format long g;
fprintf('  PARAMETROS IMPEDANCIA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^ \n');
z11=NUM2STR(Z11);
fprintf('\n Z11 = %s',z11);

z12=NUM2STR(Z12);
fprintf('\n Z12 = %s',z12);

z22=NUM2STR(Z22);
fprintf('\n Z22 = %s',z22);

Az=NUM2STR(AZ);
fprintf('\n AZ = %s',Az);

fprintf('\n\n');
fprintf('  PARAMETROS TRANSMISION DIRECTA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
a=NUM2STR(A);
fprintf('\n A = %s',a);

b=NUM2STR(B);
fprintf('\n B = %s',b);

c=NUM2STR(C);
fprintf('\n C = %s',c);

d=NUM2STR(D);
fprintf('\n D = %s',d);

fprintf('\n\n');


fprintf('  CALCULO DE LA IMPEDANCIA CARACTERISTICA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
zo=NUM2STR(Zo);
fprintf('\n Zo = %s',zo);
fprintf('\n\n');

fprintf(' CALCULO DE LA FUNCION DE PROPAGACIÓN EN BASE CARACTERISTICA \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fun_Prop_Zo=NUM2STR(Fun_Prop_Zo);
fprintf('\n Fun_Prop_Zo= %s',fun_Prop_Zo);
fprintf('\n\n');

fprintf(' COMPROBACION DE LA FUNCION DE PROPAGACIÓN EN BASE CARACTERISTICA \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fprintf(' Fun_Prop_Zo_COMP=Ein/Eout \n');
Ein=Z1+(Z2*(Z3+Zo)/(Z2+Z3+Zo));
Eout=(Z2*(Z3+Zo)/(Z2+Z3+Zo))*Zo/(Z3+Zo);
Fun_Prop_Zo_COMP=Ein/Eout;
fun_Prop_Zo_COMP=NUM2STR(Fun_Prop_Zo_COMP);
fprintf('\n Fun_Prop_Zo_COMP= %s',fun_Prop_Zo_COMP);
fprintf('\n\n ');
end

