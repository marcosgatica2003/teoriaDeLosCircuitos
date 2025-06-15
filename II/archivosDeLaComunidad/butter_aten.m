% PROGRAMA "butter_aten.m" genera curvas de atenuaci�n de polinomios 
% de Butterwort desde grado 1 a 10 con Amax 3 dB � Epsilon=1
format long e
echo off
clc;
fprintf('                  GRAFICACI�N DEC CURVAS DE ATENUACION DE POLINOMIOS DE BUTTERWORTH\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');
w=linspace(0.1,10,1000);    	% Genero 1000 valores para la pulsaci�n w

F1=figure(1);
   set(F1,'color',[1,1,1],'NAME','ATENUACI�N NORMALIZADA DE FILTRO PASABAJOS DE BUTTERWORTH CON Amax = 3dB � Epsilon=1');
   clf;

   
for n=1: 10        			% Genero 10 valores de n (grado del polinomio)
   h=(1+(Epsilon.^2*w.^(2*n))).^0.5;       % Calculo del valor de la atenuaci�n
hlog=20*log10(h);				% Atenuaci�n en forma logaritmica
 
 semilogx(w,hlog,'b');
 
 leyenda=20*log10((1+(9.^(2*n))).^0.5);
 
 L_tx=num2str(n);
  L_tx=strcat('n = ',L_tx);
  LEY= text(8,leyenda,L_tx);
  set(LEY,'color','k','BackgroundColor',[0.792,0.976,0.976],'FontSize',12,'FontWeight','bold');
 
  
 % Graficaci�n de atenuaci�n en funci�n de w
   hold on;					% Mantengo el grafico anterior
     
      end  						% Temina cuando n=10
      
      T1=title('ATENUACI�N NORMALIZADA DE FILTRO PASABAJOS DE BUTTERWORTH CON  Amax = 3dB � Epsilon=1');
      set(T1,'color','k','BackgroundColor',[0.956,0.976,0.784],'FontSize',12,'FontWeight','bold');
      
      hold off; 				% Desactivo sobegraficaci�n
      grid on;					% Grilla visible
      zoom on;					% Activo zoom
     
 fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a jgarciaabad@iua.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');