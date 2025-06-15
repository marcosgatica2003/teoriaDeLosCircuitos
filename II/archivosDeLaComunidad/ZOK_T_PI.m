format long e;

R=1;
m=1;

F1=figure(1);
 set(F1,'color','w','NAME','Comparación entre curvas Zo_T y Zo_Pi en función de |Xk|');
   clf;

% Trazo de curva para ( -4 < w < -1 )
w=linspace(-4,-0.999,100);
Zo_T_K=(R.*((1-(w.^2)).^0.5));
Zo_Pi_K=(R./((1-(w.^2)).^0.5));
P1=plot(w,-abs(Zo_T_K),'r',w,abs(Zo_Pi_K),'b');
set(P1,'linestyle','-','linewidth',3);
hold on;

% Trazo de curva para ( -1< w < +1 )
w=linspace(-0.999,0.999,100);
Zo_T_K=(R.*((1-(w.^2)).^0.5));
Zo_Pi_K=(R./((1-(w.^2)).^0.5));
P2=plot(w,abs(Zo_T_K),'r',w,abs(Zo_Pi_K),'b');
set(P2,'linestyle','-','linewidth',3);

% Trazo de curva para ( +1 < w < +4 )
w=linspace(0.999,4,100);
Zo_T_K=(R.*((1-(w.^2)).^0.5));
Zo_Pi_K=(R./((1-(w.^2)).^0.5));
P3=plot(w,abs(Zo_T_K),'r',w,-abs(Zo_Pi_K),'b');
set(P3,'linestyle','-','linewidth',3);
 
grid on;
LG1=legend('Zo_T','Zo_P_i',4);
set(LG1,'FontWeight',' bold ');
axis equal;
axis([-4,4,-3,3]);
TI1=title('Comparación entre curvas Zo_T y Zo_P_i en filtros K_C_T_E en función de |Xk|');
set(TI1,'color',[115/255,0,230/255],'FontSize',16,'FontWeight','bold');

% Trazo ejes
w=linspace(-4,4,1000);
P4=plot(w,0,'k');
set(P4,'linestyle','-','linewidth',2);
P5=line([0,0],[-3,3]);
set(P5,'color','k','linestyle','-','linewidth',2);
hold off;