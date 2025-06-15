%Ejemplo de Funçiones de Butterworth
format long e
echo off
clc;
W0=1;
fprintf('\n\n\n\n\n');
fprintf('                  FUNCIONES DE BUTTERWORTH\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');

F1=figure(1);
   set(F1,'color','w','name','RAICES DE POLINOMIOS DE BUTTERWORTH DE ORDEN 1 A 9');
    
for n=1:9
   [num,den]=butter(n,W0,'s');
   t=tf(num,den);
   figure(1);
   subplot(3,3,n);
   
  if (n==1)   color='b';   
  elseif (n==2) color='g';  
  elseif (n==3) color='r';
  elseif (n==4) color='c';  
  elseif (n==5) color='m';  
  elseif (n==6) color='y'; 
  elseif (n==7) color='k';  
  elseif (n==8) color='b';  
  elseif (n==9) color='g';
  end
             
   pzmap(t,color);
   TPZ(n)=title(['n = ',num2str(n)]);
   set(TPZ(n),'color',[115/255,0,240/255],'FontWeight',' bold ','fontsize',14);
   if (n==1) 
       TP1=text(0,1.8,'RAICES DE POLINOMIOS DE BUTTERWORTH DE ORDEN 1 A 9');
       set(TP1,'color',[115/255,0,240/255],'FontWeight',' bold ','fontsize',14);
   end
   axis equal;
   
   F2=figure(2);
   set(F2,'color','w','name','CURVAS DE GANANCIA Y DE FASE DE POLINOMIOS DE BUTTERWORT DE ORDEN 1 A 9');
   bode(t,{0.01,100}); 
   hold on;
   grid on;
   
   
   fprintf('==============================================================================\n');
   disp(['n = ',num2str(n)]);
   raices=(roots([den]))
   t
   zpk(t)
   fprintf(' \n');
end;
grid on;
figure(2);
T1=title('CURVAS DE GANANCIA Y DE FASE DE POLINOMIOS DE BUTTERWORT DE ORDEN 1 A 9 ');
set(T1,'color',[115/255,0,240/255],'FontWeight',' bold ','fontsize',14);

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9');
 
 F3=figure(3);
   set(F3,'color','w','name','CURVAS DE GANANCIA DE POLINOMIOS DE BUTTERWORT DE ORDEN 1 A 9 ');
   
   S1=subplot(2,1,1);   
   
for n=1:9
   [num,den]=butter(n,W0,'s');
   t=tf(num,den);
   
   bodemag(t,{0.1,10});

   grid on;
   hold on
end
 T2=title('CURVAS DE GANANCIA DE POLINOMIOS DE BUTTERWORT DE ORDEN 1 A 9 ');
 set(T2,'color',[115/255,0,230/255],'FontWeight',' bold ','fontsize',14);
legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9',2);
 
    S2=subplot(2,1,2);
    
for n=1:9
   [num,den]=butter(n,W0,'s');
   t=tf(num,den);
   
    bodemag(1/t,{0.1,10});
   
   grid on;
   hold on;
end
T3=title('CURVAS DE ATENUACION DE POLINOMIOS DE BUTTERWORT DE ORDEN 1 A 6 ');
set(T3,'color',[115/255,0,240/255],'FontWeight',' bold ','fontsize',14);
   legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9',2);