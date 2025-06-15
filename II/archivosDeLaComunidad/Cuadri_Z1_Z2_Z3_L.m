format long e
echo off
clc;

fprintf('\n\n\n\n');
fprintf('CALCULO DE Zim1 Y Zim2 EN "L" \n');
fprintf('\n\n');

fprintf('\nRECUERDE QUE PARA QUE EL CIRCUITO SEA TIPO L, Z1 O Z3 DEBE SER CERO\n');

fprintf('\n\n');
fprintf('       |-------|          |-------|        \n');
fprintf('O------|  Z1   |----x-----|  Z3   |------O \n');
fprintf('       |-------|    |     |-------|        \n');
fprintf('                |---|---|                  \n');
fprintf('                |       |                  \n');
fprintf('Zim1            |   Z2  |             Zim2 \n');
fprintf('                |       |                  \n');
fprintf('                |---|---|                  \n');
fprintf('                    |                      \n');
fprintf('O-------------------x-------------------O  \n\n');


Z1 = input('Ingrese el valor de Z1:');
Z2 = input('Ingrese el valor de Z2:');
Z3 = input('Ingrese el valor de Z3:');



if (Z1 == 0 && Z3 > 0)
clc;
fprintf('\nZ1 = %f\n',Z1);
fprintf('\nZ2 = %f\n',Z2); 
fprintf('\nZ3 = %f\n',Z3); 
    
fprintf('\n\n');
fprintf('                             |-------|       \n');
fprintf('O----------------------x-----|  Z3   |------O\n');
fprintf('                       |     |-------|       \n');
fprintf('                   |---|---|                 \n');
fprintf('                   |       |                 \n');
fprintf('Zim1               |  Z2   |            Zim2 \n');
fprintf('                   |       |                 \n');
fprintf('                   |---|---|                 \n');
fprintf('                       |                     \n');
fprintf('O-----------------------x-------------------O\n\n');

A = 1;
B = Z3;
C = 1/Z2;
D = 1 +(Z3/Z2);

fprintf('\n-------------Parámetros de transmisión directa---------------\n');


fprintf('\nA = %f',A);
fprintf('\nB = %f',B);
fprintf('\nC = %f',C);
fprintf('\nD = %f',D);

fprintf('\n');
fprintf('\n');

Zim1 = sqrt ((A*B)/(C*D));
Zim2 = sqrt ((B*D)/(A*C));

fprintf('\n-------------------Impedancia imagen-------------------------\n');


fprintf('\nZim1 = %f\n',Zim1);
fprintf('\nZim2 = %f\n',Zim2);
end








if (Z3 == 0 && Z1 > 0)
clc;
fprintf('\nZ1 = %f\n',Z1);
fprintf('\nZ2 = %f\n',Z2); 
fprintf('\nZ3 = %f\n',Z3);
    
fprintf('\n\n');
fprintf('       |-------|        \n');
fprintf('O------|  Z1   |-------x-----------------O  \n');
fprintf('       |-------|       |                    \n');
fprintf('                   |---|---|                \n');
fprintf('                   |       |                \n');
fprintf('Zim1               |   Z2  |           Zim2 \n');
fprintf('                   |       |                \n');
fprintf('                   |---|---|                \n');
fprintf('                       |                    \n');
fprintf('O----------------------x-----------------O  \n\n');

A = 1 + (Z1/Z2);
B = Z1;
C = 1/Z2;
D = 1;

fprintf('\n-------------Parámetros de transmisión directa---------------\n');


fprintf('\nA = %f',A);
fprintf('\nB = %f',B);
fprintf('\nC = %f',C);
fprintf('\nD = %f',D);

fprintf('\n');
fprintf('\n');

Zim1 = sqrt ((A*B)/(C*D));
Zim2 = sqrt ((B*D)/(A*C));

fprintf('\n-------------------Impedancia imagen-------------------------\n');


fprintf('\nZim1 = %f\n',Zim1);
fprintf('\nZim2 = %f\n',Zim2);
end

if (Z3 == 0 && Z1 == 0)
clc;   
fprintf('\nZ1 = %f\n',Z1);
fprintf('\nZ2 = %f\n',Z2); 
fprintf('\nZ3 = %f\n',Z3);
    
fprintf ('\nZ1 y Z3 son cero. Vuelva a cargar los datos!!\n');
end


if (Z3 > 0 && Z1 > 0 && Z2 > 0)
clc;  
fprintf('\nZ1 = %f\n',Z1);
fprintf('\nZ2 = %f\n',Z2); 
fprintf('\nZ3 = %f\n',Z3);
    
fprintf ('\nNi Z1 ni Z3 son cero. Vuelva a cargar los datos!!\n');
end
