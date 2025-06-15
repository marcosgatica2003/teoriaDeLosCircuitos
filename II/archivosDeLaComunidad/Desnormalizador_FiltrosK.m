format long e
echo off
clc;

m = 1e-3; %mili
u = 1e-6; %micro
n = 1e-9; %nano

fprintf('\n\n\n\n');
fprintf('\t\t\tDESNORMALIZACION DE FILTROS K-CONSTANTE\n');
fprintf('\t\t\t=============================\n\n');
fprintf('\t\t\tDesarrollado por : Dream Team ');
fprintf('\n\n');

fprintf('\nFiltro Pasa Bajos [pb]');
fprintf('\nFiltro Pasa Altos [pa]');
fprintf('\nFiltro Pasa Banda [PB]');
fprintf('\nFiltro Elimina Banda [EB]\n');
Tipo=input('ELIJA EL TIPO DE FILTRO:','s');



%------------------------------PASA BAJOS----------------------------------

if (Tipo == 'pb')
clc;
fprintf('\nDesnormalización de Pasa Bajos\n\n');

Ro = input('Ingrese el valor de Ro: ');
wc = input('Ingrese el valor de la pulsaciÃ³n de corte (wc):');

clc;

%Calculos parametros
b = Ro;
a = wc;

%Impresion de parametros
fprintf('DATOS CARGADOS\n');
fprintf('a = Ro = %.12f\n',Ro);
fprintf('b = wc = %.12f\n',wc);

fprintf('Ingrese los valores de los elementos normalizados:\n');
Rn = input('Valor de Rn [ohm]:'); 
L1n = input('Valor de L1n [H]:'); 
C2n = input('Valor de C1n [F]:');

%Calculos de Valores desnormalizados
L1 = (L1n*b)/a;
C2 = C2n /(a*b);
R  = Rn*b;

%Impresion de los datos del circuito
fprintf('\nVALORES DESNORMALIZADOS\n');
fprintf('R = %.12f [Ohms] \n',R);
fprintf('L1/2 = %.12f [mH] \n',L1*m);
fprintf('C2 = %.12f [uF]\n',C2*u);

end

%------------------------------PASA ALTAS----------------------------------

if (Tipo == 'pa')
clc;
fprintf('\nDesnormalización de Pasa Altas\n\n');
Ro = input('Ingrese el valor de Ro: ');
wc = input('Ingrese el valor de la pulsacion de corte (wc):');

clc;

%Calculos parametros
a = wc;
b = Ro;

%Impresion de parametros
fprintf('DATOS CARGADOS\n');
fprintf('b = Ro = %.12f\n',Ro);
fprintf('a = wc = %.12f\n',wc);

%fprintf('Ingrese los valores de los elementos normalizados:\n');
%Rn = input('Valor de Rn [ohm]:'); 
%L2n = input('Valor de L1n [H]:'); 
%C1n = input('Valor de C1n [F]:');

%Calculos de Valores desnormalizados
L2 = (b)/(2*a);
C1 = 1/(a*b);
R  = 1*b;

%Impresion de los datos del circuito
fprintf('\nVALORES DESNORMALIZADOS\n');
fprintf('R = %.12f [Ohms] \n',R);
fprintf('L1 = %.12f [mH] \n', L2*10^3);
fprintf('2C1 = %.12f [uF]\n',C1*10^6);

end

%----------------------------PASA BANDAS----------------------------------

if (Tipo == 'PB')
    
  clc;
  fprintf('Desnormalizacion de PasaBandas\n\n');

  Ro = input('Ingrese el valor de Ro: ');

  opcion=input('Selecione 1 si ingresara en Hz, si ingresara en radienes ingrese 2: ');


  if (opcion == 1)
      fc1=input('Frecuencia de corte inferior fc1  [Hertz] = ');
      fc2=input('Frecuencia de corte superior fc2 [Hertz] = ');
      wc1=2*pi*fc1;
      wc2=2*pi*fc2;
  elseif (opcion == 2)
      wc1=input('Frecuencia de corte wc inferior [rad/seg] = ');
      wc2=input('Frecuencia de corte superior wc2 [rad/seg] = ');
      fc1=(wc1)/(2*pi);
      fc2=(wc2)/(2*pi);
   else
      error('Opcion incorrecta, ingrese 1 o 2. Salame');
      clc;
  end

    clc;
    %Impresion de datos cargados
    fprintf('DATOS CARGADOS\n');
    fprintf('Ro = %.12f [Ohms]\n',Ro);
    fprintf('wc1 = %.12f rps\n ',wc1);
    fprintf('wc2 = %.12f rps\n',wc2);

    fprintf('\n\n');

    %Calculos de parametros
    b = Ro;
    BW = wc2-wc1;
    a = BW;
    wo = sqrt(wc1*wc2);
    won2 = (wo^2)/(BW^2);
    won = sqrt (won2);


    %Impresion de Calculos de parametros
    fprintf('PARAMETROS\n');
    fprintf('b = Ro = %.12f [Ohms]\n',b);
    fprintf('a = BW = %.12f rps\n',BW);
    fprintf('wo = %.12f rps\n',wo);
    fprintf('won2 = %.12f\n',won2);
    fprintf('won = %.12f\n',won);

    fprintf('\n\n');

    fprintf('\nIngrese los valores de los elementos normalizados:\n');
    L1n = input ('Valor de L1n [H]:');
    C2n = input ('Valor de C2n [F]:');
    C1n = 1/(won2);
    L2n = 1/(2*won2);

    fprintf('\n\n');

    %Calculos de valores desnormalizados
    C1 = (1/won2)/(a*b);
    L1 = (1*b)/a;
    C2 = (2)/(a*b);
    L2 = 1/(2*won2);
    L2 = b/(2*a*won2);

    %Impresion de los valores desnormalizados
    fprintf('VALORES DESNORMALIZADOS\n');
    fprintf('2C1 = %.12f [uF]\n ',C1*10^6);
    fprintf('L1/2 = %.12f [mH]\n ',L1*10^3);
    fprintf('C2 = %.12f [uF]\n ',C2*10^6);
    fprintf('L2 = %.12f [mH]\n ',L2*10^3);

end


%------------------------------Elimina Banda----------------------------------
if (Tipo == 'EB')
    
  clc;
  fprintf('Desnormalizacion de Elimina Banda\n\n');

  Ro = input('Ingrese el valor de Ro: ');
  
      wc1=input('Frecuencia de corte wc inferior [rad/seg] = ');
      wc2=input('Frecuencia de corte superior wc2 [rad/seg] = ');
      fc1=(wc1)/(2*pi);
      fc2=(wc2)/(2*pi);
      clc;
 

  clc;
  %Impresion de datos cargados
  fprintf('DATOS CARGADOS\n');
  fprintf('Ro = %.12f [Ohms]\n',Ro);
  fprintf('wc1 = %.12f\n',wc1);
  fprintf('wc2 = %.12f\n',wc2);

  fprintf('\n\n');

  %Calculos de parametros
  b = Ro;
  BW = wc2-wc1;
  a = BW;
  wo = sqrt(wc1*wc2);
  won2 = (wo^2)/(BW^2);
  


  %Impresion de Calculos de parametros
  fprintf('PARAMETROS\n');
  fprintf('b = Ro = %.12f [Ohms]\n',b);
  fprintf('a = BW = %.12f [rad/seg]\n',BW);
  fprintf('wo = %.12f\n',wo);
  fprintf('won2 = %.12f\n',won2); %(pulsacion de resonancia normalizada al cuadrado)
  

  fprintf('\n\n');

  %fprintf('\nIngrese los valores de los elementos normalizados:\n');
  %L1n = input ('Valor de L1/2 normalizado [H]: ');
  %C1n = input ('Valor de 2C1 normalizado [F]: ');
  %L2n = input ('Valor de L2 normalizado [H]: ');
  %C2n = input ('Valor de C2 normalizado [F]: ');


  fprintf('\n\n');

  %Calculos de valores desnormalizados
  C1 = 1/(a*b);
  L1 = (b/won2)/a;
  C2 = (2/won2)/(b*a);
  L2 = b/(2*a);
  R= 1*b;

  %Impresion de los valores desnormalizados
  fprintf('VALORES DESNORMALIZADOS\n');
  fprintf('L1/2 = %.12f [mH]\n ',L1*10^3);
  fprintf('2C1 = %.12f [uF]\n ',C1*10^6);
  fprintf('L2 = %.12f [mH]\n ',L2*10^3);
  fprintf('C2 = %.12f [uF]\n ',C2*10^6);
end
