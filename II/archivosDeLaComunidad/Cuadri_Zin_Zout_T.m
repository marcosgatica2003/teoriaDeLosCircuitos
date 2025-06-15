format long e
echo off
clc;

fprintf('\n\n');
fprintf('   CALCULO DE CUADRIPOLOS TIPO "T", ADAPTADORES DE IMPEDANCIA');
fprintf('\n\n');
fprintf('       |--------|           |--------|\n');
fprintf('O------|   Z1   |-----x-----|   Z3   |------O\n');
fprintf('       |--------|     |     |--------|\n');
fprintf('                      |               \n');
fprintf('                  |---|---|         \n');
fprintf('                  |       |         \n');
fprintf('                  |   Z2  |         \n');
fprintf('                  |       |         \n');
fprintf('                  |---|---|         \n');
fprintf('                      |           \n');
fprintf('O---------------------x---------------------O\n\n');


ZIN=input(' Valor de ZIN [Ohms] : ');
ZOUT=input(' Valor de ZOUT [Ohms] : ');
if (ZIN>ZOUT)
TITA=acosh(sqrt(ZIN/ZOUT));
else
TITA=acosh(sqrt(ZOUT/ZIN));    
end
Fun_Prop_Tentativa=sqrt(ZIN/ZOUT)*exp(TITA);
fprintf('\n Recuerde que EIN/EOUT debe ser mayor que  %8.4f  \n',Fun_Prop_Tentativa);
ATEN=input(' Valor de EIN/EOUT : '); 

%ALFA=input('Valor de la atenuaci?n ALFA ? ');
%ALFA=(20*log10(ATEN))/8.685;
ALFA=log(ATEN*sqrt(ZOUT/ZIN));
fprintf(' \n');
fprintf('Atenuación ALFA = log((Ein/Eout)*sqrt(ZOUT/ZIN)) = %8.4f [Neppers]\n',ALFA);
Z1 = (ZIN*cosh(ALFA)-sqrt(ZIN*ZOUT))/sinh(ALFA);
Z2 = (sqrt(ZIN*ZOUT))/sinh(ALFA);
Z3 = (ZOUT*cosh(ALFA)-sqrt(ZIN*ZOUT))/sinh(ALFA);

fprintf(' \n');
fprintf('Z1 = (ZIN*cosh(ALFA)-sqrt(ZIN*ZOUT))/sinh(ALFA) = %8.4f [Ohms]\n',Z1);
fprintf('Z2 = (sqrt(ZIN*ZOUT))/sinh(ALFA) = %8.4f [Ohms]\n',Z2);
fprintf('Z3 = (ZOUT*cosh(ALFA)-sqrt(ZIN*ZOUT))/sinh(ALFA) = %8.4f [Ohms] \n',Z3);
Z11 = Z1+Z2;
Z12 = Z2;
Z22 = Z2+Z3;


AZ=(Z11.*Z22)-(Z12.^2);

% Calculo de los par?metros de Transmisi?n Directa
A=Z11/Z12;
B=AZ/Z12;
C=1/Z12;
D=Z22/Z12;


%C?lculo de las Impedancias Im?genes
ZIM1=sqrt((A*B)/(C*D));
ZIM2=sqrt((B*D)/(A*C));

%C?lculo de la funci?n de Propagaci?n en Base Imagen
Fun_Prop_Im= sqrt(A/D)*((sqrt(A*D))+sqrt((A*D)-1));
if (real(Fun_Prop_Im)<0)
Fun_Prop_Im= -sqrt(A/D)*((sqrt(A*D))+sqrt((A*D)-1));
end
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

fprintf('  CALCULO DE LA IMPEDANCIA IMAGEN \n');
fprintf('  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
zIM1=num2str(ZIM1);
fprintf('\n ZIM1 = Zin = sqrt((A*B)/(C*D)) = %s [Ohms]',zIM1);

zIM2=num2str(ZIM2);
fprintf('\n ZIM2 = Zout = sqrt((B*D)/(A*C)) = %s [Ohms]',zIM2);
fprintf('\n\n');

fprintf(' CALCULO DE LA FUNCION DE PROPAGACI?N EN BASE IMAGEN \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fun_Prop_Im=num2str(Fun_Prop_Im);
fprintf('\n Fun_Prop_Im= sqrt(A/D)*((sqrt(A*D))+sqrt((A*D)-1)) \n');
fprintf('\n Fun_Prop_ZIm= %s [Adim]',fun_Prop_Im);
fprintf('\n\n ');

% Comprobacion haciendo Funcion de Propagacion = Ein / Eout

fprintf(' COMPROBACION DE LA FUNCION DE PROPAGACI?N EN BASE IMAGEN \n');
fprintf(' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ \n');
fprintf(' Fun_Prop_Zim_COMP = Ein/Eout \n');
Ein=Z1+(Z2*(Z3+ZIM2)/(Z2+Z3+ZIM2));
Eout=(Z2*(Z3+ZIM2)/(Z2+Z3+ZIM2))*(ZIM2/(Z3+ZIM2));
Fun_Prop_Zim_COMP=Ein/Eout;
fun_Prop_Zim=num2str(Fun_Prop_Zim_COMP);
fprintf('\n Fun_Prop_Zim_COMP = (Z1+(Z2*(Z3+ZIM2)/(Z2+Z3+ZIM2)))/((Z2*(Z3+ZIM2)/(Z2+Z3+ZIM2))*(ZIM2/(Z3+ZIM2))) \n');
fprintf('\n Fun_Prop_Zim_COMP = %s [Adim]',fun_Prop_Zim);
fprintf('\n\n ');

