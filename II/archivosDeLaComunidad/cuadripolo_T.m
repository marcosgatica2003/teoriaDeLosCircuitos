#!/usr/bin/octave
clc; clear;

fprintf('----------------- CUADRIPOLO T -------------------\n');
fprintf('\n');
fprintf('            |------|              |------|     		\n');
fprintf('     O------|  Z1  |------x-------|  Z3  |------O	\n');
fprintf('            |------|      |       |------|	       	\n');
fprintf('                       |--|--|         	 		      \n');
fprintf('                       |     |           	       	\n');
fprintf('                       |  Z2 |                  		\n');
fprintf('                       |     |               			\n');
fprintf('                       |--|--|                 		\n');
fprintf('                          |           	         		\n');
fprintf('     O--------------------x---------------------O	\n');
fprintf('\n');

z1 = input('Ingrese el valor de Z1 = ');
z2 = input('Ingrese el valor de Z2 = ');
z3 = input('Ingrese el valor de Z3 = ');

clc;

fprintf('----------------- CUADRIPOLO T -------------------\n');
fprintf('\n');
fprintf('            %f             %f     		      \n', z1, z3);
fprintf('            |------|              |------|     		\n');
fprintf('     O------|  Z1  |------x-------|  Z3  |------O	\n');
fprintf('            |------|      |       |------|	       	\n');
fprintf('                       |--|--|         	 		      \n');
fprintf('                       |     |           	       	\n');
fprintf('                       |  Z2 |                  		\n');
fprintf('                       |     |               			\n');
fprintf('                       |--|--|                 		\n');
fprintf('                          |    %f      	       		\n', z2);
fprintf('     O--------------------x---------------------O	\n');
fprintf('\n');

% Calculo de parametros de impedancia
z_11 = z1 + z2;
z_12 = z2;
z_21 = z2;
z_22 = z2 + z3;
Az   = (z_11*z_22) - (z_12*z_21);

% Calculo de parametros de Transmision Directa
A = z_11/z_12;  %[Adim]
B = Az/z_12;    %[Ohm]
C = 1/z_12;     %[Mho]
D = z_22/z_12;  %[Adim]

%************************************************
% En este caso el cuadripolo no es simetrico 
%************************************************
if(A != D)
printf('---> Cuadripolo Asimetrico\n');

%Cálculo de las impedancias Iterativas
z_k1 = (-(A-D)/(2*C)) + sqrt(((A-D)/(2*C))^2 + (B/C));
z_k2 = (-(D-A)/(2*C)) + sqrt(((D-A)/(2*C))^2 + (B/C));

%Cálculo de las Impedancias Imágenes
z_im1 = sqrt((A*B)/(C*D));
z_im2 = sqrt((B*D)/(A*C));
z_in  = z_im1;
z_out = z_im2;

%Cálculo de la función de Propagación en Base Iterativa
fun_prop_it = ((A+D)/2)+sqrt(((A+D)/2)^2-1);
alfa_it_neper = log(fun_prop_it);
alfa_it_dB    = 20 * log10(e^(alfa_it_neper));
e_out_it = (1/fun_prop_it);

%Cálculo de la función de Propagación DE TENSION en Base Imagen de salida
fun_prop_im   = sqrt(A/D)*(sqrt(A*D)+sqrt((A*D)-1));
alfa_im_neper = log(fun_prop_im);
alfa_im_dB    = 20 * log10(e^(alfa_im_neper));
e_out_im = (1/fun_prop_im);

fprintf('\n');
fprintf('#Impedancia de entrda Z in  = %f\n', z_in);
fprintf('#Impedancia de salida Z out = %f\n', z_out);


fprintf('\n');
fprintf('#Parametros de Transmision Directa\n');
fprintf('A = %f[Adim] \t B = %f[Ohm] \t C = %f[Mho] \t D = %f[Adim]\n', A, B, C, D);

fprintf('\n');
fprintf('#Funcion de Propagacion\n');
fprintf('Funcion de Propagacion = %f[Adim]\n', fun_prop_im);
fprintf('alfa = %f[NEPERS] \t alfa= -%f[dB]\n', alfa_im_neper, alfa_im_dB);

endif




