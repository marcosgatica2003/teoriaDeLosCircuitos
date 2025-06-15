format long e
echo off
clc;
fprintf('\n\n\n\n\n');
fprintf('                  DIAGRAMA POLAR DE CIRCUITO RCRC \n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');

echo off
fprintf('       _________/\\/\\/\\/\\/\\___________/\\/\\/\\/\\/\\_______________ \n');
fprintf('                R1  [Ohms]      |               R2  [Ohms]     |       \n');
fprintf('                                           |                                         |       \n');
fprintf('                                           |                                         |       \n');
fprintf('                                    ___|___                            ___|___    \n');
fprintf('                                   _______                           _______    \n');
fprintf('                                  C1    |   [F]                         C2   |   [F]    \n');
fprintf('                                           |                                         |       \n');
fprintf('                                           |                                         |       \n');
fprintf('       ________________|__________________|_____________ \n');

 
R1=input('\nValor del resistor R1 en [Ohms]? ');
C1=input('\nValor del capacitor C1 en [Faradios]? ');
R2=input('\nValor del resistor R2 en [Ohms]? ');
C2=input('\nValor del capator C2 en [Faradios]? ');


num=1/(R1*R2*C1*C2);
den=([1, ((R1*C2+R1*C1+R2*C2)*num),num]);
polos=roots(den);
F=tf(num,den)

fprintf('                     %8.4f \n',num);
fprintf('   F(p) = ------------------------------------------ \n',num);
fprintf('               ( S + %8.6f  )  ( S + %8.6f  )\n\n',-polos(2),-polos(1));

F1=figure(1);
   set(F1,'color','w');
   clf;
nyquist(num,den);
fprintf(' _____________________________________________________________\n');
fprintf('|              w               |      Real            |   Imaginario  |     Modulo     |     Fase           |\n');
fprintf('|==============|============|===========|===========|===========|\n');
x=0;
for w=0:0.5:1.5
if w==1.5 w=2; end
Fjw=freqresp(F,w);
Re_Fjw=real(Fjw);
Im_Fjw=imag(Fjw);
Mod_Fjw=abs(Fjw);
Fase_Fjw=angle(Fjw)*180/pi;
fprintf('|	  %3.4f          %8.4f            %8.4f            %8.4f           %8.4f      \n',w,Re_Fjw,Im_Fjw,Mod_Fjw,Fase_Fjw);
x=x+1;
   A([x])=line([0,Re_Fjw],[0,Im_Fjw]);
   set(A([x]),'color','r','linestyle','-');
   W1=' w=';
   W2=sprintf('%1.1f',w);
   W=strcat(W1,W2);
   text(Re_Fjw,Im_Fjw,W);
   
end
Fjw=freqresp(F,1e100);
Re_Fjw=real(Fjw);
Im_Fjw=imag(Fjw);
Mod_Fjw=abs(Fjw);
Fase_Fjw=angle(Fjw)*180/pi;
fprintf('|	 infinito          %8.4f             %8.4f             %8.4f          %8.3f      \n',Re_Fjw,Im_Fjw,Mod_Fjw,Fase_Fjw);

fprintf('|==============|============|===========|===========|===========|\n');
   x=x+1;
   A([x])=line([0,Re_Fjw],[0,Im_Fjw]);
   set(A([x]),'color','r','linestyle','-');
   
   text(Re_Fjw,Im_Fjw,' w=Infinito');

zoom on;
axis([-0.2,1.5,-0.6,0.6]);
axis equal;
T1=title('DIAGRAMA POLAR DE CIRCUITO RCRC');
set(T1,'color','b','fontweight','bold','fontsize',18);
F2=figure(2);
   set(F2,'color','w');
   clf;
bode(num,den);
grid on;
T2=title('DIAGRAMA DE BODE DE CIRCUITO RCRC');
set(T2,'color','b','fontweight','bold','fontsize',18);

fprintf('\n\n****************************************************************************\n');
fprintf('\n Se solicita reportar errores a jgarciaabad@ubp.edu.ar \n');
fprintf(' o a jgarcia_abad@electronica.frc.utn.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n****************************************************************************\n');