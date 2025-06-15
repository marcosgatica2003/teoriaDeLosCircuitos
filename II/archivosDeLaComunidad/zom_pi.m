format long e;

R=1;
m=0.6;

F1=figure(1);
 set(F1,'color','w','NAME','Comparación entre curvas Zo_T y Zo_Pi ');
   clf;
for (m=0.2:0.1:1)
% Trazo de curva para ( -4 < w < -1 )
w=linspace(-4,-0.999,1000);
Zo_Pi_K=(R./sqrt((1-(w.^2))));
Zo_Pi_m=Zo_Pi_K.*(1-w.^2.*(1-m.^2));
P1=plot(w,abs(Zo_Pi_m),'m',w,abs(Zo_Pi_K),'r');
set(P1,'linestyle','-','linewidth',2);
hold on;

% Trazo de curva para ( -1< w < +1 )
w=linspace(-0.999,0.999,1000);
Zo_Pi_K=(R./sqrt((1-(w.^2))));
Zo_Pi_m=Zo_Pi_K.*(1-(w.^2).*(1-m.^2));
P2=plot(w,(Zo_Pi_m),'m',w,abs(Zo_Pi_K),'r');
set(P2,'linestyle','-','linewidth',2);

% Trazo de curva para ( +1 < w < +4 )
w=linspace(0.999,4,1000);
Zo_Pi_K=(R./((1-(w.^2)).^0.5));
Zo_Pi_m=Zo_Pi_K.*(1-w.^2.*(1-m.^2));
P3=plot(w,-abs(Zo_Pi_m),'m',w,-abs(Zo_Pi_K),'r');
set(P3,'linestyle','-','linewidth',2);
end
w=linspace(-0.999,0.999,100);
Zo_T_K=R.*sqrt(1-w.*w);
P4=plot(w,Zo_T_K,'b');
set(P4,'linestyle','-','linewidth',2);
hold off; 

grid on;
LG1=legend('Zo_T','Zo_P_i','Zo_P_i_m',4);
set(LG1,'FontWeight',' bold ');
axis equal;
axis([-1,1,0,2]);
TI1=title('CURVAS DE Zo_P_i_m EN FILTROS m - DERIVADOS');
set(TI1,'color',[115/255,0,230/255],'FontWeight',' bold ');

hold on;
plot(0.8267,1,'bo');
plot(0.866,1.04,'bo');
plot(0.661,0.96,'bo');
line([-1,1],[1.04,1.04]);
line([-1,1],[0.96,0.96]);

text(1.1,1,'COVERTURA m=0,6');
