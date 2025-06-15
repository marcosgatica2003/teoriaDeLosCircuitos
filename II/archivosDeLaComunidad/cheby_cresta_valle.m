format long e
echo off
clc;
fprintf('                  GRAFICACIÓN DEL RIPPLE EN APROXIMACIÓN DE CHEBYSHEV\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');

w=linspace(-1,1,1000);
F1=figure(1);
set(F1,'color','w');
CH_1=w;
CH_2=(2*w.^2-1);
CH_3=(4*w.^3-3*w);
CH_4=(8*w.^4-8*w.^2+1);
CH_5=(16*w.^5-20*w.^3+5*w);
P1=plot(w,CH_1,'r',w,CH_2,'b',w,CH_3,'g',w,CH_4,'y',w,CH_5,'m');
set(P1,'linestyle','-','linewidth',2);   
legend('C_N_1','C_N_2','C_N_3','C_N_4','C_N_5')
hold on;
 grid on;
 
 
 
   