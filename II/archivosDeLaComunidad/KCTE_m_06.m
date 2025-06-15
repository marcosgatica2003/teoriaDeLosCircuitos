w=linspace(-10,10,1000);
warning off

F1=figure(1);
   set(F1,'color','w','NAME','CURVAS DE ATENUACION DE FILTROS KCTE, M-DERIVADO Y COMPUESTO CON  m = 0,6');
hold on;
m=0.6;

xkm= m.*w./(((1-(1-m.^2).*(w.^2)).^0.5));
%alfak=2*acosh(w);
%alfam=2*acosh(xkm);
%betak=2*asin(w);
betam=2*asin(xkm);
%a=2*asinh(m/(1-m^2)^0.5);
%alfacomp=alfak+alfam;
%P1=plot(w,alfak,'b',w,alfam,'m',w,betak,'c',w,betam,'r',w,alfacomp,'g');
P1=plot(w,betam,'r');

%set(P1,'linestyle','-','linewidth',3);
%G10=line([-5,5],[a,a]);
%set(G10,'color',[0,0,1],'linestyle','--','linewidth',1);

TI1=title('CURVAS DE ATENUACION Y FASE DE FILTROS KCTE, M-DERIVADO Y COMPUESTO CON  m = 0,6');
%set(TI1,'color',[0,0,0],'FontWeight',' bold ','FontSize',[14]);
%axis([-4,4,-4,6]);
%G11=line([-5,5],[0,0]);
%set(G11,'color',[0,0,0],'linestyle','-','linewidth',1.5);

%G12=line([0,0],[-4,6]);
%set(G12,'color',[0,0,0],'linestyle','-','linewidth',1.5);

%G13=line([1.25,1.25],[-4,6]);
%set(G13,'color',[0,0,1],'linestyle','--');

%G14=line([-1.25,-1.25],[-4,6]);
%set(G14,'color',[0,0,1],'linestyle','--');

%G15=text(3,4.2,'ALFA Kcte');
%set(G15,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,0,1]);

%G16=text(3,1.8,'ALFA mder');
%set(G16,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,1]);

%G17=text(2.5,5.7,'ALFA Kcte + ALFA mder');
%set(G17,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,1,0]);

%G18=text(3,3,'BETA Kcte');
%set(G18,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[0,1,1]);

G19=text(3,-0.3,'BETA mder');
set(G19,'FontSize',[12],'FontName','Arial','FontWeight','bold','color',[1,0,0]);


%G20=line([3,3],[0,2*asinh(m/sqrt(1-m*m))]);
%set(G20,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);

%G21=text(2.2,0.7,'ALFAm = 2 asinh ( m / sqrt(1-m^2)) = 1.386');
%set(G21,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);

%G22=line([-3,-3],[0,2*asinh(m/sqrt(1-m*m))]);
%set(G22,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);

%G23=text(-3.8,0.7,'ALFAm = 2 asinh ( m / sqrt(1-m^2)) = 1.386');
%set(G23,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);

%G24=line([-1.25,0],[-3.5,-3.5]);
%set(G24,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);

%G25=text(-1.2,-3.8,'Xk = 1 / sqrt(1-m^2) = -1,25');
%set(G25,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);

%G26=line([0,1.25],[-3.5,-3.5]);
%set(G26,'color',[0,0,1],'linestyle','--','marker','.','markersize',20);

%G27=text(0.2,-3.8,'Xk = 1 / sqrt(1-m^2) = 1,25');
%set(G27,'FontSize',[8],'FontName','Arial','FontWeight','bold','BackgroundColor',[0.811,0.960,0.960]);

hold off;
grid on;

