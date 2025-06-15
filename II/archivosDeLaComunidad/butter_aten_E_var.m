% PROGRAMA "butter_aten_E_var.m" genera curvas de atenuaci�n de polinomios 
% de Butterwort desde grado 1 a 10 con Amax 1, 2 Y 3 dB

w=linspace(0.1,10,1000);    	% Genero 1000 valores para la pulsaci�n w

F1=figure(1);
   set(F1,'color',[1,1,1],'NAME','ATENUACI�N NORMALIZADA DE FILTRO PASABAJOS DE BUTTERWORTH CON Amax 1, 2 Y 3 dB');
   clf;
for Ripple=1 : 3
   Epsilon=sqrt(10^(0.1*Ripple)-1);
   
for n=1: 10        			% Genero 10 valores de n (grado del polinomio)
   h=(1+(Epsilon.^2*w.^(2*n))).^0.5;       % Calculo del valor de la atenuaci�n
hlog=20*log10(h);				% Atenuaci�n en forma logaritmica
 if (Ripple==1)color='m';
      elseif (Ripple==2)color='g';
         elseif (Ripple==3)color='b';end
 semilogx(w,hlog,color);
 
 leyenda=20*log10((1+(9.^(2*n))).^0.5);
 
 L_tx=num2str(n);
  L_tx=strcat('n = ',L_tx);
  LEY= text(8,leyenda,L_tx);
  set(LEY,'color','k','BackgroundColor',[0.792,0.976,0.976],'FontSize',12,'FontWeight','bold');
 
  
 % Graficaci�n de atenuaci�n en funci�n de w
   hold on;					% Mantengo el grafico anterior
     
      end  						% Temina cuando n=10
end      
      T1=title('ATENUACI�N NORMALIZADA DE FILTRO PASABAJOS DE BUTTERWORTH CON Amax 1, 2 Y 3 dB');
      set(T1,'color','k','BackgroundColor',[0.956,0.976,0.784],'FontSize',12,'FontWeight','bold');
      
      hold off; 				% Desactivo sobegraficaci�n
      grid on;					% Grilla visible
      zoom on;					% Activo zoom
     
fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a jgarciaabad@ubp.edu.ar \n');
fprintf(' o a jgarciaabad@iua.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');
