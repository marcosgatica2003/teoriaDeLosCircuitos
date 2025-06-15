clear;
clc;

Rin = 100;
Rout = 700;

Ra = 3600;
Rb = (4800*2400)/(4800+2400);
Rc = 1200;

R1 = (Ra*Rb)/(Ra+Rb+Rc);
R2 = (Ra*Rc)/(Ra+Rb+Rc);
R3 = (Rb*Rc)/(Ra+Rb+Rc);

Z1 = R1 + Rin;
Z2 = 675;
Z3 = R3 + Rout;

z_11 = Z1 + Z2;
z_12 = Z2;
z_21 = Z2;
z_22 = Z2 + Z3;
Az   = (z_11*z_22) - (z_12*z_21);

% Calculo de parametros de Transmision Directa
A = z_11/z_12;  %[Adim]
B = Az/z_12;    %[Ohm]
C = 1/z_12;     %[Mho]
D = z_22/z_12;  %[Adim]

Zim1 = sqrt(B/C);
Zim2 = sqrt(B/C);

fprintf('\n');
fprintf('Valor de Z1 = %f\n', Z1);
fprintf('Valor de Z2 = %f\n', Z2);
fprintf('Valor de Z2 = %f\n', Z3);
fprintf('Valor de la impedancia imagen de entrada Zim1 = %f\n', Zim1);
fprintf('Valor de la impedancia imagen de entrada Zim2 = %f\n', Zim2);



