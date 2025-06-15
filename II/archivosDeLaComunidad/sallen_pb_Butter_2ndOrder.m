clear; clc;
format long g

imshow('Sallen_PB.png')
##A_max = input('Ingrese atenuacion maxima (Amax) en [dB] = ');
##Ra    = input('Ingrese Ra[Ohms] = ');
##Rb    = input('Ingrese Rb[Ohms] = ');
##R1    = input('Ingrese R1[Ohms] = ');
##R2    = input('Ingrese R2[Ohms] = ');
##C1    = input('Ingrese C1[F]    = ');
##C2    = input('Ingrese C2[F]    = ');
##f     = input('Ingrese la frecuencia para la Atenuacion = ');
##w     = f*2*pi;


A_max = 0.1; %[dB]
Ra = 10e3;
Rb = 70e3;
R1 = 10e3;  
R2 = 10e3;  
C1 = 196.73032e-12; 
C2 = 1.0025950e-9; 
f = 200e3;
w = f*2*pi;

%Para Butter de 2do Orden
a1 = sqrt(2);
b1 = 1;
n = 2;

epsilon = sqrt(10^(0.1*A_max)-1);
proporcion = epsilon^(1/n);

wc_3dB = sqrt(b1/(R1*R2*C1*C2));
fc_3dB = wc_3dB/(2*pi) ;

wc_Amax = wc_3dB * proporcion;
fc_Amax = wc_Amax/(2*pi);

Ao = (Ra + Rb)/Ra;
Qp = (sqrt(b1)/a1);

At = 10*log10(1 + ((epsilon^2)*((w/wc_Amax)^(2*n))));

fprintf('Valor de la pulsacion  de corte wc = %f[rad/seg]\n', wc_Amax);
fprintf('Valor de la frecuencia de corte fc = %f[Hz]\n', fc_Amax);
fprintf('Valor del factor de merito Qp del circuito = %f[Adim]\n', Qp)
fprintf('Valor de la ganancia Ao = %f[Adim]\n', Ao);
fprintf('Valor de la atenuacion respecto a la banda de paso para f=%d[kHz] = -%2.2f[dB]\n',f/1e3, At);
