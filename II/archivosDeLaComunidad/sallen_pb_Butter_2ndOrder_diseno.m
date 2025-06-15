clear; clc;
format long g

imshow('Sallen_PB.png')
R1    = input('Ingrese R1[Ohms] = ');
R2    = input('Ingrese R2[Ohms] = ');
Ao    = input('Ingrese la ganancia Ao  = ');
A_max = input('Ingrese atenuacion maxima (Amax) en [dB] = ');
fp    = input('Ingrese frecuencia de corte fp [Hz] = ');

##R1 = 12000;  
##R2 = 12000;  
##Ao = 6;
##A_max = 3.0103; %[dB]
##fp = 5500;

n = 2;
wp = 2*pi*fp;

## Calculo de wp
epsilon = sqrt(10^(0.1*A_max)-1);
proporcion = epsilon^(1/n);
wc_Amax = wp * proporcion;

## Calculo de Ra y Rb
% Ao = (Ra + Rb)/Ra;
Ra = R1;
Rb = (Ao*Ra) - Ra;

## Para Butter de 2do Orden
a1 = sqrt(2);
b1 = 1;

## Calculo de factor de merito Qp
Qp = (sqrt(b1)/a1);

## Calculo de C1
A = -(1-Ao)*(wp^2)*R1;
B = wp/Qp;
C = -(R1+R2)/(R1*R2);

C1 = roots([A B C]);
C1 = C1(C1>0);

## Calculo C2
C2 = 1/(R1*R2*C1*(wp^2));

fprintf('\n');
fprintf('Valor de la pulsacion  de corte wp = %f[rad/seg]\n', wc_Amax);
fprintf('Valor del factor de merito Qp del circuito = %f[Adim]\n', Qp)
fprintf('Valor del factor epsilon = %f[Adim]\n', epsilon);
fprintf('Valor del capacitor C1 en [nF]  = %f\n', C1*1e9);
fprintf('Valor del capacitor C2 en [nF]  = %f\n', C2*1e9);
fprintf('Valor del capacitor Ra en [Ohm] = %f\n', Ra);
fprintf('Valor del capacitor Rb en [Ohm] = %f\n', Rb);

