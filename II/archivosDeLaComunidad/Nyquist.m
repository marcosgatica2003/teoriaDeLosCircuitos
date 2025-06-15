format long e
echo off
warning off
clc;
fprintf('\n\n\n\n\n');
fprintf('                  Criterio de Nyquist \n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n En el presente programa se generar? en el plano de la variable P, un recinto definido por cuatro puntos');
fprintf('\n A, B, C y D y se evaluar? el comportamiento en el plano de la funci?n, de distintas funciones de transferencia'); 
fprintf('\n con raices dentro y fuera del recinto propuesto');
fprintf('\n\n');
fprintf(' Elija una de las opciones propuestas\n\n');
fprintf(' 1 - Un Cero fuera del recinto \n');
fprintf(' 2 - Un Polo fuera del recinto \n');
fprintf(' 3 - Un Cero dentro del recinto \n');
fprintf(' 4 - Un Polo dentro del recinto \n');
fprintf(' 5 - Un Cero y polo dentro del recinto \n');
fprintf(' 6 - Dos Cero y un Polo dentro del recinto \n');
fprintf(' 7 - Un Cero y dos Polos dentro del recinto \n\n');

opcion=input( '  Seleccione su opci?n ( 1, 2, . . . . . 7)  -->  ');  
fprintf('\n\n');
%Definici?n de recinto en plano P
A(1)=-1+i;    % Punto A
A(2)=-1-i;     % Punto B
A(3)=-4-i;     % Punto C
A(4)=-4+i;    % Punto D

F1=figure(opcion);
set(F1,'color','w');

% Graficaci?n de Plano P
subplot(1,2,1);
hold on;

% Graficaci?n recinto en Plano P
for x=1:4
P1=plot(A(x),'r.');
end

axis([-5 5 -1.5 1.5]);
grid on;
grid minor;

% Ejes X e Y en color negro y nomenclatura ejes
LX1=line([-5,5],[0,0]);
set(LX1,'color',[0,0,0],'linewidth',1);
LY1=line([0,0],[-2,2]);
set(LY1,'color',[0,0,0],'linewidth',1);
text(0,1.6,'jw');
text(0,-1.7,'-jw');
text(3.5,1.6,'PLANO P');

% Dibujo de recinto y nomenclatura de puntos A, B, C y D
Ap=line([-1,-1],[1,-1]);
set(Ap,'color',[1,0,0],'linewidth',2);
Tx_A=text(-1,1,'A');
set(Tx_A,'FontSize',[14],'FontName','Arial','FontWeight','bold');
Bp=line([-1,-4],[-1,-1]);
set(Bp,'color',[1,0,0],'linewidth',2);
Tx_B=text(-1,-1,'B');
set(Tx_B,'FontSize',[14],'FontName','Arial','FontWeight','bold');
Cp=line([-4,-4],[-1,1]);
set(Cp,'color',[1,0,0],'linewidth',2);
Tx_C=text(-4,-1,'C');
set(Tx_C,'FontSize',[14],'FontName','Arial','FontWeight','bold');
Dp=line([-4,-1],[1,1]);
set(Dp,'color',[1,0,0],'linewidth',2);
Tx_D=text(-4,1,'D');
set(Tx_D,'FontSize',[14],'FontName','Arial','FontWeight','bold');

% Graficaci?n de opcion de raiz elegida

if (opcion==1)  P1=plot(-0.5,0,'gh'); Titulo=text(2,-1.8,'CERO FUERA DEL RECINTO');  end
if (opcion==2)  P1=plot(-4.5,0,'r*') ; Titulo=text(2,-1.8,'POLO FUERA DEL RECINTO'); end
if (opcion==3)  P1=plot(-2,0,'gh');  Titulo=text(2,-1.8,'CERO DENTRO DEL RECINTO'); end
if (opcion==4)  P1=plot(-3,0,'r*');  Titulo=text(2,-1.8,'POLO DENTRO DEL RECINTO'); end
if (opcion==5)  P1=plot(-2,0,'gh');P2=plot(-3,0,'r*');  Titulo=text(2,-1.8,'CERO Y POLO DENTRO DEL RECINTO'); end
if (opcion==6)  P1=plot(-2,0,'gh');P2=plot(-3.5,0,'gh');P3=plot(-3,0,'r*');  Titulo=text(1,-1.8,'DOS CEROS Y UN POLO DENTRO DEL RECINTO'); end
if (opcion==7)  P1=plot(-2,0,'gh');P2=plot(-1.5,0,'r*');P3=plot(-3,0,'r*');  Titulo=text(1,-1.8,'UN CERO Y DOS POLOS DENTRO DEL RECINTO'); end
set(Titulo,'FontSize',[14],'FontName','Arial','FontWeight','bold','Color','b');
set(P1,'linewidth',3);
if ((opcion==5)||(opcion==6)||(opcion==7))   set(P2,'linewidth',3);  end
if ((opcion==6)||(opcion==7))  set(P3,'linewidth',3);  end

% Graficaci?n Plano F(p)
subplot(1,2,2);
hold on;


% Definici?n de F(p)
for x=1:4

if (opcion==1) F(x)=(0.5+A(x));   end
if (opcion==2)  F(x)=1/(4.5+A(x)); end
if (opcion==3) F(x)=(2+A(x));  end
if (opcion==4) F(x)=1/(3+A(x));  end
if (opcion==5) F(x)=(2+A(x))/(3+A(x));  end
if (opcion==6) F(x)=(2+A(x))*((3.5+A(x))/(3+A(x)));  end
if (opcion==7) F(x)=(2+A(x))/((1.5+A(x))*(3+A(x)));   end

plot(F(x),'r.');
end

axis([-4 4 -2 2]);
grid on;
%grid minor;


% Ejes X e Y en color negro y nomenclatura ejes
LX2=line([-5,5],[0,0]);
set(LX2,'color',[0,0,0],'linewidth',1);
LY2=line([0,0],[-2,2]);
set(LY2,'color',[0,0,0],'linewidth',1);
text(0,2.1,'Imag');
text(0,-2.3,'-Imag');
text(0,-2.3,'-Imag');

text(2.5,2.1,'PLANO F(p)');



A_FP=line([real(F(1)),real(F(1))],[imag(F(1)),imag(F(2))]);
set(A_FP,'color',[1,0,0],'linewidth',2);
Tx_A_FP=text(real(F(1)),imag(F(1)),'A');
set(Tx_A_FP,'FontSize',[14],'FontName','Arial','FontWeight','bold');

B_FP=line([real(F(2)),real(F(3))],[imag(F(2)),imag(F(3))]);
set(B_FP,'color',[1,0,0],'linewidth',2);
Tx_B_FP=text(real(F(2)),imag(F(2)),'B');
set(Tx_B_FP,'FontSize',[14],'FontName','Arial','FontWeight','bold');

C_FP=line([real(F(3)),real(F(4))],[imag(F(3)),imag(F(4))]);
set(C_FP,'color',[1,0,0],'linewidth',2);
Tx_C_FP=text(real(F(3)),imag(F(3)),'C');
set(Tx_C_FP,'FontSize',[14],'FontName','Arial','FontWeight','bold');

D_FP=line([real(F(4)),real(F(1))],[imag(F(4)),imag(F(1))]);
set(D_FP,'color',[1,0,0],'linewidth',2);
Tx_D_FP=text(real(F(4)),imag(F(4)),'D');
set(Tx_D_FP,'FontSize',[14],'FontName','Arial','FontWeight','bold');



fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a : \n');
fprintf('  jgarcia_abad@electronica.frc.utn.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');


