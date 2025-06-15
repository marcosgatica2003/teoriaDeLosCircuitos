format long e
echo off
clc;
fprintf('                  GRAFICACIÓN DEL RIPPLE EN APROXIMACIÓN DE CHEBYSHEV\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');
Amax=input('Ingrese el valor de Amax en db  ->  ');
Epsilon=sqrt(10^(0.1*Amax)-1)
w=linspace(0,10,1000);
F1=figure(1);
set(F1,'color','w');
h=sqrt(1+Epsilon^2*(8.*w.^4-8.*w.*w+1).^2);
  %h=(1./(1+(E^2).*cn.^(2*n))).^0.5;
hlog=-20*log10(h);
     P1=semilogx(w,hlog,'b'); 
     set(P1,'color','r','linestyle','-','linewidth',2);
         hold on;
 
 T1=title(['Caracteristicas de rizado de Filtro Pasa-bajos de Chebyshef de orden n=4 y ripple de ',num2str(Amax),' dB']);
 set(T1,'FontSize',[12],'FontName','Arial','FontWeight','bold');
 
 hold off;
 grid on;
     
 F2=figure(2);
set(F2,'color','w');
h=sqrt(1+Epsilon^2*(8.*w.^4-8.*w.*w+1).^2);
  
hlog=-20*log10(h);
     P2=semilogx(w,hlog,'b'); 
     set(P2,'color','r','linestyle','-','linewidth',2);
         hold on;
       
 T2=title(['Zoom de caracteristicas de rizado de Filtro Pasa-bajos de Chebyshef de orden n=4 y ripple de ',num2str(Amax),' dB']);
 set(T2,'FontSize',[12],'FontName','Arial','FontWeight','bold');
 axis([0.01,2,-5,0]);
 hold off;
 grid on;
   