format long e
echo off
clc;
fprintf('\n\n\n\n\n');
fprintf('                  DIAGRAMA POLAR Y DE BODE DE COMPENSADOR DE ATRAZO-ADELANTO DE FASE\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');
C1=100e-6;
R1=20000;
C2=281.25e-6;
R2=1778;

  %************    GRAFICACION CIRCUITO DE COMPENSADOR DE ATRAZO-ADELANTO DE FASE *************
F1=figure(1);
   set(F1,'color',[0.914,0.91,0.737],'NAME','CIRCUITO DE COMPENSADOR DE ATRAZO-ADELANTO DE FASE');
   clf; 
   
   a=imread('\POLAR_AT_AD.jpg' );
   image(a);
   axis off;
 T1=Title('CIRCUITO COMPENSADOR DE ATRAZO-ADELANTO DE FASE');
set(T1,'color','b','fontweight','bold','fontsize',14);  
     

 
 
  
  %***************************************************************************
 



num=poly([-0.5,-2]);
den=poly([-0.125,-8]);
F=tf(num,den)

fprintf('                ( S + 0,5 )  ( S + 2 ) \n');
fprintf('   F(p) = ------------------------------------------ \n',num);
fprintf('               ( S + 0,125 )  ( S + 8 )\n\n');

F2=figure(2);
   set(F2,'color','w','NAME','DIAGRAMA POLAR DE COMPENSADOR DE ATRAZO-ADELANTO DE FASE');
   clf;
nyquist(num,den);
fprintf(' _______________________________________________________________________________\n');
fprintf('|      w        |      Real     |   Imaginario  |     Modulo    |     Fase      |\n');
fprintf('|===============|===============|===============|===============|===============|\n');

x=0;
for w=0:0.1:0.5

Fjw=freqresp(F,w);
Re_Fjw=real(Fjw);
Im_Fjw=imag(Fjw);
Mod_Fjw=abs(Fjw);
Fase_Fjw=angle(Fjw)*180/pi;
if w==0 Fase_Fjw=0; end
fprintf('|	  %3.3f     |    %6.3f     |    %6.3f     |    %6.3f     |  %8.3f     |\n',w,Re_Fjw,Im_Fjw,Mod_Fjw,Fase_Fjw);
x=x+1;
   A([x])=line([0,Re_Fjw],[0,Im_Fjw]);
   set(A([x]),'color','r','linestyle','-');
   W1=' w=';
   W2=sprintf('%1.1f',w);
   W=strcat(W1,W2);
   TP2=text(Re_Fjw,Im_Fjw-.01,W);
   set(TP2,'color','k','fontweight','bold','fontsize',8);

end

Fjw=freqresp(F,1);
Re_Fjw=real(Fjw);
Im_Fjw=imag(Fjw);
Mod_Fjw=abs(Fjw);
Fase_Fjw=angle(Fjw)*180/pi;
fprintf('|	    1       |    %6.3f     |    %6.3f     |    %6.3f     |    % 6.3f     |\n',Re_Fjw,Im_Fjw,Mod_Fjw,Fase_Fjw);
x=x+1;
   A([x])=line([0,Re_Fjw],[0,Im_Fjw]);
   set(A([x]),'color','r','linestyle','-');
   
   TP3=text(Re_Fjw,Im_Fjw*0.1,' w=1');
   set(TP3,'color','k','fontweight','bold','fontsize',8);
x=0;
for w=2:2:10
Fjw=freqresp(F,w);
Re_Fjw=real(Fjw);
Im_Fjw=imag(Fjw);
Mod_Fjw=abs(Fjw);
Fase_Fjw=angle(Fjw)*180/pi;
if w<10 
fprintf('|	  %3.3f     |    %6.3f     |    %6.3f     |    %6.3f     |  %8.3f     |\n',w,Re_Fjw,Im_Fjw,Mod_Fjw,Fase_Fjw);
else
fprintf('|	  %3.3f    |    %6.3f     |    %6.3f     |    %6.3f     |  %8.3f     |\n',w,Re_Fjw,Im_Fjw,Mod_Fjw,Fase_Fjw);
end
x=x+1;
   A([x])=line([0,Re_Fjw],[0,Im_Fjw]);
   set(A([x]),'color','r','linestyle','-');
   W1=' w=';
   W2=sprintf('%1.0f',w);
   W=strcat(W1,W2);
   TP4=text(Re_Fjw,Im_Fjw+.01,W);
   set(TP4,'color','k','fontweight','bold','fontsize',8);

end
Fjw=freqresp(F,1e100);
Re_Fjw=real(Fjw);
Im_Fjw=imag(Fjw);
Mod_Fjw=abs(Fjw);
Fase_Fjw=angle(Fjw)*180/pi;
fprintf('|	 Infinito   |    %6.3f     |    %6.3f     |    %6.3f     |    % 6.3f     |\n',Re_Fjw,Im_Fjw,Mod_Fjw,Fase_Fjw);
x=x+1;
   A([x])=line([0,Re_Fjw],[0,Im_Fjw]);
   set(A([x]),'color','r','linestyle','-');
   
   TP5=text(Re_Fjw,Im_Fjw+.02,' w=Infinito');
   set(TP5,'color','k','fontweight','bold','fontsize',8);
fprintf('|===============|===============|===============|===============|===============|\n');
zoom on;
axis([-0.1,1.2,-0.4,0.4]);
axis equal;
T2=Title('DIAGRAMA POLAR DE CIRCUITO COMPENSADOR DE ATRAZO-ADELANTO DE FASE');
set(T2,'color','b','fontweight','bold','fontsize',14);
F3=figure(3);
   set(F3,'color','w','NAME','DIAGRAMA DE BODE DE CIRCUITO DE COMPENSADOR DE ATRAZO-ADELANTO DE FASE');
   clf;
bode(num,den);
grid on;
T3=Title('DIAGRAMA DE BODE DE CIRCUITO COMPENSADOR DE ATRAZO-ADELANTO DE FASE');
set(T3,'color','b','fontweight','bold','fontsize',14);


fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a jgarciaabad@ubp.edu.ar \n');
fprintf(' o a jgarciaabad@electronica.frc.utn.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');