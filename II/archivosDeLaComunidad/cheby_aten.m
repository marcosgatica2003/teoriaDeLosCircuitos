format long e
echo off
clc;
fprintf('                  GRAFICACIÓN DEL RIPPLE EN APROXIMACIÓN DE CHEBYSHEV\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');
w=linspace(0,10,1000);
Amax=input('Ingrese el valor de Amax en dB -> ');
Epsilon=(10^(0.1*Amax)-1)^0.5;

F1=figure(1);
   set(F1,'color',[1,1,1],'NAME',(['ATENUACIÓN DE FILTRO PASABAJOS DE CHEBYSHEV CON Amax =  ',num2str(Amax),' dB']));
   clf;
for n=1:1:5  
   cn=cos(n*acos(w));
  
h=(1.*(1+((Epsilon^2).*(cn.^(2))))).^0.5;

hlog=20*log10(h);
     if(n==1) S= sprintf('%s','k');end
     if(n==2) S= sprintf('%s','m');end
     if(n==3) S= sprintf('%s','c');end
     if(n==4) S= sprintf('%s','r');end
     if(n==5) S= sprintf('%s','g');end
     
     G1=semilogx(w,hlog,S); 
     set(G1,'linestyle','-','linewidth',2);
         hold on;
end    
 T1=title(['Caracteristicas de rizado de Filtro Pasa-bajos de Chebyshef de orden 1 a 5 y ripple de ',num2str(Amax),' dB']);
 set(T1,'FontSize',[12],'FontName','Arial','FontWeight','bold');
 axis([0.1,10,0,120]);
 hold off
 grid on;
 
F2=figure(2);
   set(F2,'color',[1,1,1],'NAME',(['ZOOM DE ATENUACIÓN DE FILTRO PASABAJOS DE CHEBYSHEV CON Amax =  ',num2str(Amax),' dB']));
   clf;
for n=1:1:5  
   cn=cos(n*acos(w));
  
h=(1.*(1+((Epsilon^2).*(cn.^(2))))).^0.5;

hlog=20*log10(h);
     if(n==1) S= sprintf('%s','k');end
     if(n==2) S= sprintf('%s','m');end
     if(n==3) S= sprintf('%s','c');end
     if(n==4) S= sprintf('%s','r');end
     if(n==5) S= sprintf('%s','g');end
     
     G2=semilogx(w,hlog,S); 
     set(G2,'linestyle','-','linewidth',2);
         hold on;
end    
 T2=title(['Zoom de caracteristicas de rizado de Filtro Pasa-bajos de Chebyshef de orden 1 a 5 y ripple de ',num2str(Amax),' dB']);
 set(T2,'FontSize',[12],'FontName','Arial','FontWeight','bold');
 axis([0.1,10,0,5]);
 hold off
 grid on;
     
   