format short eng;
echo off

fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTROS M-DERIVADO A PARTIR DEL FILTRO K-CONSTANTE\n');
fprintf('                ===============================================================\n\n');
fprintf('\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');

Tipo=input('Tipo de Filtro Pasa Bajos [pb] , Pasa Altos [pa] ,\n               Pasa Banda [PB] , Elimina Banda [EB]  -->  ','s');

% PASA BAJOS
% =========================================================================

if (Tipo=='pb')

fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA BAJOS M-DERIVADO\n');
fprintf('                =========================================\n\n');


m=input('Valor de m = ');

% Impresion de resultados Pasa Bajos Kcte
fprintf('\n\nResultados Filtro Pasa Bajos Kcte\n');
fprintf('=============================\n\n');
fprintf('\n\nLa frecuencia de corte fc es %8.4f [Hertz]\n\n',fc);
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf('La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie en el filtro Kcte, es L1/2(Kcte) = %8.6f [mH] \n\n',l1*1e3);
fprintf('El valor del capacitor paralelo en el filtro Kcte, es C2(Kcte) = %8.12f [uF]\n\n',c2*1e6);

l1m=l1*m;
c2m=c2*m;
l2m=l1*(1-m^2)/(2*m);
w_inf=1/sqrt(1-m^2)*wc;
w_inf_c=1/sqrt(c2m*l2m);  % Comprobación con componentes calculados

% Impresion de resultados Pasa Bajos m_Derivado
fprintf('\n\nResultados Filtro Pasa Bajos m_Derivado\n');
fprintf('===================================\n\n');
fprintf('\n\nLa frecuencia de corte fc es %8.4f [Hertz]\n\n',fc)
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf(' La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie en el filtro m_Derivado, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = C2(Kcte) * m = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor del Inductor paralelo en el filtro m_Derivado, es L2(m-Der) =L1/2(Kcte) *(1-m^2)/(2*m) = %8.12f [mH]\n\n',l2m*1e3);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = wc * 1/(sqrt(1-m^2)) =%8.12f [[rad/seg]]\n\n',w_inf);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = 1/(sqrt(L2(m-Der) * C2(m-Der))) = %8.12f [[rad/seg]]\n\n',w_inf_c);


%     GRAFICACION RESULTADOS  PASA BAJOS 
F4=figure(4);
   set(F4,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BAJOS m-DERIVADO');
   clf;
   
     

  a=imread('\PASABAJOS_M.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1m);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(90,50,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2m);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(220,85,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(l1m);
  Z3A_tx=strcat(Z3A_tx,' [H]');
  T3A= text(240,50,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(l2m);
  Z4A_tx=strcat(Z4A_tx,' [H]');
  T4A= text(220,140,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(450,120,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
   FM0_tx='m = ';
  FM1_tx=num2str(m);
  FM0_tx=strcat(FM0_tx,FM1_tx);  
  TFM1= text(310,185,FM0_tx);
  set(TFM1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte fc = ';
  FC1_tx=num2str(fc);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(310,200,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  
  FI0_tx='Frec. atenuac. inf = ';
  FI1_tx=num2str(w_inf/(2*pi));
  FI0_tx=strcat(FI0_tx,FI1_tx);
  FI1_tx=strcat(FI0_tx,' [Hz]');
  TFI1= text(310,215,FI1_tx);
  set(TFI1,'color','b','FontSize',12,'FontWeight','bold');
  %


end
%========================================================================


% PASA ALTOS
% =========================================================================
if(Tipo=='pa')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA ALTOS M-DERIVADO\n');
fprintf('                ======================================\n\n');
   
m=input('Valor de m = ');


% Impresion de resultados Pasa Altos K-constante
fprintf('\n\nResultados Filtro Pasa Altos Kcte\n');
fprintf('                ======================================\n\n');
fprintf('\n\nLa frecuencia de corte fc es %8.4f [Hertz]\n\n',fc);
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf(' La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del capacitor serie en el filtro Kcte, 2 C1(Kcte) es de %8.6f [uF]  \n\n',c1*2e6);
fprintf('El valor del inductor paralelo en el filtro Kcte, L2(Kcte) es de %8.12f [mH]\n\n',l2*1e3);

c1m=c1/m;
l2m=l2/m;
c2m=c1*(2*m)/(1-m^2);
w_inf=wc*sqrt(1-m^2);
w_inf_c=1/sqrt(c2m*l2m); % Comprobación con componentes calculados

% Impresion de resultados Pasa Altos m_Derivado
fprintf('\n\nResultados Filtro Pasa Altos m_Derivado\n');
fprintf('===================================\n\n');
fprintf('\n\nLa frecuencia de corte fc es %8.4f [Hertz]\n\n',fc)
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf(' La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del capacitor serie en el filtro m_Derivado, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1m*1e6);
fprintf('El valor del Inductor paralelo en el filtro m_Derivado, es L2(m-Der) =L2(Kcte) / m = %8.12f [mH] \n\n',l2m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = 2 C2(Kcte) *(2*m) / (1-m^2) = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = wc * sqrt(1-m^2)) =%8.12f [[rad/seg]]\n\n',w_inf);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = 1/(sqrt(L2(m-Der) * C2(m-Der))) = %8.12f [[rad/seg]]\n\n',w_inf_c);


%  ************    GRAFICACION RESULTADOS    PASA ALTOS **************
F4=figure(4);
   set(F4,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA ALTOS M-DERIVADO');
   clf;
  
  a=imread('\PASAALTOS_M.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(c1m);
  Z1A_tx=strcat(Z1A_tx,' [F]');
  T1A= text(90,55,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(l2m);
  Z2A_tx=strcat(Z2A_tx,' [H]');
  T2A= text(220,85,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1m);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(250,55,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(c2m);
  Z4A_tx=strcat(Z4A_tx,' [F]');
  T4A= text(220,150,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(450,120,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
  FM0_tx='m = ';
  FM1_tx=num2str(m);
  FM0_tx=strcat(FM0_tx,FM1_tx);  
  TFM1= text(310,185,FM0_tx);
  set(TFM1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte fc = ';
  FC1_tx=num2str(fc);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(310,200,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  
  FI0_tx='Frec. atenuac. inf = ';
  FI1_tx=num2str(w_inf/(2*pi));
  FI0_tx=strcat(FI0_tx,FI1_tx);
  FI1_tx=strcat(FI0_tx,' [Hz]');
  TFI1= text(310,215,FI1_tx);
  set(TFI1,'color','b','FontSize',12,'FontWeight','bold');

end

% PASA BANDA
%========================================================================

if (Tipo=='PB')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA BANDA M-DERIVADO\n');
fprintf('                ======================================\n\n');
   
m=input('Valor de m = ');


% Impresion de resultados Pasa Banda K-constante
fprintf('\n\nResultados Filtro Pasa Banda Kcte\n');
fprintf('                ======================================\n\n');
fprintf('\n\nLa pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);
fprintf('La pulsación de resonancia al cuadrado wo2 es %8.4f [(rad/seg)^2]\n\n',wo2);
fprintf('El ancho de banda BW es de %8.4f [rad/seg]\n\n',bw);

fprintf('El valor del inductor serie L1 es de %8.6f [mH]  ---> L1/2 es de %8.6f [mH] \n\n',l1*1e3*2,l1*1e3);
fprintf('El valor del capacitor serie C1 es de %8.12f [uF]  ---> 2*C1 es de %8.12f [uF]\n\n',c1*1e6/2,c1*1e6);
fprintf('El valor del inductor paralelo L2 es de %8.6f [mH]\n\n',l2*1e3);
fprintf('El valor del capacitor paralelo C2 es de %8.12f [uF]\n\n',c2*1e6);

l1m=l1*m;
c1m=c1/m;
l2m=l2/m;
c2m=c2*m;
l3m=l1*(1-m^2)/(2*m);
c3m=c1*(2*m)/(1-m^2);
w_inf=roots([1,-bw/sqrt(1-m^2),-wo2]);
if (w_inf(1)<0)  w_inf(1)=w_inf(1)*-1; end
    if (w_inf(2)<0)  w_inf(2)=w_inf(2)*-1; end
        if (w_inf(1)<w_inf(2))   w_inf1=w_inf(1); w_inf2=w_inf(2); 
        end
       if (w_inf(1)>w_inf(2))   w_inf1=w_inf(2); w_inf2=w_inf(1); 
       end

% Impresion de resultados Pasa Banda m_Derivado
fprintf('\n\nResultados Filtro Pasa Banda m_Derivado\n');
fprintf('===================================\n\n');
fprintf('\n\nLa frecuencia de corte inferior fc1 es %8.4f [Hertz]\n\n',fc1);
fprintf('\n\nLa frecuencia de corte inferior fc2 es %8.4f [Hertz]\n\n',fc2)
fprintf('\n\nLa pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);

fprintf(' La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie en el filtro m_Derivado, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1m*1e3);
fprintf('El valor del capacitor serie en el filtro m_Derivado, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L2(m-Der) = L2(Kcte) / m = %8.12f [mH]\n\n',l2m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = C2(Kcte) * m = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L3(m-Der) = L1(Kcte) * (1-m^2)/(2*m) = %8.12f [mH]\n\n',l3m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C3(m-Der) = C1(Kcte) *( 2*m) / (1-m^2) = %8.12f [uF]\n\n',c3m*1e6);


fprintf('El valor de la pulsación inferior para atenuación infinita, es w_inf1 = %8.12f [[rad/seg]]\n\n',w_inf1);
fprintf('El valor de la pulsación superior para atenuación infinita, es w_inf 2 =  %8.12f [[rad/seg]]\n\n',w_inf2);
fprintf('El valor de la frecuencia inferior para atenuación infinita, es f_inf1 = %8.12f [[Hz]]\n\n',w_inf1/(2*pi));
fprintf('El valor de la pulsación superior para atenuación infinita, es f_inf 2 =  %8.12f [[Hz]]\n\n',w_inf2/(2*pi));
fprintf('La pulsación de resonancia al cuadrado wo^2  = wc2 * wc1es %8.4f [rad/seg]\n\n',wc2*wc1);
fprintf('La pulsación de resonancia al cuadrado wo^2  = w_inf2 * w_inf1 es %8.4f [rad/seg]\n\n',w_inf2*w_inf1);

%  ************    GRAFICACION RESULTADOS    PASA BANDA **************
F4=figure(4);
   set(F4,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BANDA M-DERIVADO');
   clf;
  
  a=imread('\PASABANDA_M.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1m);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(60,55,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z1B_tx=num2str(c1m);
  Z1B_tx=strcat(Z1B_tx,' [F]');
  T1B= text(125,70,Z1B_tx);
  set(T1B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2m);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(110,125,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(l2m);
  Z2B_tx=strcat(Z2B_tx,' [H]');
  T2B= text(260,125,Z2B_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1m);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(245,70,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3B_tx=num2str(l1m);
  Z3B_tx=strcat(Z3B_tx,'[H]');
  T3B= text(325,55,Z3B_tx);
  set(T3B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(l3m);
  Z4A_tx=strcat(Z4A_tx,' [H]');
  T4A= text(230,180,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4B_tx=num2str(c3m);
  Z4B_tx=strcat(Z4B_tx,'[F]');
  T4B= text(230,240,Z4B_tx);
  set(T4B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(455,170,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
  FM0_tx='m = ';
  FM1_tx=num2str(m);
  FM0_tx=strcat(FM0_tx,FM1_tx);  
  TFM1= text(290,270,FM0_tx);
  set(TFM1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte inferior fc1 = ';
  FC1_tx=num2str(fc1);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(290,285,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte superior fc2 = ';
  FC2_tx=num2str(fc2);
  FC0_tx=strcat(FC0_tx,FC2_tx);
  FC2_tx=strcat(FC0_tx,' [Hz]');
  TFC2= text(290,300,FC2_tx);
  set(TFC2,'color','b','FontSize',12,'FontWeight','bold');
 
  %************************************************************************
  
  % COMPROBACION DE RESULTADOS m-Derivados Pasa Banda
fprintf('\n COMPROBACION DE RESULTADOS m-Derivados PASA-BANDA\n\n');
fprintf('  =====================================================\n\n');
fprintf('La pulsación de resonancia al cuadrado wo^2  = 1 / (L1(m-Der) * C1(m-Der)) es %8.4f [rad/seg]^2\n\n',1/(l1m*c1m));
fprintf('La pulsación de resonancia al cuadrado wo^2  = 1 / (L2(m-Der) * C2(m-Der)) es %8.4f [rad/seg]^2\n\n',1/(l2m*c2m));
fprintf('La pulsación de resonancia al cuadrado wo^2  = 1 / (L3(m-Der) * C3(m-Der)) es %8.4f [rad/seg]^2\n\n',1/(l3m*c3m));
fprintf('La Impedancia característica Ro  = sqrt(L1(m-Der) / C2(m-Der)) es %8.4f [rad/seg]^2\n\n',sqrt(l1m*2/c2m));  
fprintf('La Impedancia característica Ro  = sqrt(L2(m-Der) / C1(m-Der)) es %8.4f [rad/seg]^2\n\n',sqrt(l2m/(c1m/2)));  
  
  
end


% ELIMINA BANDA
%========================================================================

if (Tipo=='EB')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO ELIMINA BANDA M-DERIVADO\n');
fprintf('                ======================================\n\n');
   
m=input('Valor de m = ');

% Impresion de resultados Elimina Banda
fprintf('\n\nResultados Filtro Elimina Banda Kcte\n');
fprintf('                ======================================\n\n');
fprintf('\n\nLa pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);
fprintf('La pulsación de resonancia al cuadrado wo2 es %8.4f [(rad/seg)^2]\n\n',wo2);
fprintf('El ancho de banda BW es de %8.4f [rad/seg]\n\n',bw);

fprintf('El valor del inductor serie L1 es de %8.6f [mH]  ---> L1/2 es de %8.6f [mH] \n\n',l1*1e3*2,l1*1e3);
fprintf('El valor del capacitor serie C1 es de %8.12f [uF]  ---> 2*C1 es de %8.12f [uF]\n\n',c1*1e6/2,c1*1e6);
fprintf('El valor del inductor paralelo L2 es de %8.6f [mH]\n\n',l2*1e3);
fprintf('El valor del capacitor paralelo C2 es de %8.12f [uF]\n\n',c2*1e6);

l1m=l1*m;
c1m=c1/m;
l2m=l2/m;
c2m=c2*m;
l3m=l1*(1-m^2)/(2*m);
c3m=c1*(2*m)/(1-m^2);

w_inf=roots([1,-bw*sqrt(1-m^2),-wo2]);
if (w_inf(1)<0)  w_inf(1)=w_inf(1)*-1; end
    if (w_inf(2)<0)  w_inf(2)=w_inf(2)*-1; end
        if (w_inf(1)<w_inf(2))   w_inf1=w_inf(1); w_inf2=w_inf(2); 
        end
       if (w_inf(1)>w_inf(2))   w_inf1=w_inf(2); w_inf2=w_inf(1); 
       end

% Impresion de resultados Elimina Banda m_Derivado
fprintf('\n\nResultados Filtro Elimina Banda m_Derivado\n');
fprintf('===================================\n\n');
fprintf('\n\nLa frecuencia de corte inferior fc1 es %8.4f [Hertz]\n\n',fc1);
fprintf('\n\nLa frecuencia de corte inferior fc2 es %8.4f [Hertz]\n\n',fc2)
fprintf('\n\nLa pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);

fprintf(' La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie en el filtro m_Derivado, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1m*1e3);
fprintf('El valor del capacitor serie en el filtro m_Derivado, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L2(m-Der) = L2(Kcte) / m = %8.12f [mH]\n\n',l2m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = C2(Kcte) * m = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L3(m-Der) = L1(Kcte) * (1-m^2)/(2*m) = %8.12f [mH]\n\n',l3m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C3(m-Der) = C1(Kcte) *( 2*m) / (1-m^2) = %8.12f [uF]\n\n',c3m*1e6);


fprintf('El valor de la pulsación inferior para atenuación infinita, es w_inf1 = %8.12f [[rad/seg]]\n\n',w_inf1);
fprintf('El valor de la pulsación superior para atenuación infinita, es w_inf 2 =  %8.12f [[rad/seg]]\n\n',w_inf2);
fprintf('El valor de la frecuencia inferior para atenuación infinita, es f_inf1 = %8.12f [[Hz]]\n\n',w_inf1/(2*pi));
fprintf('El valor de la pulsación superior para atenuación infinita, es f_inf 2 =  %8.12f [[Hz]]\n\n',w_inf2/(2*pi));
fprintf('La pulsación de resonancia al cuadrado wo^2  = wc2 * wc1es %8.4f [rad/seg]\n\n',wc2*wc1);
fprintf('La pulsación de resonancia al cuadrado wo^2  = w_inf2 * w_inf1 es %8.4f [rad/seg]\n\n',w_inf2*w_inf1);
format long eng;

%  ************    GRAFICACION RESULTADOS    ELIMINA BANDA **************
F4=figure(4);
   set(F4,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO ELIMINA BANDA KCTE');
   clf;
 
  a=imread('\ELIMINABANDA_M.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1m);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(100,120,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z1B_tx=num2str(c1m);
  Z1B_tx=strcat(Z1B_tx,' [F]');
  T1B= text(100,60,Z1B_tx);
  set(T1B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2m);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(240,190,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(l2m);
  Z2B_tx=strcat(Z2B_tx,' [H]');
  T2B= text(230,145,Z2B_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1m);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(300,60,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3B_tx=num2str(l1m);
  Z3B_tx=strcat(Z3B_tx,' [H]');
  T3B= text(300,120,Z3B_tx);
  set(T3B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(l3m); 
  Z4A_tx=strcat(Z4A_tx,' [H]');
  T4A= text(265,245,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4B_tx=num2str(c3m);
  Z4B_tx=strcat(Z4B_tx,'[F]');
  T4B= text(100,245,Z4B_tx);
  set(T4B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(465,200,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
 FM0_tx='m = ';
  FM1_tx=num2str(m);
  FM0_tx=strcat(FM0_tx,FM1_tx);  
  TFM1= text(310,300,FM0_tx);
  set(TFM1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte inferior fc1 = ';
  FC1_tx=num2str(fc1);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(310,315,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte superior fc2 = ';
  FC2_tx=num2str(fc2);
  FC0_tx=strcat(FC0_tx,FC2_tx);
  FC2_tx=strcat(FC0_tx,' [Hz]');
  TFC2= text(310,330,FC2_tx);
  set(TFC2,'color','b','FontSize',12,'FontWeight','bold');
  %************************************************************************
  
  % COMPROBACION DE RESULTADOS m-Derivados Elimina Banda
fprintf('\n COMPROBACION DE RESULTADOS m-Derivados ELIMINA-BANDA\n\n');
fprintf('  =====================================================\n\n');
fprintf('La pulsación de resonancia al cuadrado wo^2  = 1 / (L1(m-Der) * C1(m-Der)) es %8.4f [rad/seg]^2\n\n',1/(l1m*c1m));
fprintf('La pulsación de resonancia al cuadrado wo^2  = 1 / (L2(m-Der) * C2(m-Der)) es %8.4f [rad/seg]^2\n\n',1/(l2m*c2m));
fprintf('La pulsación de resonancia al cuadrado wo^2  = 1 / (L3(m-Der) * C3(m-Der)) es %8.4f [rad/seg]^2\n\n',1/(l3m*c3m));
fprintf('La Impedancia característica Ro  = sqrt(L1(m-Der) / C2(m-Der)) es %8.4f [rad/seg]^2\n\n',sqrt(l1m*2/c2m));  
fprintf('La Impedancia característica Ro  = sqrt(L2(m-Der) / C1(m-Der)) es %8.4f [rad/seg]^2\n\n',sqrt(l2m/(c1m/2)));  
  

end


fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a : \n');
fprintf('  jgarcia_abad@electronica.frc.utn.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');
