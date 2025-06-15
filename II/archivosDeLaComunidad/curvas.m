clc;
clear;

imshow('curvas.png');

m1 = input('introduzca el valor de m para calcular |Xkm| = ');
Xkm = 1/sqrt(1-(m1^2));
fprintf('Valor de |Xkm| en el punto de la grafica si m = %f es de %f\n', m1, Xkm);
fprintf('\n');

m2 = input('introduzca el valor de m para calcular atenuacion con 2*arsenh[m/sqrt(1-m^2)] = ');
atenuacion_1 = 2*asinh(m2/(sqrt(1-(m2^2))));
fprintf('Valor de la atenuacion alfa en el punto de la grafica si m = %f es de %f\n', m2, atenuacion_1);
fprintf('\n');

m3 = input('introduzca el valor de m para calcular atenuacion con 2 arsenh[m/sqrt(1-m^2)]  = ');
atenuacion_2 = 2*asinh(m3/(sqrt(1-(m3^2))));
fprintf('Valor de la atenuacion alfa en el punto de la grafica si m = %f es de %f\n', m3, atenuacion_2);
fprintf('\n');