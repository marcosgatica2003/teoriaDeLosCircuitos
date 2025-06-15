format long e
echo off
clc;

fprintf('\n\n\n\n');
fprintf('                  CALCULO DE CUADRIPOLO ATENUADOR TIPO "L" \n');
fprintf('\n\n');


ZOUT=input('Valor de ZOUT [Ohms] ? ');
Ein=input('\n Tensi?n de Entrada Ein en [Voltios] ? ');
Eout=input('\n Tensi?n de Salida Eout en [Voltios] ? ');

Relacion_Ein_Eout = Ein/Eout;
ALFA=log(Relacion_Ein_Eout);


fprintf(' \n');
fprintf('\n\n');
fprintf('       |-------|        \n');
fprintf('O------|  Z1   |--------------x----------O\n');
fprintf('       |-------|              |            \n');
fprintf('                          |---|---|         \n');
fprintf('                          |       |         \n');
fprintf('                          |   Z2  |         \n');
fprintf('                          |       |         \n');
fprintf('                          |---|---|         \n');
fprintf('                              |           \n');
fprintf('O-----------------------------x----------O\n\n');

fprintf(' \n');
fprintf('Relacion Ein/Eout  = %8.4f  [Adim]\n\n',Relacion_Ein_Eout);
fprintf('ALFA=log( Ein / Eout )  = %8.4f [Neppers]\n\n',ALFA);
Z1 = ZOUT*(1-1/Relacion_Ein_Eout);
Z2 = ZOUT*(1/(Relacion_Ein_Eout-1));
Z3=0;
fprintf('Z1 = ZOUT*(1-1/Relacion_Ein/Eout) = %8.4f [Ohms]\n',Z1);
fprintf('Z2 = ZOUT*(1/(Relacion_Ein/Eout-1)) = %8.4f [Ohms]\n',Z2);


Z11 = Z1+Z2;
Z12 = Z2;
Z22 = Z2;


AZ=(Z11.*Z22)-(Z12.^2);

% Calculo de los par?metros de Transmisi?n Directa
A=Z11/Z12;
B=AZ/Z12;
C=1/Z12;
D=Z22/Z12;

%C?lculo de la impedancia Iterativa de salida ZK2

ZK2=(-(D-A)/(2*C))+sqrt(((D-A)/(2*C))^2+(B/C));

%C?lculo de la funci?n de Propagaci?n en Base Iterativa
Fun_Prop_It= ((A+D)/2)+sqrt(((A+D)/2)^2-1);

fprintf('\n');

format long g;
fprintf('  PARAMETROS IMPEDANCIA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^ \n');
z11=num2str(Z11);
fprintf('\n Z11 = Z1 + Z2 = %s [Ohms]',z11);

z12=num2str(Z12);
fprintf('\n Z12 = Z21 = Z2 = %s [Ohms]',z12);

z22=num2str(Z22);
fprintf('\n Z22 = Z2 + Z3 = %s [Ohms]',z22);

Az=num2str(AZ);
fprintf('\n AZ = Z11*Z22-Z12*Z21 = %s [Ohms^2]',Az);

fprintf('\n\n');
fprintf('  PARAMETROS TRANSMISION DIRECTA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
a=num2str(A);
fprintf('\n A = Z11/Z21 = %s [Adim]',a);

b=num2str(B);
fprintf('\n B = AZ/Z21 = %s [Ohms^2]',b);

c=num2str(C);
fprintf('\n C = 1/Z21 = %s [Mho]',c);

d=num2str(D);
fprintf('\n D = Z22/Z21 = %s [Adim]',d);

fprintf('\n');
fprintf('\n');

fprintf('  CALCULO DE LA IMPEDANCIA ITERATIVA DE SALIDA \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');

zK2=num2str(ZK2);
fprintf('\n ZK2 = (-(D-A)/(2*C))+sqrt(((D-A)/(2*C))^2+(B/C)) = %s [Ohms]',zK2);
fprintf('\n\n');


fprintf(' CALCULO DE LA FUNCION DE PROPAGACI?N EN BASE ITERATIVA \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fun_Prop_ZIt=num2str(Fun_Prop_It);
fprintf('\n Fun_Prop_ZIt = ((A+D)/2)+sqrt(((A+D)/2)^2-1) \n')
fprintf('\n Fun_Prop_ZIt = %s [Adim]',fun_Prop_ZIt);
fprintf('\n\n');

% Comprobacion haciendo Funcion de Propagacion = Ein / Eout
fprintf(' COMPROBACION DE LA FUNCION DE PROPAGACI?N EN BASE ITERATIVA \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fprintf(' Fun_Prop_Zit_COMP = Ein/Eout \n');
Ein=Z1+(Z2*(Z3+ZK2)/(Z2+Z3+ZK2));
Eout=(Z2*(Z3+ZK2)/(Z2+Z3+ZK2))*ZK2/(Z3+ZK2);
Fun_Prop_Zit_COMP=Ein/Eout;

fun_Prop_Zit=num2str(Fun_Prop_Zit_COMP);
fprintf('\n Fun_Prop_Zit_COMP = Z1+(Z2*(Z3+ZK2)/(Z2+Z3+ZK2))/(Z2*(Z3+ZK2)/(Z2+Z3+ZK2))*ZK2/(Z3+ZK2)\n' );
fprintf('\n Fun_Prop_Zit_COMP = %s [Adim]',fun_Prop_Zit);
fprintf('\n\n');
