format long e
echo off
clc;

m = 1e-3; %mili
u = 1e-6; %micro
n = 1e-9; %nano

fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTROS K-CONSTANTE\n');
fprintf('                =============================\n\n');
fprintf('\n');
fprintf('                  Desarrollado por : Un tipo');
fprintf('\n\n');


fprintf('\nFiltro Pasa Bajos [pb]');
fprintf('\nFiltro Pasa Altos [pa]');
fprintf('\nFiltro Pasa Banda [PB]');
fprintf('\nFiltro Elimina Banda [EB]');
Tipo=input('\n\nELIJA EL TIPO DE FILTRO:','s');


%==========================================================================
% PASA BAJOS
%==========================================================================

if (Tipo == 'pb')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA BAJOS K-CONSTANTE\n');
fprintf('                ======================================\n\n');

l1=input('Valor del inductor (L1/2) [mH] = '); % Notar que 'l1' es el valor de 'L1/2'
c2=input('Valor del capacitor (C2) [uF] = ');

ro = sqrt((2*l1*m)/(c2*u));
wc = 2/sqrt(2*l1*c2*n);

% Impresion de resultados Pasa Bajos
fprintf('\n\nLa impedancia característica (Ro) es %8.4f [Ohms]\n\n',ro);
fprintf('El valor la frecuencia de corte (Wc) es de %8.6f [rad/seg]\n\n',wc);
end
 
 
 

%==========================================================================
% PASA ALTOS
%==========================================================================
if (Tipo == 'pa')
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA ALTOS K-CONSTANTE\n');
fprintf('                ======================================\n\n');
   
c1=input('Valor del capacitor (2C1) [uF] = ');  % Notar que 'c1' es el valor de '2C1'
l2=input('Valor del inductor (L2) [mH] = ');

wc = 1 / (2*sqrt(l2*(c1/2)*n));
ro = sqrt ((l2*m)/((c1*u)/2)); 

% Impresion de resultados Pasa Altos
fprintf('\n\nLa impedancia característica (Ro) es %8.4f [Ohms]\n\n',ro);
fprintf('El valor la frecuencia de corte (Wc) es de %8.6f [rad/seg]\n\n',wc);
end



%==========================================================================
% PASA BANDA
%==========================================================================

if (Tipo == 'PB')
clc;    
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO PASA BANDA K-CONSTANTE\n');
fprintf('                ======================================\n\n');

l1=input('Valor del inductor (L1/2) [mH] = ');  % Notar que 'l1' es el valor de 'L1/2'
c1=input('Valor del capacitor (2C1) [uF] = ');  % Notar que 'c1' es el valor de '2C1'
l2=input('Valor del inductor (L2) [mH] = ');
c2=input('Valor del capacitor (C2) [uF] = ');

%2 formas de obtener Ro
ro0 = sqrt((2*l1*m)/(c2*u));
ro1 = sqrt ((l2*m)/((c1*u)/2));

%2 formas de obtener Wo
wo0 = 1 / sqrt(2*l1*m*(c1*0.5*u));
wo1 = 1 / sqrt(l2*c2*n);

%ancho de banda
bw = 2 /sqrt(2*l1*c2*n);


% Impresion de resultados Pasa Banda

%Impedancia característica
fprintf('\n\nIMPEDANCIA CARACTERÍSTICA (Ro):\n');
fprintf ('Primer método: %8.4f [Ohms]\n',ro0);
fprintf ('Segundo método: %8.4f [Ohms]',ro1);

%Frecuencia de resonancia
fprintf('\n\nFRECUENCIA DE RESONANCIA (Wo):\n');
fprintf ('Primer método: %8.4f [rad/seg]\n',wo0);
fprintf ('Segundo método: %8.4f [rad/seg]',wo1);

%Ancho de banda
fprintf('\n\nANCHO DE BANDA (BW):  %8.4f\n',bw);
end



%==========================================================================
% ELIMINA BANDA
%==========================================================================

if (Tipo == 'EB')
clc;    
fprintf('\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                DISEÑO DE FILTRO ELIMINA BANDA K-CONSTANTE\n');
fprintf('                ======================================\n\n');

l1=input('Valor del inductor (L1/2) [mH] = ');  % Notar que 'l1' es el valor de 'L1/2'
c1=input('Valor del capacitor (2C1) [uF] = ');  % Notar que 'c1' es el valor de '2C1'
l2=input('Valor del inductor (L2) [mH] = ');
c2=input('Valor del capacitor (C2) [uF] = ');

%2 formas de obtener Ro
ro0 = sqrt((2*l1*m)/(c2*u));
ro1 = sqrt ((l2*m)/((c1*u)/2));

%2 formas de obtener Wo
wo0 = 1 / sqrt(2*l1*m*(c1*0.5*u));
wo1 = 1 / sqrt(l2*c2*n);

%Ancho de banda
bw = 0.5 / sqrt(l2*(c1/2)*n);

% Impresion de resultados Elimina Banda

%Impedancia característica
fprintf('\n\nIMPEDANCIA CARACTERÍSTICA (Ro):\n');
fprintf ('Primer método: %8.4f [Ohms]\n',ro0);
fprintf ('Segundo método: %8.4f [Ohms]',ro1);

%Frecuencia de resonancia
fprintf('\n\nFRECUENCIA DE RESONANCIA (Wo):\n');
fprintf ('Primer método: %8.4f [rad/seg]\n',wo0);
fprintf ('Segundo método: %8.4f [rad/seg]',wo1);

%Ancho de banda
fprintf('\n\nANCHO DE BANDA (BW):  %8.4f\n',bw);
end
%***************************************************************************

