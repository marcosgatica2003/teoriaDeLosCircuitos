format long e
echo off
warning('off')
clc;
fprintf('\n\n\n\n\n');
fprintf('                  Correspondencia entre Xk y Xm para m = 0.6 \n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');
w=linspace(-1.25,1.25,1000);
Xk=w;
m=0.6;
alfa=2*acosh(Xk);
beta=2*asin(Xk);
% plot(w,alfa,w,beta,'r');
Xkm=Xk.*m./sqrt(1-(Xk.*Xk)*(1-m*m));

F1=figure(1);
set(F1,'color','w');
G1=plot(Xk,Xkm);
set(G1,'color',[1,0,0],'linewidth',3);
hold on;
w=linspace(-5,-1.25,1000);
Xk=w;

Xkm=Xk.*m./sqrt(1-(Xk.*Xk)*(1-m*m));
G2=plot(Xk,abs(Xkm));
set(G2,'color',[1,0,0],'linewidth',3);
w=linspace(1.25,5,1000);
Xk=w;

Xkm=Xk.*m./sqrt(1-(Xk.*Xk)*(1-m*m));
G3=plot(Xk,-abs(Xkm));
set(G3,'color',[1,0,0],'linewidth',3);

G11=line([-5,5],[0,0]);
set(G11,'color',[0,0,0],'linestyle','-','linewidth',1.5);

G12=line([0,0],[-15,15]);
set(G12,'color',[0,0,0],'linestyle','-','linewidth',1.5);

G13=line([1.25,1.25],[-3,3]);
set(G13,'color',[0,0,1],'linestyle','--');
G14=line([-1.25,-1.25],[-3,3]);
set(G14,'color',[0,0,1],'linestyle','--');
axis([-5,5,-3,3]);
G15=text(4.8,.1,'Xk');
set(G15,'FontSize',[10],'FontName','Arial','FontWeight','bold');

G16=text(0.1,2.9,'Xkm');
set(G16,'FontSize',[10],'FontName','Arial','FontWeight','bold');

G17=title('Correspondencia Xkm a Xk para m = 0,6');

set(G17,'FontSize',[14],'FontName','Arial','FontWeight','bold');
g18=line([-5,5],[-m/sqrt(1-m*m),-m/sqrt(1-m*m)]);
set(g18,'color',[0,0,1],'linestyle','--');
g19=line([-5,5],[m/sqrt(1-m*m),m/sqrt(1-m*m)]);
set(g19,'color',[0,0,1],'linestyle','--');
G18=plot(1,1,'bo');
G19=plot(-1,-1,'bo');

G20=line([4,4],[0,-m/sqrt(1-m*m)]);
set(G20,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);
G21=text(3.2,-0.4,'Xkm = m / sqrt(1-m^2) = -0,75');
set(G21,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);

G22=line([-4,-4],[0,m/sqrt(1-m*m)]);
set(G22,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);
G23=text(-4.8,0.4,'Xkm = m / sqrt(1-m^2) = 0,75');
set(G23,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);

G24=line([-1.25,0],[-2.9,-2.9]);
set(G24,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);
G25=text(-1.5,-3.4,'Xk = 1 / sqrt(1-m^2) = -1,25');
set(G25,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);
G26=line([0,1.25],[-2.9,-2.9]);
set(G26,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);
G27=text(0.2,-3.4,'Xk = 1 / sqrt(1-m^2) = 1,25');
set(G27,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);
grid on;
hold off;