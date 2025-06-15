format short eng;
echo off

fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE SEMI-SECCIÓN ADAPTADORA DE IMPEDANCIA m-DERIVADA TIPO PI CON m=0,6 \n');
fprintf('                ===============================================================\n\n');
fprintf('\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');

Tipo=input('Tipo de Filtro Pasa Bajos [pb] , Pasa Altos [pa] ,\n               Pasa Banda [PB] , Elimina Banda [EB]  -->  ','s');

M=0.6;

% PASA BAJOS
% =========================================================================

if (Tipo=='pb')

fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE SEMI-SECCIÓN ADAPTADORA DE IMPEDANCIAS PASA BAJOS M-DERIVADO CON m=0,6\n');
fprintf('                ================================================================================\n\n');




% Impresion de resultados Pasa Bajos Kcte
fprintf('\n\nResultados Filtro Pasa Bajos Kcte\n');
fprintf('=============================\n\n');
fprintf('La frecuencia de corte fc es %8.4f [Hertz]\n\n',fc);
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
fprintf('\n\nResultados Filtro Pasa Bajos m_Derivado con m =%1.4f \n',m);
fprintf('====================================================\n\n');
fprintf('La frecuencia de corte fc es %8.4f [Hertz]\n\n',fc)
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf('La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie en el filtro m_Derivado, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = C2(Kcte) * m = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor del Inductor paralelo en el filtro m_Derivado, es L2(m-Der) =L1/2(Kcte) *(1-m^2)/(2*m) = %8.12f [mH]\n\n',l2m*1e3);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = wc * 1/(sqrt(1-m^2)) =%8.12f [[rad/seg]]\n\n',w_inf);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = 1/(sqrt(L2(m-Der) * C2(m-Der))) = %8.12f [[rad/seg]]\n\n',w_inf_c);

l1M=l1*M;
c2M=c2*M;
l2M=l1*(1-M^2)/(2*M);
w_inf_0_6=1/sqrt(1-M^2)*wc;
w_inf_0_6_c=1/sqrt(c2M*l2M);  % Comprobación con componentes calculados

% Impresion de resultados Semi-secciones adaptadoras de Z , Pasa Bajos m_Derivado con m=0,6 
fprintf('\n\nResultados Semi-secciones adaptadoras de Z , Pasa Bajos m_Derivado con m=0,6  \n',m);
fprintf('=====================================================================\n\n');
fprintf('La frecuencia de corte fc es %8.4f [Hertz]\n\n',fc)
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf('La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie de la semisección adaptadora  m_Derivado, con m=0,6, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1M*1e3);
fprintf('El valor del capacitor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es C2(m-Der) = (C2(Kcte) * m )= %8.12f [uF]\n\n',c2M*1e6);
fprintf('El valor del Inductor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es L2(m-Der) = (L1/2(Kcte) *(1-m^2)/(2*m) )*2= %8.12f [mH]\n\n',l2M*1e3*2);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = wc * 1/(sqrt(1-m^2)) =%8.12f [[rad/seg]]\n\n',w_inf_0_6);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = 1/(sqrt(L2(m-Der) * C2(m-Der))) = %8.12f [[rad/seg]]\n\n',w_inf_0_6_c);


%     GRAFICACION RESULTADOS  PASA BAJOS 
F5=figure(5);
   set(F5,'color',[0.914,0.91,0.737],'NAME','DISEÑO ADAPTADOR Z  -  PASA BAJOS m-DERIVADO m = 0,6');
   clf;
   
     

  a=imread('\ADAP_Z_PASA_BAJOS_M_0_6.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1M);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(100,50,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2M/2);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(85,85,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(c2M/2);
  Z2B_tx=strcat(Z2A_tx,' [F]');
  T2B= text(500,85,Z2A_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(l1M);
  Z3A_tx=strcat(Z3A_tx,' [H]');
  T3A= text(380,50,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(l2M*2);
  Z4A_tx=strcat(Z4A_tx,' [H]');
  T4A= text(85,140,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4B_tx=num2str(l2M*2);
  Z4B_tx=strcat(Z4A_tx,' [H]');
  T4B= text(500,140,Z4A_tx);
  set(T4B,'color','b','FontSize',12,'FontWeight','bold');
  %


end
%========================================================================


% PASA ALTOS
% =========================================================================
if(Tipo=='pa')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE SEMI-SECCIÓN ADAPTADORA DE IMPEDANCIAS PASA ALTOS M-DERIVADO CON m=0,6\n');
fprintf('                ======================================================================================\n\n');
   



% Impresion de resultados Pasa Altos K-constante
fprintf('\n\nResultados Filtro Pasa Altos Kcte\n');
fprintf('==============================\n\n');
fprintf('La frecuencia de corte fc es %8.4f [Hertz]\n\n',fc);
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
fprintf('\n\nResultados Filtro Pasa Altos m_Derivado con m =%1.4f \n',m);
fprintf('=============================================\n\n');
fprintf('La frecuencia de corte fc es %8.4f [Hertz]\n\n',fc)
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf(' La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del capacitor serie en el filtro m_Derivado, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1m*1e6);
fprintf('El valor del Inductor paralelo en el filtro m_Derivado, es L2(m-Der) =L2(Kcte) / m = %8.12f [mH] \n\n',l2m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = 2 C2(Kcte) *(2*m) / (1-m^2) = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = wc * sqrt(1-m^2)) =%8.12f [[rad/seg]]\n\n',w_inf);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = 1/(sqrt(L2(m-Der) * C2(m-Der))) = %8.12f [[rad/seg]]\n\n',w_inf_c);

c1M=c1/M;
l2M=l2/M;
c2M=c1*(2*M)/(1-M^2);
w_inf_0_6=wc*sqrt(1-M^2);
w_inf_c_0_6=1/sqrt(c2M*l2M); % Comprobación con componentes calculados

% Impresion de resultados Semi-secciones adaptadoras de Z , Pasa Altos m_Derivado con m=0,6 

fprintf('\n\nResultados Semi-secciones adaptadoras de Z , Pasa Altos m_Derivado con m=0,6  \n',m);
fprintf('===================================================================\n\n');
fprintf('La frecuencia de corte fc es %8.4f [Hertz]\n\n',fc)
fprintf('La pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf(' La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del capacitor serie de la semisección adaptadora  m_Derivado, con m=0,6, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1M*1e6);
fprintf('El valor del Inductor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es L2(m-Der) =(L2(Kcte) *2/ m )*2= %8.12f [mH] \n\n',l2M*1e3*2);
fprintf('El valor del capacitor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es C2(m-Der) = (C2(Kcte) *(2*m) / (1-m^2)/2 = %8.12f [uF]\n\n',c2M*1e6/2);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = wc * sqrt(1-m^2)) =%8.12f [[rad/seg]]\n\n',w_inf_0_6);
fprintf('El valor de la pulsación para atenuación infinita, es w_inf = 1/(sqrt(L2(m-Der) * C2(m-Der))) = %8.12f [[rad/seg]]\n\n',w_inf_c_0_6);



%  ************    GRAFICACION RESULTADOS    PASA ALTOS **************
F5=figure(5);
   set(F5,'color',[0.914,0.91,0.737],'NAME','DISEÑO ADAPTADOR Z  -  PASA ALTOS M-DERIVADO CON m = 0,6');
   clf;
  
  a=imread('\ADAP_Z_PASA_ALTOS_M_0_6.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(c1M);
  Z1A_tx=strcat(Z1A_tx,' [F]');
  T1A= text(120,55,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(l2M*2);
  Z2A_tx=strcat(Z2A_tx,' [H]');
  T2A= text(95,85,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(l2M*2);
  Z2B_tx=strcat(Z2A_tx,' [H]');
  T2B= text(500,85,Z2A_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1M);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(390,55,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(c2M/2);
  Z4A_tx=strcat(Z4A_tx,' [F]');
  T4A= text(95,150,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4B_tx=num2str(c2M/2);
  Z4B_tx=strcat(Z4A_tx,' [F]');
  T4B= text(500,150,Z4A_tx);
  set(T4B,'color','b','FontSize',12,'FontWeight','bold');
  
  
end

% PASA BANDA
%========================================================================

if (Tipo=='PB')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE SEMI-SECCIÓN ADAPTADORA DE IMPEDANCIAS PASA BANDA M-DERIVADO CON m=0,6\n');
fprintf('                ================================================================================\n\n');
 
   



% Impresion de resultados Pasa Banda K-constante
fprintf('\n\nResultados Filtro Pasa Banda Kcte\n');
fprintf('==============================\n\n');
fprintf('La pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
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
fprintf('\n\nResultados Filtro Pasa Banda m_Derivado con m =%1.4f \n',m);
fprintf('================================================\n\n');
fprintf('La frecuencia de corte inferior fc1 es %8.4f [Hertz]\n\n',fc1);
fprintf('La frecuencia de corte inferior fc2 es %8.4f [Hertz]\n\n',fc2)
fprintf('La pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);

fprintf('La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie en el filtro m_Derivado, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1m*1e3);
fprintf('El valor del capacitor serie en el filtro m_Derivado, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L2(m-Der) = L2(Kcte) / m = %8.12f [mH]\n\n',l2m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = C2(Kcte) * m = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L3(m-Der) = L1(Kcte) * (1-m^2)/(2*m) = %8.12f [mH]\n\n',l3m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C3(m-Der) = C1(Kcte) *( 2*m) / (1-m^2) = %8.12f [uF]\n\n',c3m*1e6);


fprintf('El valor de la pulsación inferior para atenuación infinita, es w_inf1 = %8.12f [[rad/seg]]\n\n',w_inf1);
fprintf('El valor de la pulsación superior para atenuación infinita, es w_inf 2 =  %8.12f [[rad/seg]]\n\n',w_inf2);

l1M=l1*M;
c1M=c1/M;
l2M=l2/M;
c2M=c2*M;
l3M=l1*(1-M^2)/(2*M);
c3M=c1*(2*M)/(1-M^2);

w_inf_0_6=roots([1,-bw/sqrt(1-M^2),-wo2]);
if (w_inf_0_6(1)<0)  w_inf_0_6(1)=w_inf_0_6(1)*-1; end
    if (w_inf_0_6(2)<0)  w_inf_0_6(2)=w_inf_0_6(2)*-1; end
        if (w_inf_0_6(1)<w_inf_0_6(2))   w_inf1_0_6=w_inf_0_6(1); w_inf2_0_6=w_inf(2); 
        end
       if (w_inf_0_6(1)>w_inf_0_6(2))   w_inf1_0_6=w_inf_0_6(2); w_inf2_0_6=w_inf_0_6(1); 
       end

% Impresion de resultados Semi-secciones adaptadoras de Z , Pasa Banda m_Derivado con m=0,6 
fprintf('\n\nResultados Semi-secciones adaptadoras de Z , Pasa Banda  m_Derivado con m=0,6  \n',m);
fprintf('====================================================================\n\n');
fprintf('La frecuencia de corte inferior fc1 es %8.4f [Hertz]\n\n',fc1);
fprintf('La frecuencia de corte inferior fc2 es %8.4f [Hertz]\n\n',fc2)
fprintf('La pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);
fprintf('La pulsación de resonancia al cuadrado wo^2  = wc2*wc1 es %8.4f [rad/seg]\n\n',wo2);

fprintf('La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie de la semisección adaptadora  m_Derivado, con m=0,6, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1M*1e3);
fprintf('El valor del capacitor serie de la semisección adaptadora  m_Derivado, con m=0,6, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1M*1e6);
fprintf('El valor del inductor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es L2(m-Der) = ( L2(Kcte) / m)*2 = %8.12f [mH]\n\n',l2M*1e3*2);
fprintf('El valor del capacitor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es C2(m-Der) = ( C2(Kcte) * m )/2 = %8.12f [uF]\n\n',c2M*1e6/2);
fprintf('El valor del inductor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es L3(m-Der) = (L1(Kcte) * (1-m^2)/(2*m))*2 = %8.12f [mH]\n\n',l3M*1e3*2);
fprintf('El valor del capacitor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es C3(m-Der) = (C1(Kcte) *( 2*m) / (1-m^2))/2 = %8.12f [uF]\n\n',c3M*1e6/2);


fprintf('El valor de la pulsación inferior para atenuación infinita, es w_inf1 = %8.12f [[rad/seg]]\n\n',w_inf1_0_6);
fprintf('El valor de la pulsación superior para atenuación infinita, es w_inf 2 =  %8.12f [[rad/seg]]\n\n',w_inf2_0_6);
fprintf('La pulsación de resonancia al cuadrado wo^2  = w_inf2*w_inf1 es %8.4f [rad/seg]\n\n',w_inf2_0_6*w_inf1_0_6);

%  ************    GRAFICACION RESULTADOS    PASA BANDA **************
F5=figure(5);
   set(F5,'color',[0.914,0.91,0.737],'NAME','DISEÑO ADAPTADOR Z   -  PASA BANDA M-DERIVADO CON m = 0,6');
   clf;
  
  a=imread('\ADAP_Z_PASA_BANDA_M_0_6.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1M);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(210,55,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z1B_tx=num2str(c1M);
  Z1B_tx=strcat(Z1B_tx,' [F]');
  T1B= text(140,70,Z1B_tx);
  set(T1B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2M/2);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(5,125,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2AB_tx=num2str(c2M/2);
  Z2AB_tx=strcat(Z2A_tx,' [F]');
  T2AB= text(430,125,Z2A_tx);
  set(T2AB,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(l2M*2);
  Z2B_tx=strcat(Z2B_tx,' [H]');
  T2B= text(150,125,Z2B_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2BB_tx=num2str(l2M*2);
  Z2BB_tx=strcat(Z2B_tx,' [H]');
  T2BB= text(630,125,Z2B_tx);
  set(T2BB,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1M);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(510,60,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3B_tx=num2str(l1M);
  Z3B_tx=strcat(Z3B_tx,'[H]');
  T3B= text(430,55,Z3B_tx);
  set(T3B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(l3M*2);
  Z4A_tx=strcat(Z4A_tx,' [H]');
  T4A= text(120,180,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4AB_tx=num2str(l3M*2);
  Z4AB_tx=strcat(Z4A_tx,' [H]');
  T4AB= text(595,180,Z4A_tx);
  set(T4AB,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4B_tx=num2str(c3M/2);
  Z4B_tx=strcat(Z4B_tx,'[F]');
  T4B= text(120,235,Z4B_tx);
  set(T4B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4BB_tx=num2str(c3M/2);
  Z4BB_tx=strcat(Z4B_tx,'[F]');
  T4BB= text(600,235,Z4B_tx);
  set(T4BB,'color','b','FontSize',12,'FontWeight','bold');
  
    
end


% ELIMINA BANDA
%========================================================================

if (Tipo=='EB')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE SEMI-SECCIÓN ADAPTADORA DE IMPEDANCIAS ELIMINA BANDA M-DERIVADO CON m=0,6\n');
fprintf('                =========================================================================================\n\n');
 


% Impresion de resultados Elimina Banda Kcte
fprintf('Resultados Filtro Elimina Banda Kcte\n');
fprintf('================================\n\n');
fprintf('La pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
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
fprintf('\n\nResultados Filtro Elimina Banda m_Derivado con m =%1.4f \n',m);
fprintf('==================================================\n\n');
fprintf('La frecuencia de corte inferior fc1 es %8.4f [Hertz]\n\n',fc1);
fprintf('La frecuencia de corte inferior fc2 es %8.4f [Hertz]\n\n',fc2)
fprintf('La pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);

fprintf('La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie en el filtro m_Derivado, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1m*1e3);
fprintf('El valor del capacitor serie en el filtro m_Derivado, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L2(m-Der) = L2(Kcte) / m = %8.12f [mH]\n\n',l2m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C2(m-Der) = C2(Kcte) * m = %8.12f [uF]\n\n',c2m*1e6);
fprintf('El valor del inductor paralelo en el filtro m_Derivado, es L3(m-Der) = L1(Kcte) * (1-m^2)/(2*m) = %8.12f [mH]\n\n',l3m*1e3);
fprintf('El valor del capacitor paralelo en el filtro m_Derivado, es C3(m-Der) = C1(Kcte) *( 2*m) / (1-m^2) = %8.12f [uF]\n\n',c3m*1e6);


fprintf('El valor de la pulsación inferior para atenuación infinita, es w_inf1 = %8.12f [[rad/seg]]\n\n',w_inf1);
fprintf('El valor de la pulsación superior para atenuación infinita, es w_inf 2 =  %8.12f [[rad/seg]]\n\n',w_inf2);

l1M=l1*M;
c1M=c1/M;
l2M=l2/M;
c2M=c2*M;
l3M=l1*(1-M^2)/(2*M);
c3M=c1*(2*M)/(1-M^2);

w_inf_0_6=roots([1,-bw*sqrt(1-M^2),-wo2]);
if (w_inf_0_6(1)<0)  w_inf_0_6(1)=w_inf_0_6(1)*-1; end
    if (w_inf_0_6(2)<0)  w_inf_0_6(2)=w_inf_0_6(2)*-1; end
        if (w_inf_0_6(1)<w_inf_0_6(2))   w_inf1_0_6=w_inf_0_6(1); w_inf2_0_6=w_inf(2); 
        end
       if (w_inf_0_6(1)>w_inf_0_6(2))   w_inf1_0_6=w_inf_0_6(2); w_inf2_0_6=w_inf_0_6(1); 
       end
       
       
% Impresion de resultados Semi-secciones adaptadoras de Z , Elimina Banda m_Derivado con m=0,6 
fprintf('\n\nResultados Semi-secciones adaptadoras de Z , Elimina Banda  m_Derivado con m=0,6\n');
fprintf('===================================\n\n');
fprintf('La frecuencia de corte inferior fc1 es %8.4f [Hertz]\n\n',fc1);
fprintf('La frecuencia de corte inferior fc2 es %8.4f [Hertz]\n\n',fc2)
fprintf('La pulsación de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsación de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);
fprintf('La pulsación de resonancia al cuadrado wo^2  = wc2*wc1 es %8.4f [rad/seg]\n\n',wo2);

fprintf('La Impedancia de carga es Ro = %8.4f [Ohms] \n\n ',ro);
fprintf('El valor del inductor serie de la semisección adaptadora  m_Derivado, con m=0,6, es L1/2(m-Der) =L1/2(Kcte) * m = %8.6f [mH] \n\n',l1M*1e3);
fprintf('El valor del capacitor serie de la semisección adaptadora  m_Derivado, con m=0,6, es 2 C1(m-Der) = 2 C1(Kcte) / m = %8.6f [uF] \n\n',c1M*1e6);
fprintf('El valor del inductor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es L2(m-Der) = (L2(Kcte) / m)*2 = %8.12f [mH]\n\n',l2M*1e3*2);
fprintf('El valor del capacitor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es C2(m-Der) = (C2(Kcte) * m)/2 = %8.12f [uF]\n\n',c2M*1e6/2);
fprintf('El valor del inductor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es L3(m-Der) = (L1(Kcte) * (1-m^2)/(2*m) )*2= %8.12f [mH]\n\n',l3M*1e3*2);
fprintf('El valor del capacitor paralelo de la semisección adaptadora  m_Derivado, con m=0,6, es C3(m-Der) = (C1(Kcte) *( 2*m) / (1-m^2))/2 = %8.12f [uF]\n\n',c3M*1e6/2);


fprintf('El valor de la pulsación inferior para atenuación infinita, es w_inf1 = %8.12f [[rad/seg]]\n\n',w_inf1_0_6);
fprintf('El valor de la pulsación superior para atenuación infinita, es w_inf 2 =  %8.12f [[rad/seg]]\n\n',w_inf2_0_6);
fprintf('La pulsación de resonancia al cuadrado wo^2  = w_inf2*w_inf1 es %8.4f [rad/seg]\n\n',w_inf2_0_6*w_inf1_0_6);


format long eng;

%  ************    GRAFICACION RESULTADOS    ELIMINA BANDA **************
F5=figure(5);
   set(F5,'color',[0.914,0.91,0.737],'NAME','DISEÑO ADAPTADOR Z  -   ELIMINA BANDA M-DERIVADO CON m = 0,6 ');
   clf;
 
  a=imread('\ADAP_Z_ELIMINA_BANDA_M_0_6.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1M);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(185,120,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z1B_tx=num2str(c1M);
  Z1B_tx=strcat(Z1B_tx,' [F]');
  T1B= text(180,60,Z1B_tx);
  set(T1B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2M/2);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(125,190,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2AB_tx=num2str(c2M/2);
  Z2AB_tx=strcat(Z2A_tx,' [F]');
  T2AB= text(630,190,Z2A_tx);
  set(T2AB,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(l2M*2);
  Z2B_tx=strcat(Z2B_tx,' [H]');
  T2B= text(125,145,Z2B_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2BB_tx=num2str(l2M*2);
  Z2BB_tx=strcat(Z2B_tx,' [H]');
  T2BB= text(630,145,Z2B_tx);
  set(T2BB,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1M);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(500,60,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3B_tx=num2str(l1M);
  Z3B_tx=strcat(Z3B_tx,' [H]');
  T3B= text(505,120,Z3B_tx);
  set(T3B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z4A_tx=num2str(l3M*2); 
  Z4A_tx=strcat(Z4A_tx,' [H]');
  T4A= text(150,245,Z4A_tx);
  set(T4A,'color','b','FontSize',12,'FontWeight','bold');
  
   Z4AB_tx=num2str(l3M*2); 
  Z4AB_tx=strcat(Z4A_tx,' [H]');
  T4AB= text(655,245,Z4A_tx);
  set(T4AB,'color','b','FontSize',12,'FontWeight','bold');
 
  Z4B_tx=num2str(c3M/2);
  Z4B_tx=strcat(Z4B_tx,'[F]');
  T4B= text(5,245,Z4B_tx);
  set(T4B,'color','b','FontSize',12,'FontWeight','bold');
  
 Z4BB_tx=num2str(c3M/2);
  Z4BB_tx=strcat(Z4B_tx,'[F]');
  T4BB= text(500,245,Z4B_tx);
  set(T4BB,'color','b','FontSize',12,'FontWeight','bold');
  
end


fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a : \n');
fprintf('  jgarcia_abad@electronica.frc.utn.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');
