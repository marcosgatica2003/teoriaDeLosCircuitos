%Ejemplo de Funçiones de Butterworth
format long e
echo off
clc;
W0=1;
fprintf('\n\n\n\n\n');
fprintf('                  PARAMETROS DE LA APROXIMACIÓN DE BUTTERWORTH\n\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n');
Wp=input(' Pulsación de corte de la banda pasante Wp en [rad/seg] = ');
Ws=input(' Pulsación de corte de la banda detenida Ws en [rad/seg] = ');
Amax=input(' Atenuación máxima en la banda pasante Amax ó Rp en [dB] = ');
Amin=input(' Atenuación mínima de la banda  detenida Amin ó Rs en [dB] = ');
Rp=Amax;
Rs=Amin;
fprintf('\n\nCALCULO MEDIANTE MATLAB\n');
[N,Wn]=buttord(Wp,Ws,Rp,Rs,'s')

fprintf('CALCULO MEDIANTE EXPRESIONES TEÓRICAS\n');
n=log10(sqrt((10^(0.1*Amin)-1)))/log10(Ws/Wp);
fprintf('El valor de n calculado como  n=log10(sqrt((10^(0.1*Amin)-1)))/log10(Ws/Wp) es %8.4f \n\n',n);
for i=1:50
if ((n>i) && (n<i+1)) n=ceil(i+1);
end
end
fprintf('El valor de n debe ser igual o mayor que %8.4f \n\n',n);
fprintf('CALCULO MEDIANTE EXPRESIONES TEÓRICAS EMPLEANDO Ks y Kd\n');
E=sqrt(10^(0.1*Amax)-1);
Epsilon=E;
fprintf('El valor de Epsilon = sqrt(10^(0,1*Amax)-1) es %8.4f \n\n',E);

Ks=Wp/Ws;
fprintf('El valor del factor de selectividad Ks = Wp/Ws es %8.4f \n\n',Ks);

Kd=sqrt((10^(0.1*Amax)-1)/(10^(0.1*Amin)-1));
fprintf('El valor del factor de discriminación Kd = sqrt((10^(0.1*Amax)-1)/(10^(0.1*Amin)-1)) es %8.4f \n\n',Kd);

n1=log10(Kd)/log10(Ks);
fprintf('El valor de n calculado como  n=log10(Kd)/log10(Ks) es %8.4f \n\n',n1);

for i=1:50
if ((n1>i) && (n1<i+1)) n1=ceil(i+1);
end
end

fprintf('El valor de n debe ser igual o mayor que %8.4f \n\n',n1);

% METODO GRÁFICO

run('butter_aten');

Wnorm=Ws/Wp;
L1=line([0.1,Wnorm],[Rs,Rs]);
set(L1,'color','r','linestyle','-','linewidth',2);
L2=line([Wnorm,Wnorm],[0,Rs]);
set(L2,'color','r','linestyle','-','linewidth',2);


fprintf('\n*******************************************************************\n');
fprintf('\n Se solicita reportar errores a jgarciaabad@ubp.edu.ar \n');
fprintf(' o a jgarciaabad@iua.edu.ar \n');
fprintf('     GRACIAS\n');
fprintf('\n*******************************************************************\n');


