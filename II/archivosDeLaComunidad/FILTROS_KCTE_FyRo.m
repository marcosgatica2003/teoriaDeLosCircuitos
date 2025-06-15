format long e
echo off
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTROS K-CONSTANTE\n');
fprintf('                =============================\n\n');
fprintf('\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');


fprintf('\nFiltro Pasa Bajos [pb]');
fprintf('\nFiltro Pasa Altos [pa]');
fprintf('\nFiltro Pasa Banda [PB]');
fprintf('\nFiltro Elimina Banda [EB]');
Tipo=input('\nELIJA EL TIPO DE FILTRO:','s');


%==========================================================================
% PASA BAJOS
%==========================================================================

 if (Tipo == 'pb')
 clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA BAJOS K-CONSTANTE\n');
fprintf('                ======================================\n\n');

fc=input('Frecuencia de corte fc [Hertz] = ');
ro=input('Impedancia de carga Ro [Ohms] = ');
wc=2*pi*fc;
l1=2*ro/wc;
c2=2/(ro*wc);
wc=2/sqrt(l1*c2);

% Impresion de resultados Pasa Bajos
fprintf('\n\nLa pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf('El valor del inductor serie L1 es de %8.6f [mH]  ---> L1/2 es de %8.6f [mH] \n\n',l1*1e3,l1*1e3/2);
fprintf('El valor del capacitor paralelo C2 es de %8.12f [uF]\n\n',c2*1e6);


% CALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA

fprintf('\nCALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA\n\n');

l1=1*ro/wc;
fprintf('L1/2 = 1 * Ro / wc = %8.4f / %8.4f = %8.6f [mH] \n\n',ro,wc,l1*1e3);

c2=2/(ro*wc);
fprintf('C2 = 2 / ( ro * wc ) = 2 / ( %8.4f * %8.6f ) = %8.12f [uF] \n\n',ro,wc,c2*1e6);

fprintf('\nCOMPROBACION\n\n');

Ro = sqrt(2*l1/(c2));
fprintf('Ro = sqrt ( L1 / C2 ) = sqrt ( %8.6f [H] / %8.12f [F] ) = %8.4f [Ohms] \n\n',2* l1,c2,Ro);
wc = 2 / sqrt( 2*l1 * c2);
fprintf('wc = 2 / sqrt( L1 * C2) = 2 / sqrt ( %8.6f [H] * %8.12f [F] ) = %8.4f [rad/seg] \n\n',2* l1,c2,wc);
fprintf('por lo tanto fc = wc / 2*pi = %8.6f [rad/seg] / ( 2* pi ) = %8.4f [Hertz] \n\n',wc,wc/(2*pi));


%  ************    GRAFICACION RESULTADOS  PASA BAJOS *************
F1=figure(1);
   set(F1,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BAJOS KCTE');
   clf;
   
     

  a=imread('PASABAJOS.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(90,70,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(220,120,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(l1);
  Z3A_tx=strcat(Z3A_tx,' [H]');
  T3A= text(230,70,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(400,120,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte fc = ';
  FC1_tx=num2str(fc);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(290,175,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  %***************************************************************************

  %  ************    GRAFICO BODE  PASA BAJOS *************
  NUM= ro;
  DEN= ([l1*l1*c2,l1*c2*ro,2*l1,ro]);
  F2=figure(2);
   set(F2,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BAJOS KCTE');
   clf;
  bode(NUM,DEN);
  grid on;
  a=tf(NUM,DEN);
  F3=figure(3);
   set(F3,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BAJOS KCTE');
   clf;
  bodemag(a);
  grid on;
  hold on;
  plot(wc,0,'*r');
 end
 
 
 

%==========================================================================
% PASA ALTOS
%==========================================================================
 if (Tipo == 'pa')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA ALTOS K-CONSTANTE\n');
fprintf('                ======================================\n\n');
   
fc=input('Frecuencia de corte fc [Hertz] = ');
ro=input('Impedancia de carga Ro [Ohms] = ');
wc=2*pi*fc;
c1=1/(2*ro*wc);
l2=ro/(2*wc);
wc=1/(2*sqrt(c1*l2));


% Impresion de resultados Pasa Altos
fprintf('\n\nLa pulsacion de corte wc es %8.4f [rad/seg]\n\n',wc);
fprintf('El valor del capacitor serie C1 es de %8.6f [uF]  ---> 2 C1 es de %8.6f [uF] \n\n',c1*1e6,c1*2e6);
fprintf('El valor del inductor paralelo L2 es de %8.12f [mH]\n\n',l2*1e3);


% CALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA 

fprintf('\nCALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA\n\n');

c1=1/(ro*wc);
fprintf('2 C1 = 1 / Ro * wc = 1 / (%8.4f * %8.4f ) = %8.12f [uF] \n\n',ro,wc,c1*1e6);

l2=0.5*ro/wc;
fprintf('L2 = 0.5 * ro / wc ) = 0.5 * %8.4f / %8.6f ) = %8.6f [mH] \n\n',ro,wc,l2*1e3);

fprintf('\nCOMPROBACION\n\n');

Ro = sqrt(l2/(0.5*c1));
fprintf('Ro = sqrt ( L2 / C1 ) = sqrt ( %8.6f [H] / %8.12f [F] ) = %8.4f [Ohms] \n\n',l2,0.5*c1,Ro);
wc = 1 /(2 * sqrt( 0.5*c1 * l2));
fprintf('wc = 1 / (2 * sqrt( L2 * C1 )) = 1 / ( 2 * sqrt ( %8.6f [H] * %8.12f [F] )) = %8.4f [rad/seg] \n\n',l2,c1/2,wc);
fprintf('por lo tanto fc = wc / 2*pi = %8.6f [rad/seg] / ( 2* pi ) = %8.4f [Hertz] \n\n',wc,wc/(2*pi));

%  ************    GRAFICACION RESULTADOS    PASA ALTOS **************
F1=figure(1);
   set(F1,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BAJOS KCTE');
   clf;
  
  a=imread('PASAALTOS.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(c1);
  Z1A_tx=strcat(Z1A_tx,' [F]');
  T1A= text(90,75,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(l2);
  Z2A_tx=strcat(Z2A_tx,' [H]');
  T2A= text(210,120,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(230,75,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(395,120,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte fc = ';
  FC1_tx=num2str(fc);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(280,170,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  %***************************************************************************

  %  ************    GRAFICO BODE  PASA ALTOS *************
  NUM= ([ro,0,0,0]);
  DEN= ([ro,2/c1,ro/(c1*l2),1/(l2*c1*c1)]);
  F2=figure(2);
   set(F2,'color','w','NAME','DISEÑO FILTRO PASA ALTOS KCTE');
   clf;
  bode(NUM,DEN);
  grid on;
  a=tf(NUM,DEN);
  F3=figure(3);
   set(F3,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA ALTOS KCTE');
   clf;
  bodemag(a);
  grid on;
  hold on;
  plot(wc,0,'*r');
 end



%==========================================================================
% PASA BANDA
%========================================================================

 if (Tipo == 'PB')
clc;    
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA BANDA K-CONSTANTE\n');
fprintf('                ======================================\n\n');

fc1=input('Frecuencia de corte inferior fc1  [Hertz] = ');
fc2=input('Frecuencia de corte superior fc2 [Hertz] = ');
ro=input('Impedancia de carga Ro [Ohms] = ');
wc1=2*pi*fc1;
wc2=2*pi*fc2;
bw=wc2-wc1;
wo2=wc2*wc1;
c1=bw/(2*ro*wo2);
l1=2*ro/bw;
c2=2/(ro*bw);
l2=ro*bw/(2*wo2);



% Impresion de resultados Pasa Banda
fprintf('\n\nLa pulsacion de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsacion de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);
fprintf('La pulsacion de resonancia al cuadrado wo2 es %8.4f [(rad/seg)^2]\n\n',wo2);
fprintf('El ancho de banda BW es de %8.4f [rad/seg]\n\n',bw);

fprintf('El valor del inductor serie L1 es de %8.6f [mH]  ---> L1/2 es de %8.6f [mH] \n\n',l1*1e3,l1*1e3/2);
fprintf('El valor del capacitor serie C1 es de %8.12f [uF]  ---> 2*C1 es de %8.12f [uF]\n\n',c1*1e6,c1*2e6);
fprintf('El valor del inductor paralelo L2 es de %8.6f [mH]\n\n',l2*1e3);
fprintf('El valor del capacitor paralelo C2 es de %8.12f [uF]\n\n',c2*1e6);


% CALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA

fprintf('\n\nCALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA\n\n');

l1=1*ro/bw;
fprintf('L1/2 = 1 * Ro / BW = %8.4f / %8.4f = %8.6f [mH] \n\n',ro,bw,l1*1e3);

c1=1/(ro*wo2/bw);
fprintf('2*C1 = 1 / ( ro * wo2 / BW ) = %8.4f / ( %8.4f * %8.6f ) = %8.12f [uF] \n\n',bw,ro,wo2,c1*1e6);

l2=0.5*ro*bw/wo2;
fprintf('L2 = (0,5 * Ro * BW) / wo2 = ( 0,5 * %8.4f * %8.4f ) / %8.6f =  %8.6f [mH] \n\n',ro,bw,wo2,l2*1e3);

c2=2/(ro*bw);
fprintf('C2 = 2 / ( ro * BW ) = 2 / ( %8.4f * %8.6f ) = %8.12f [uF] \n\n',ro,bw,c2*1e6);

fprintf('\n\nCOMPROBACION\n\n');

Ro = sqrt(2*l1/(c2));
fprintf('Ro = sqrt ( L1 / C2 ) = sqrt ( %8.6f [H] / %8.12f [F] ) = %8.4f [Ohms] \n\n',2* l1,c2,Ro);

Ro = sqrt(2*l2/(c1));
fprintf('Ro = sqrt ( L2 / C1 ) = sqrt ( %8.6f [H] / %8.12f [F] ) = %8.4f [Ohms] \n\n',l2,c1/2,Ro);

bw = 2/(sqrt(2*l1*c2));
fprintf('BW = 2 / ( sqrt ( L1 * C2 )) = 2 / ( sqrt ( %8.6f [H] * %8.12f [F] )) = %8.4f [rad/seg] \n\n',2*l1,c2,bw);

wo2=1/((c1*l1));
fprintf('wo2 = 1 / (  L1 * C1 ) = 1 / ( %8.6f [H] * %8.12f [F] ) = %8.4f [(rad/seg)^2] \n\n',2*l1,c1/2,wo2);

wo2=1/((c2*l2));
fprintf('wo2 = 1 / ( L2 * C2 ) = 1 / ( %8.6f [H] * %8.12f [F] ) = %8.4f [(rad/seg)^2] \n\n',2*l2,c2/2,wo2);

%  ************    GRAFICACION RESULTADOS    PASA BANDA **************
F1=figure(1);
   set(F1,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BANDA KCTE');
   clf;
  
  a=imread('PASABANDA.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(55,70,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z1B_tx=num2str(c1);
  Z1B_tx=strcat(Z1B_tx,' [F]');
  T1B= text(110,80,Z1B_tx);
  set(T1B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(80,140,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(l2);
  Z2B_tx=strcat(Z2B_tx,' [H]');
  T2B= text(260,140,Z2B_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(230,80,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3B_tx=num2str(l1);
  Z3B_tx=strcat(Z3B_tx,'[H]');
  T3B= text(310,70,Z3B_tx);
  set(T3B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(455,120,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte inferior fc1 = ';
  FC1_tx=num2str(fc1);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(270,200,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte superior fc2 = ';
  FC2_tx=num2str(fc2);
  FC0_tx=strcat(FC0_tx,FC2_tx);
  FC2_tx=strcat(FC0_tx,' [Hz]');
  TFC2= text(270,210,FC2_tx);
  set(TFC2,'color','b','FontSize',12,'FontWeight','bold');
  %***************************************************************************
  
  %  ************    GRAFICO BODE  PASA BANDA *************
  NUM=([ro 0 0 0]);
    p6=l1*l1*c2;
    p5=ro*l1*c2;
    p4=l1*l1/l2+2*l1*c2/c1+2*l1;
    p3=l1*ro/l2+ro*c2/c1+ro;
    p2=2*l1/(c1*l2)+c2/(c1*c1)+2/c1;
    p1=ro/(c1*l2);
    p0=1/(c1*c1*l2);
    DEN=[p6 p5 p4 p3 p2 p1 p0];
      
    F2=figure(2);
   set(F2,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BANDA KCTE');
   clf;
  bode(NUM,DEN);
  grid on;
  a=tf(NUM,DEN);
  F3=figure(3);
   set(F3,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO PASA BANDA KCTE');
   clf;
  bodemag(a);
  grid on;
  hold on;
  plot(wc1,0,'*r');
  plot(wc2,0,'*r');
 end




%==========================================================================
% ELIMINA BANDA
%========================================================================

 if (Tipo == 'EB')
clc;    
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO ELIMINA BANDA K-CONSTANTE\n');
fprintf('                ======================================\n\n');

fc1=input('Frecuencia de corte inferior fc1  [Hertz] = ');
fc2=input('Frecuencia de corte superior fc2 [Hertz] = ');
ro=input('Impedancia de carga Ro [Ohms] = ');
wc1=2*pi*fc1;
wc2=2*pi*fc2;
bw=wc2-wc1;
wo2=wc2*wc1;
c1=1/(2*ro*bw);
l1=2*ro*bw/wo2;
c2=2*bw/(ro*wo2);
l2=ro/(2*bw);
wo2=1/((c1*l1));
wo2=1/((c2*l2));


% Impresion de resultados Elimina Banda
fprintf('\n\nLa pulsacion de corte inferior wc1 es %8.4f [rad/seg]\n\n',wc1);
fprintf('La pulsacion de corte superior wc2 es %8.4f [rad/seg]\n\n',wc2);
fprintf('La pulsacion de resonancia al cuadrado wo2 es %8.4f [(rad/seg)^2]\n\n',wo2);
fprintf('El ancho de banda BW es de %8.4f [rad/seg]\n\n',bw);

fprintf('El valor del inductor serie L1 es de %8.6f [mH]  ---> L1/2 es de %8.6f [mH] \n\n',l1*1e3,l1*1e3/2);
fprintf('El valor del capacitor serie C1 es de %8.12f [uF]  ---> 2*C1 es de %8.12f [uF]\n\n',c1*1e6,c1*2e6);
fprintf('El valor del inductor paralelo L2 es de %8.6f [mH]\n\n',l2*1e3);
fprintf('El valor del capacitor paralelo C2 es de %8.12f [uF]\n\n',c2*1e6);

% CALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA

fprintf('\n\nCALCULO POR NORMALIZACION Y TRANSFORMACION DE FRECUENCIA\n\n');

l1=1*ro*bw/wo2;

fprintf('L1/2 = 1 * Ro * BW / wo2= %8.4f * %8.4f / %8.4f = %8.6f [mH] \n\n',ro,bw,wo2,l1*1e3);

c1=1/(ro*bw);

fprintf('2*C1 = 1 / ( ro * BW ) = %8.4f * %8.6f  = %8.12f [uF] \n\n',ro,bw,c1*1e6);

l2=0.5*ro/bw;

fprintf('L2 = 0,5 * Ro / BW =  0,5 * %8.4f / %8.4f  =  %8.6f [mH] \n\n',ro,bw,l2*1e3);

c2=2*bw/(ro*wo2);

fprintf('C2 = 2 * BW / ( ro * wo2 ) = 2 * %8.4f / ( %8.4f * %8.6f ) = %8.12f [uF] \n\n',bw,ro,wo2,c2*1e6);


fprintf('\n\nCOMPROBACION\n\n');

Ro = sqrt(2*l1/(c2));
fprintf('Ro = sqrt ( L1 / C2 ) = sqrt ( %8.6f [H] / %8.12f [F] ) = %8.4f [Ohms] \n\n',2* l1,c2,Ro);

Ro = sqrt(2*l2/(c1));
fprintf('Ro = sqrt ( L2 / C1 ) = sqrt ( %8.6f [H] / %8.12f [F] ) = %8.4f [Ohms] \n\n',l2,c1/2,Ro);

bw = 1/ (2*sqrt(l2*c1/2));
fprintf('BW =1 / ( 2 * sqrt ( L2 * C1 )) = 1 / ( 2 * sqrt ( %8.6f [H] * %8.12f [F] )) = %8.4f [rad/seg] \n\n',l2,c1/2,bw);

wo2=1/((c1*l1));
fprintf('wo2 = 1 / (  L1 * C1 ) = 1 / ( %8.6f [H] * %8.12f [F] ) = %8.4f [(rad/seg)^2] \n\n',2*l1,c1/2,wo2);

wo2=1/((c2*l2));
fprintf('wo2 = 1 / ( L2 * C2 ) = 1 / ( %8.6f [H] * %8.12f [F] ) = %8.4f [(rad/seg)^2] \n\n',l2,c2,wo2);

%  ************    GRAFICACION RESULTADOS    ELIMINA BANDA **************
F1=figure(1);
   set(F1,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO ELIMINA BANDA KCTE');
   clf;
 
  a=imread('ELIMINABANDA.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(l1);
  Z1A_tx=strcat(Z1A_tx,' [H]');
  T1A= text(100,130,Z1A_tx);
  set(T1A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z1B_tx=num2str(c1);
  Z1B_tx=strcat(Z1B_tx,' [F]');
  T1B= text(100,70,Z1B_tx);
  set(T1B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2A_tx=num2str(c2);
  Z2A_tx=strcat(Z2A_tx,' [F]');
  T2A= text(265,230,Z2A_tx);
  set(T2A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z2B_tx=num2str(l2);
  Z2B_tx=strcat(Z2B_tx,' [H]');
  T2B= text(265,170,Z2B_tx);
  set(T2B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3A_tx=num2str(c1);
  Z3A_tx=strcat(Z3A_tx,' [F]');
  T3A= text(300,70,Z3A_tx);
  set(T3A,'color','b','FontSize',12,'FontWeight','bold');
  
  Z3B_tx=num2str(l1);
  Z3B_tx=strcat(Z3B_tx,' [H]');
  T3B= text(300,125,Z3B_tx);
  set(T3B,'color','b','FontSize',12,'FontWeight','bold');
  
  Z0A_tx=num2str(ro);
  Z0A_tx=strcat(Z0A_tx,' [Ohm]');
  T0A= text(495,200,Z0A_tx);
  set(T0A,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte inferior fc1 = ';
  FC1_tx=num2str(fc1);
  FC0_tx=strcat(FC0_tx,FC1_tx);
  FC1_tx=strcat(FC0_tx,' [Hz]');
  TFC1= text(270,280,FC1_tx);
  set(TFC1,'color','b','FontSize',12,'FontWeight','bold');
  
  FC0_tx='Frec. de corte superior fc2 = ';
  FC2_tx=num2str(fc2);
  FC0_tx=strcat(FC0_tx,FC2_tx);
  FC2_tx=strcat(FC0_tx,' [Hz]');
  TFC2= text(270,295,FC2_tx);
  set(TFC2,'color','b','FontSize',12,'FontWeight','bold');
  %***************************************************************************
 %  ************    GRAFICO BODE  ELIMINA BANDA *************
    z6=ro*l1*l1*c1*c1*l2*c2;
    z4=2*ro*l1*c1*l2*c2+ro*l1*l1*c1*c1;
    z2=ro*l2*c2+2*ro*l1*c1;
    z0=ro;
    
    NUM=([z6 0 z4 0 z2 0 z0]);
  
    p6=ro*l1*l1*c1*c1*l2*c2;
    p5=2*l1*l1*l2*c1*c2;
    p4=ro*l1*l1*c1*c2+ro*l1*l1*c1*c1+2*ro*l1*l2*c1*c2;
    p3=l1*l1*c2+2*l1*l2*c2+2*l1*l1*c1;
    p2=ro*l1*c2+ro*l2*c2+2*ro*l1*c1;
    p1=2*l1;
    p0=ro;
    
    DEN=[p6 p5 p4 p3 p2 p1 p0];
      
    F2=figure(2);
   set(F2,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO ELIMINA BANDA KCTE');
   clf;
  bode(NUM,DEN);
  grid on;
  a=tf(NUM,DEN);
  F3=figure(3);
   set(F3,'color',[0.914,0.91,0.737],'NAME','DISEÑO FILTRO ELIMINA BANDA KCTE');
   clf;
  bodemag(a);
  grid on;
  hold on;
  plot(wc1,0,'*r');
  plot(wc2,0,'*r');
 end
%***************************************************************************






fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a : \n');
fprintf('  jgarcia_abad@electronica.frc.utn.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');
