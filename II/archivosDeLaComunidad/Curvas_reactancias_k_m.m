format long e
echo off
warning off
clc;
fprintf('\n\n\n\n\n');
fprintf('                  CURVAS REACTANCIA PASA-BANDA Y ELIMINA-BANDA\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');
w=linspace(0,2,1000);
m=0.6;

%  ***********************************************************************
%            Filtro Pasa Bajos Kcte
%  ***********************************************************************

F1=figure(1);
set(F1,'color','w');

Z1K=w*2;
Z2K=-4./(w*2);
subplot(1,2,1);

G1=plot(w,Z1K);
set(G1,'color',[1,0,0],'linewidth',2);
hold on;
G2=plot(w,Z2K);
set(G2,'color',[0,0.8,0],'linewidth',2);
wc=2/sqrt(2*2);
plot(wc,0,'rO');
axis([0,2,-5,5]);
grid on;
grid minor;
G3=line([0,2],[0,0]);
set(G3,'color',[0,0,0],'linestyle','-','linewidth',1);

G4=line([0,wc],[0,0]);
set(G4,'color',[0,0,0],'linestyle','-','linewidth',3);

G5=line([wc,wc],[wc*2,-4./(wc*2)]);
set(G5,'color',[0.3,0,0.2],'linestyle','-','linewidth',2);

T1=title('Caracteristicas de reactancia Filtro pasa-bajos KCTE');
set(T1,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G6=text(1.9,0.2,'w');
set(G6,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G7=text(wc+0.05,0.2,'wc');
set(G7,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G8=text(1.7,4,'Z1K');
set(G8,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G9=text(1.7,-1.5,'4 * Z2K');
set(G9,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G10=text(0.25,-0.25,'BANDA PASANTE');
set(G10,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);

%  ***********************************************************************
%            Filtro Pasa Bajos m-Derivado
%  ***********************************************************************

Z1Km=Z1K*m; 
Z2Km=Z2K/m+4*Z1K*((1-m^2)/(4*m));
subplot(1,2,2);

G1=plot(w,Z1Km);
set(G1,'color',[1,0,0],'linewidth',2);
hold on;
G2=plot(w,Z2Km);
set(G2,'color',[0,0.8,0],'linewidth',2);
wc=2/sqrt(2*2);
plot(wc,0,'rO');
plot(1.25,0,'bO');
axis([0,2,-5,5]);
grid on;
grid minor;
G3=line([0,2],[0,0]);
set(G3,'color',[0,0,0],'linestyle','-','linewidth',1);

G4=line([0,wc],[0,0]);
set(G4,'color',[0,0,0],'linestyle','-','linewidth',3);

G5=line([wc,wc],[wc*2*m,-4./(wc*2*m)+4*2*wc*((1-m^2)/(4*m))]);
set(G5,'color',[0.3,0,0.2],'linestyle','-','linewidth',2);

T1=title('Caracteristicas de reactancia Filtro pasa-bajos m-Derivado');
set(T1,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G6=text(1.9,-0.2,'w');
set(G6,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G7=text(wc+0.05,0.2,'wc');
set(G7,'FontSize',[9],'FontName','Arial','FontWeight','bold');
G71=text(1.25+0.05,0.2,'w__|Xkm|__infinito');
set(G71,'FontSize',[11],'FontName','Arial','FontWeight','bold','color',[0,0,1]);

G8=text(1.4,2.2,'Z1Km');
set(G8,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G9=text(0.9,-2.2,'4 * Z2Km');
set(G9,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G10=text(0.25,-0.25,'BANDA PASANTE');
set(G10,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);
hold off;

%  ***********************************************************************
%            Filtro Pasa Altos Kcte
%  ***********************************************************************

F2=figure(2);
set(F2,'color','w');

Z1K=-1./(w*0.5);
Z2K=4*w*0.5;
subplot(1,2,1);

G21=plot(w,Z1K);
set(G21,'color',[1,0,0],'linewidth',2);
hold on;
G22=plot(w,Z2K);
set(G22,'color',[0,0.8,0],'linewidth',2);
wc=1/(2*sqrt(0.5*0.5));
plot(wc,0,'rO');
axis([0,2,-5,5]);
grid on;
grid minor;
G23=line([0,2],[0,0]);
set(G23,'color',[0,0,0],'linestyle','-','linewidth',1);

G24=line([wc,2],[0,0]);
set(G24,'color',[0,0,0],'linestyle','-','linewidth',3);

G25=line([wc,wc],[wc*2,-4./(wc*2)]);
set(G25,'color',[0.3,0,0.2],'linestyle','-','linewidth',2);

T2=title('Caracteristicas de reactancia Filtro pasa-altos KCTE');
set(T2,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G26=text(1.9,0.3,'w');
set(G26,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G27=text(wc+0.05,0.3,'wc');
set(G27,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G28=text(1.7,4.3,'4 * Z2K');
set(G28,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G29=text(1.7,-1.6,'Z1K');
set(G29,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G210=text(wc+0.25,-0.25,'BANDA PASANTE');
set(G210,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);

%  ***********************************************************************
%            Filtro Pasa Altos m-Derivado
%  ***********************************************************************

F2=figure(2);
set(F2,'color','w');

Z1Km=Z1K*m;
Z2Km=Z2K/m+4*Z1K*((1-m^2)/(4*m));
subplot(1,2,2);

G21=plot(w,Z1Km);
set(G21,'color',[1,0,0],'linewidth',2);
hold on;
G22=plot(w,Z2Km);
set(G22,'color',[0,0.8,0],'linewidth',2);
wc=1/(2*sqrt(0.5*0.5));
plot(wc,0,'rO');
plot(0.8,0,'bO');
axis([0,2,-5,5]);
grid on;
grid minor;
G23=line([0,2],[0,0]);
set(G23,'color',[0,0,0],'linestyle','-','linewidth',1);

G24=line([wc,2],[0,0]);
set(G24,'color',[0,0,0],'linestyle','-','linewidth',3);

G25=line([wc,wc],[wc*2*m,-wc*2*m]);
set(G25,'color',[0.3,0,0.2],'linestyle','-','linewidth',2);

T2=title('Caracteristicas de reactancia Filtro pasa-altos m-Derivado');
set(T2,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G26=text(1.9,0.2,'w');
set(G26,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G27=text(wc+0.05,0.2,'wc');
set(G27,'FontSize',[9],'FontName','Arial','FontWeight','bold');
G271=text(0.3,0.2,'w__|Xkm|__infinito');
set(G271,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,1]);

G28=text(1.7,4.3,'4 * Z2K');
set(G28,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G29=text(1.7,-1.6,'Z1K');
set(G29,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G210=text(wc+0.25,-0.25,'BANDA PASANTE');
set(G210,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);
hold off;

%  ***********************************************************************
%            Filtro Pasa Banda Kcte
%  ***********************************************************************

F3=figure(3);
set(F3,'color','w');

Z1K=w*2-1./(w*0.5);
Z2K=-(4*0.5./2)./(w*0.5-1./(w*2));
subplot(1,2,1);

G31=plot(w,Z1K);
set(G31,'color',[1,0,0],'linewidth',2);
hold on;
G32=plot(w,Z2K);
set(G32,'color',[0,0.8,0],'linewidth',2);
wo=1/sqrt(1*1);
wc1=0.6180339;
wc2=1.6180339;
Z1K_wc1=wc1*2-1./(wc1*0.5);
Z1K_wc2=wc2*2-1./(wc2*0.5);
plot(wo,0,'rO');
axis([0,2,-5,5]);
grid on;
grid minor;
G33=line([0,2],[0,0]);
set(G33,'color',[0,0,0],'linestyle','-','linewidth',1);

G34=line([wc1,wc2],[0,0]);
set(G34,'color',[0,0,0],'linestyle','-','linewidth',3);

G341=line([wc1,wc1],[-Z1K_wc1,Z1K_wc1]);
set(G341,'color',[0,0,0],'linestyle','-','linewidth',2);
G342=line([wc2,wc2],[-Z1K_wc2,Z1K_wc2]);
set(G342,'color',[0,0,0],'linestyle','-','linewidth',2);

G35=line([wo,wo],[-5,5]);
set(G35,'color',[0.3,0,0.2],'linestyle','-','linewidth',1);

T3=title('Caracteristicas de reactancia Filtro Pasa-Banda KCTE');
set(T3,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G36=text(1.9,0.2,'w');
set(G36,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G37=text(wo+0.05,0.2,'wo');
set(G37,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G371=text(wc1+0.02,0.2,'wc1');
set(G371,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G372=text(wc2+0.02,0.2,'wc2');
set(G372,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G38=text(1.8,3.5,'Z1K');
set(G38,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G39=text(0.4,4,'4 * Z2K');
set(G39,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);
G391=text(1.4,-4,'4 * Z2K');
set(G391,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G310=text(0.9,-0.25,'BANDA PASANTE');
set(G310,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);

%  ***********************************************************************
%            Filtro Pasa Banda m-Derivado
%  ***********************************************************************

Z1Km=Z1K*m;
Z2Km=Z2K/m+4*Z1K*((1-m^2)/(4*m));
subplot(1,2,2);

G31=plot(w,Z1Km);
set(G31,'color',[1,0,0],'linewidth',2);
hold on;
G32=plot(w,Z2Km);
set(G32,'color',[0,0.8,0],'linewidth',2);
wo=1/sqrt(1*1);
wc1=0.6180339;
wc2=1.6180339;
Z1K_wc1=wc1*2*m-1./(wc1*0.5/m)
Z1K_wc2=wc2*2-1./(wc2*0.5*m);
plot(wo,0,'rO');
axis([0,2,-5,5]);
grid on;
grid minor;
G33=line([0,2],[0,0]);
set(G33,'color',[0,0,0],'linestyle','-','linewidth',1);

G34=line([wc1,wc2],[0,0]);
set(G34,'color',[0,0,0],'linestyle','-','linewidth',3);

G341=line([wc1,wc1],[-Z1K_wc1,Z1K_wc1]);
set(G341,'color',[0,0,0],'linestyle','-','linewidth',2);
G342=line([wc2,wc2],[-Z1K_wc2,Z1K_wc2]);
set(G342,'color',[0,0,0],'linestyle','-','linewidth',2);

G35=line([wo,wo],[-5,5]);
set(G35,'color',[0.3,0,0.2],'linestyle','-','linewidth',1);

T3=title('Caracteristicas de reactancia Filtro Pasa-Banda KCTE');
set(T3,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G36=text(1.9,0.2,'w');
set(G36,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G37=text(wo+0.01,0.2,'wo');
set(G37,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G371=text(wc1+0.02,0.2,'wc1');
set(G371,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G372=text(wc2+0.02,0.2,'wc2');
set(G372,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G38=text(1.6,1.7,'Z1Km');
set(G38,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G39=text(0.4,4,'4 * Z2Km');
set(G39,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);
G391=text(1.4,-4,'4 * Z2Km');
set(G391,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G310=text(0.9,-0.25,'BANDA PASANTE');
set(G310,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);
hold off;

%  ***********************************************************************
%            Filtro Elimina Banda Kcte
%  ***********************************************************************

F4=figure(4);
set(F4,'color','w');

Z1K=(2./0.5)./(w*2-1./(w*0.5));
Z2K=-4*(w*0.5-1./(w*2));
subplot(1,2,1);

G41=plot(w,Z1K);
set(G41,'color',[1,0,0],'linewidth',2);
hold on;
G42=plot(w,Z2K);
set(G42,'color',[0,0.8,0],'linewidth',2);
wo=1/sqrt(1*1);
wc1=0.6180339;
wc2=1.6180339;
Z1K_wc1=wc1*2-1./(wc1*0.5);
Z1K_wc2=wc2*2-1./(wc2*0.5);
plot(wo,0,'rO');
axis([0,2,-5,5]);
grid on;
grid minor;
G43=line([0,2],[0,0]);
set(G43,'color',[0,0,0],'linestyle','-','linewidth',1);

G44=line([0,wc1],[0,0]);
set(G44,'color',[0,0,0],'linestyle','-','linewidth',3);
G440=line([wc2,2],[0,0]);
set(G440,'color',[0,0,0],'linestyle','-','linewidth',3);

G441=line([wc1,wc1],[-Z1K_wc1,Z1K_wc1]);
set(G441,'color',[0,0,0],'linestyle','-','linewidth',2);
G442=line([wc2,wc2],[-Z1K_wc2,Z1K_wc2]);
set(G442,'color',[0,0,0],'linestyle','-','linewidth',2);

G45=line([wo,wo],[-5,5]);
set(G45,'color',[0.3,0,0.2],'linestyle','-','linewidth',1);

T4=title('Caracteristicas de reactancia Filtro Elimina-Banda KCTE');
set(T4,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G46=text(1.9,0.3,'w');
set(G46,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G47=text(wo+0.05,0.3,'wo');
set(G37,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G471=text(wc1,0.3,'wc1');
set(G471,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G472=text(wc2,0.3,'wc2');
set(G372,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G48=text(0.6,3.4,'4 * Z2K');
set(G48,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G49=text(1.05,4.5,'Z1K');
set(G49,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);
G491=text(0.1,-1,'Z1K');
set(G491,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G410=text(1.5,-0.5,'BANDA PASANTE');
set(G410,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);

G411=text(0.1,0.5,'BANDA PASANTE');
set(G411,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);

%  ***********************************************************************
%            Filtro Elimina Banda m-Derivado
%  ***********************************************************************

Z1Km=Z1K*m;
Z2Km=Z2K/m+4*Z1K*((1-m^2)/(4*m));
subplot(1,2,2);

G41=plot(w,Z1Km);
set(G41,'color',[1,0,0],'linewidth',2);
hold on;
G42=plot(w,Z2Km);
set(G42,'color',[0,0.8,0],'linewidth',2);
wo=1/sqrt(1*1);
wc1=0.6180339;
wc2=1.6180339;
Z1K_wc1=wc1*2*m-1./(wc1*0.5/m)
Z1K_wc2=wc2*2-1./(wc2*0.5*m);
%Z1K_wc1=wc1*2-1./(wc1*0.5);
%Z1K_wc2=wc2*2-1./(wc2*0.5);
plot(wo,0,'rO');
axis([0,2,-5,5]);
grid on;
grid minor;
G43=line([0,2],[0,0]);
set(G43,'color',[0,0,0],'linestyle','-','linewidth',1);

G44=line([0,wc1],[0,0]);
set(G44,'color',[0,0,0],'linestyle','-','linewidth',3);
G440=line([wc2,2],[0,0]);
set(G440,'color',[0,0,0],'linestyle','-','linewidth',3);

G441=line([wc1,wc1],[-Z1K_wc1,Z1K_wc1]);
set(G441,'color',[0,0,0],'linestyle','-','linewidth',2);
G442=line([wc2,wc2],[-Z1K_wc2,Z1K_wc2]);
set(G442,'color',[0,0,0],'linestyle','-','linewidth',2);

G45=line([wo,wo],[-5,5]);
set(G45,'color',[0.3,0,0.2],'linestyle','-','linewidth',1);

T4=title('Caracteristicas de reactancia Filtro Elimina-Banda KCTE');
set(T4,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G46=text(1.9,0.3,'w');
set(G46,'FontSize',[12],'FontName','Arial','FontWeight','bold');

G47=text(wo+0.05,0.3,'wo');
set(G37,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G471=text(wc1,0.3,'wc1');
set(G471,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G472=text(wc2,0.3,'wc2');
set(G372,'FontSize',[9],'FontName','Arial','FontWeight','bold');

G48=text(1.7,3.2,'4 * Z2Km');
set(G48,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0.8,0]);

G49=text(1.05,4.5,'Z1Km'); 
set(G49,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);
G491=text(0.1,-1,'Z1Km');
set(G491,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);

G410=text(1.5,-0.5,'BANDA PASANTE');
set(G410,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);

G411=text(0.1,0.5,'BANDA PASANTE');
set(G411,'FontSize',[9],'FontName','Arial','FontWeight','bold','color',[0,0,0]);

fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a jgarciaabad@ubp.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');
