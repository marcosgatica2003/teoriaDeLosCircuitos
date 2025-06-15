format long
echo off
clc;
fprintf('\n\n\n\n');
fprintf('                  CONECCION DE CUADRIPOLOS');
fprintf('\n\n');
fprintf('            |------|        |------|\n');
fprintf('     0------|  Z1  |----|---|  Z3  |------0\n');
fprintf('            |------|    |   |------|\n');
fprintf('                      |-|-|         \n');
fprintf('                      |   |         \n');
fprintf('                      | Z2|         \n');
fprintf('                      |   |         \n');
fprintf('                      |-|-|         \n');
fprintf('                        |           \n');
fprintf('     O------------------|-----------------O\n\n');
Z1A=input('     Valor de Z1 del cuadripolo A ? ');
Z2A=input('     Valor de Z2 del cuadripolo A ? ');
Z3A=input('     Valor de Z3 del cuadripolo A ? ');

Z11A= Z1A+Z2A;
Z12A=Z2A;
Z21A=Z12A;
Z22A=Z2A+Z3A;
AZ_A=(Z11A.*Z22A)-(Z12A.^2); %Determinante Z cuadripolo "A"
%Matriz de Parametros de Impedancia del cuadripolo "A"
MAT_Z_A=([Z11A Z12A;Z21A Z22A]);

%Calculo de parámetros de Admitancia del cuadripolo "A"
Y11A=Z22A/AZ_A;
Y12A=Z12A/AZ_A;
Y21A=Y12A;
Y22A=Z11A/AZ_A;
%Matriz de Parametros de Impedancia del cuadripolo "A"
MAT_Y_A=([Y11A Y12A;Y21A Y22A]);


% Calculo de los parámetros de Transmisión Directa del cuadripolo "A"
A_A=Z11A/Z12A;
B_A=AZ_A/Z12A;
C_A=1/Z12A;
D_A=Z22A/Z12A;

%Matriz de Parametros de transmision de cuadripolo "A" 
MAT_ABCD_A=([A_A, B_A;C_A ,D_A]);

fprintf('\n\n');
Z1B=input('     Valor de Z1 del cuadripolo B ? ');
Z2B=input('     Valor de Z2 del cuadripolo B ? ');
Z3B=input('     Valor de Z3 del cuadripolo B ? ');


Z11B= Z1B+Z2B;
Z12B=Z2B;
Z21B=Z12B;
Z22B=Z2B+Z3B;
AZ_B=(Z11B.*Z22B)-(Z12B.^2);

%Matriz de Parametros de Impedancia del cuadripolo "B"
MAT_Z_B=([Z11B Z12B;Z21B Z22B]);

%Calculo de parámetros de Admitancia del cuadripolo "B"
Y11B=Z22A/AZ_B;
Y12B=Z12B/AZ_B;
Y21B=Y12B;
Y22B=Z11B/AZ_B;
%Matriz de Parametros de Admitancia del cuadripolo "B"
MAT_Y_B=([Y11B Y12B;Y21B Y22B]);

% Calculo de los parámetros de Transmisión Directa del cuadripolo "B"
A_B=Z11B/Z12B;
B_B=AZ_B/Z12B;
C_B=1/Z12B;
D_B=Z22B/Z12B;

%Matriz de Parametros de transmision de cuadripolo "B"
MAT_ABCD_B=([A_B, B_B;C_B ,D_B]);

%******************************************************************************************************************************************
%Coneccion en serie
MAT_Z_TOTAL=MAT_Z_A+MAT_Z_B;

fprintf('\n\n');
fprintf('     CONECCION EN SERIE\n');
fprintf('     ~~~~~~~~~~~~~~~~~~\n\n');
fprintf('                   | Z11_A   Z12_A |     | Z11_B   Z12_B |     | %8.4f   %8.4f   |      | %8.4f   %8.4f   |      \n',Z11A,Z12A,Z11B,Z12B);
fprintf('     MAT_Z_TOTAL = | Z21_A   Z22_A |  +  | Z21_B   Z22_B |  =  | %8.4f   %8.4f   |  +   | %8.4f   %8.4f   |      \n',Z21A,Z22A,Z21B,Z22B);
fprintf('\n\n');

fprintf('                   | %8.4f   %8.4f   |      \n',MAT_Z_TOTAL(1),MAT_Z_TOTAL(2));
fprintf('     MAT_Z_TOTAL = | %8.4f   %8.4f   |      \n',MAT_Z_TOTAL(3),MAT_Z_TOTAL(4));



Z2_EZ=MAT_Z_TOTAL(2);
Z1_EZ=MAT_Z_TOTAL(1)-Z2_EZ;
Z3_EZ=MAT_Z_TOTAL(4)-Z2_EZ;

fprintf('\n\n');
fprintf('     CUADRIPOLO "T" EQUIVALENTE :\n');
fprintf('                                   Z1_Equiv = %8.4f  [Ohms] \n\n',Z1_EZ);
fprintf('                                   Z2_Equiv = %8.4f  [Ohms] \n\n',Z2_EZ);
fprintf('                                   Z3_Equiv = %8.4f  [Ohms] \n\n',Z3_EZ);

%******************************************************************************************************************************************
%Coneccion en Paralelo

MAT_Y_TOTAL=MAT_Y_A+MAT_Y_B;

fprintf('\n\n');
fprintf('     CONECCION EN PARALELO\n');
fprintf('     ~~~~~~~~~~~~~~~~~~~~~\n\n');
fprintf('                   | Y11_A   Y12_A |     | Y11_B   Y12_B |     | %8.4f   %8.4f   |      | %8.4f   %8.4f   |      \n',Y11A,Y12A,Y11B,Y12B);
fprintf('     MAT_Y_TOTAL = | Y21_A   Y22_A |  +  | Y21_B   Y22_B |  =  | %8.4f   %8.4f   |  +   | %8.4f   %8.4f   |      \n',Y21A,Y22A,Y21B,Y22B);
fprintf('\n\n');

fprintf('                   | %8.4f   %8.4f   |      \n',MAT_Y_TOTAL(1),MAT_Y_TOTAL(2));
fprintf('     MAT_Y_TOTAL = | %8.4f   %8.4f   |      \n',MAT_Y_TOTAL(3),MAT_Y_TOTAL(4));

DET_Y=det(MAT_Y_TOTAL);

Z11_P=MAT_Y_TOTAL(4)/DET_Y;
Z12_P=MAT_Y_TOTAL(2)/DET_Y;
Z21_P=Z12_P;
Z22_P=MAT_Y_TOTAL(1)/DET_Y;

MAT_Z_TOTAL=([Z11_P Z12_P;Z21_P Z22_P]);

fprintf('\n\n');
fprintf('                   | %8.4f   %8.4f   |      \n',MAT_Z_TOTAL(1),MAT_Z_TOTAL(2));
fprintf('     MAT_Z_TOTAL = | %8.4f   %8.4f   |      \n',MAT_Z_TOTAL(3),MAT_Z_TOTAL(4));

Z2_EP=Z12_P;
Z1_EP=Z11_P-Z2_EP;
Z3_EP=Z22_P-Z2_EP;

fprintf('\n\n');
fprintf('     CUADRIPOLO "T" EQUIVALENTE :\n');
fprintf('                                   Z1_Equiv = %8.4f  [Ohms] \n\n',Z1_EP);
fprintf('                                   Z2_Equiv = %8.4f  [Ohms] \n\n',Z2_EP);
fprintf('                                   Z3_Equiv = %8.4f  [Ohms] \n\n',Z3_EP);

%******************************************************************************************************************************************
%Coneccion en Cascada

MAT_ABCD_TOTAL=MAT_ABCD_A*MAT_ABCD_B;

fprintf('\n\n');
fprintf('     CONECCION EN CASCADA\n');
fprintf('     ~~~~~~~~~~~~~~~~~~~~\n\n');
fprintf('                       | A_A   B_A |     | A_B   B_B |     | %8.4f   %8.4f   |     | %8.4f   %8.4f   |      \n',A_A,B_A,A_B,B_B);
fprintf('     MAT_ABCDZ_TOTAL = | C_A   D_A |  *  | C_B   D_B |  =  | %8.4f   %8.4f   |  *  | %8.4f   %8.4f   |      \n',C_A,D_A,C_B,D_B);
fprintf('\n\n');

fprintf('                      | %8.4f   %8.4f   |      \n',MAT_ABCD_TOTAL(1),MAT_ABCD_TOTAL(3));
fprintf('     MAT_ABCD_TOTAL = | %8.4f   %8.4f   |      \n',MAT_ABCD_TOTAL(2),MAT_ABCD_TOTAL(4));



Z2_EA=1/MAT_ABCD_TOTAL(2);
Z1_EA=MAT_ABCD_TOTAL(1)*Z2_EA-Z2_EA;
Z3_EA=MAT_ABCD_TOTAL(4)*Z2_EA-Z2_EA;

fprintf('\n\n');
fprintf('     CUADRIPOLO "T" EQUIVALENTE :\n');
fprintf('                                   Z1_Equiv = %8.4f  [Ohms] \n\n',Z1_EA);
fprintf('                                   Z2_Equiv = %8.4f  [Ohms] \n\n',Z2_EA);
fprintf('                                   Z3_Equiv = %8.4f  [Ohms] \n\n',Z3_EA);


%  ************    GRAFICACION   **************
F1=figure(1);
   set(F1,'color',[0.914,0.91,0.737],'NAME','CONECCIONES DE CUADRIPOLOS');
   clf;
   
     
  subplot(4,2,1); 
  a=imread('\Cuad_A.jpg' );
   image(a);
   axis off;
 
  Z1A_tx=num2str(Z1A);
  Z1A_tx=strcat(Z1A_tx,' [Ohm]');
  T1A= text(50,12,Z1A_tx);
  set(T1A,'color','b','FontWeight','bold');
  
  Z2A_tx=num2str(Z2A);
  Z2A_tx=strcat(Z2A_tx,' [Ohm]');
  T2A= text(190,75,Z2A_tx);
  set(T2A,'color','b','FontWeight','bold');
  
  Z3A_tx=num2str(Z3A);
  Z3A_tx=strcat(Z3A_tx,' [Ohm]');
  T3A= text(220,12,Z3A_tx);
  set(T3A,'color','b','FontWeight','bold');
  
  subplot(4,2,2);
   a=imread('\Cuad_B.jpg' );
   image(a);
   axis off;
  
  Z1B_tx=num2str(Z1B);
  Z1B_tx=strcat(Z1B_tx,' [Ohm]');
  T1B= text(50,12,Z1B_tx);
  set(T1B,'color','b','FontWeight','bold');
  
  Z2B_tx=num2str(Z2B);
  Z2B_tx=strcat(Z2B_tx,' [Ohm]');
  T2B= text(190,75,Z2B_tx);
  set(T2B,'color','b','FontWeight','bold');
  
  Z3B_tx=num2str(Z3B);
  Z3B_tx=strcat(Z3B_tx,' [Ohm]');
  T3B= text(220,12,Z3B_tx);
  set(T3B,'color','b','FontWeight','bold');
  
  %***************************************************************************
  
  subplot(4,1,2);
   a=imread('\serie.jpg' );
   imagesc(a);
   axis off;
  T2T=title('CONECCION SERIE');
  set(T2T,'color','b','FontWeight','bold','BackgroundColor','w');
  
  Z1_EZ_tx=num2str(Z1_EZ);
  Z1_EZ_tx=strcat(Z1_EZ_tx,' [Ohm]');
  T1_EZ= text(500,15,Z1_EZ_tx);
  set(T1_EZ,'color','b','FontWeight','bold');
  
  Z2_EZ_tx=num2str(Z2_EZ);
  Z2_EZ_tx=strcat(Z2_EZ_tx,' [Ohm]');
  T2_EZ= text(650,85,Z2_EZ_tx);
  set(T2_EZ,'color','b','FontWeight','bold');
  
  Z3_EZ_tx=num2str(Z3_EZ);
  Z3_EZ_tx=strcat(Z3_EZ_tx,' [Ohm]');
  T3_EZ= text(670,15,Z3_EZ_tx);
  set(T3_EZ,'color','b','FontWeight','bold');
   
  %**********************************************************************
   
   subplot(4,1,3);
   a=imread('\paralelo.jpg' );
   image(a);
   axis off;
  T3T=title('CONECCION PARALELO');
  set(T3T,'color','b','FontWeight','bold','BackgroundColor','w');

  Z1_EP_tx=num2str(Z1_EP);
  Z1_EP_tx=strcat(Z1_EP_tx,' [Ohm]');
  T1_EP= text(500,20,Z1_EP_tx);
  set(T1_EP,'color','b','FontWeight','bold');
  
  Z2_EP_tx=num2str(Z2_EP);
  Z2_EP_tx=strcat(Z2_EP_tx,' [Ohm]');
  T2_EP= text(650,100,Z2_EP_tx);
  set(T2_EP,'color','b','FontWeight','bold');
  
  Z3_EP_tx=num2str(Z3_EP);
  Z3_EP_tx=strcat(Z3_EP_tx,' [Ohm]');
  T3_EP= text(670,20,Z3_EP_tx);
  set(T3_EP,'color','b','FontWeight','bold');
  
  %********************************************************************** 
  
   SB4=subplot(4,1,4);
   set(SB4,'color',[1,0,0]);
   a=imread('\cascada.jpg' );
   image(a);
   axis off;
   T4T=title('CONECCION EN CASCADA');
   set(T4T,'color','b','FontWeight','bold','BackgroundColor','w');
  
  Z1_EA_tx=num2str(Z1_EA);
  Z1_EA_tx=strcat(Z1_EA_tx,' [Ohm]');
  T1_EA= text(500,20,Z1_EA_tx);
  set(T1_EA,'color','b','FontWeight','bold');
  
  Z2_EA_tx=num2str(Z2_EA);
  Z2_EA_tx=strcat(Z2_EA_tx,' [Ohm]');
  T2_EA= text(650,100,Z2_EA_tx);
  set(T2_EA,'color','b','FontWeight','bold');
  
  Z3_EA_tx=num2str(Z3_EA);
  Z3_EA_tx=strcat(Z3_EA_tx,' [Ohm]');
  T3_EA= text(670,20,Z3_EA_tx);
  set(T3_EA,'color','b','FontWeight','bold');
   
  fprintf('\n\n');
fprintf('\n	***************************************************************************\n');
fprintf(' 	* Se solicita reportar errores a jgarcia_abad@electronica.frc.utn.edu.ar  *\n');
fprintf(' 	*                                                                         *\n');
fprintf(' 	*                          o     jgarciaabad@iua.edu.edu.ar               *\n');
fprintf('   	* GRACIAS                                                                 *\n');
fprintf('	***************************************************************************\n');
