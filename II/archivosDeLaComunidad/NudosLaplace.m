% TEORÍA DE LOS CIRCUITOS II
% UNIVERSIDAD TECNOLÓGICA NACIONAL - FACULTAD REGIONAL CÓRDOBA
%
% Comunicar bugs o sugerencias a Daniel Muñoz: danymt01@gmail.com
% Version: 20080522
%
% Instrucciones:
%  Ingrese los datos de admitancias y corrientes en el dominio de Laplace a
%  medida que el programa los vaya pidiendo. Tenga en cuenta que debe
%  ingresar el signo correspondiente a cada coadmitancia (el signo
%  negativo) y que no le va a pedir z12 y z21 por ejemplo, porque son iguales.
%  Va a saltear z21.
%
clc
echo off;
syms s;
origFormat = get(0, 'format');
format('rational');
disp(sprintf('MÉTODO DE LOS NUDOS EN EL DOMINIO DE LAPLACE.'));
disp(sprintf('---------------------------------------------------------------------'));
nmallas=input('¿Cuantos nudos tiene el circuito?: ');
digitos=input('¿Cuantos dígitos de precisión quiere ver en el resultado?: ');
seguir='n';
disp(sprintf('\n\n---------------------------------------------------------------------'));
disp(sprintf('MATRIZ DE ADMITANCIAS.\n'));
disp(sprintf('A continuación ingrese los elementos de la matriz de admitancias en el\ndominio de Laplace utilizando "s" como variable generalizada de Laplace.'));
disp(sprintf('***Sepa que debe ingresar las coadmitancias con su SIGNO CORRESPONDIENTE**'));
while ((seguir~='S') & (seguir~='s'))
    y=[];
    for fila=1:nmallas
        ytemp=[];
        for columna=1:nmallas
            if fila<=columna
                ytemp=[ytemp input(sprintf('Ingrese y[%d,%d]: ',fila,columna))];
            else
                ytemp=[ytemp y(columna,fila)];
            end
        end
        y=[y;ytemp];
    end
    y=sym(y);
    disp(sprintf('Así quedó la matriz de admitancias:'));
    disp(y);
    seguir=input('¿Está bien?(S/N): ','s');
end
disp(sprintf('\n\n---------------------------------------------------------------------'));
disp(sprintf('MATRIZ DE CORRIENTES.\n'));
seguir='n';
while ((seguir~='S') & (seguir~='s'))
    I=[];
    for columna=1:nmallas
        I=[I;input(sprintf('Ingrese I[%d]: ',columna))];
    end
    I=sym(I);
    disp(sprintf('Así quedó la matriz de Corrientes:'));
    disp(I);
    seguir=input('¿Está bien?(S/N): ','s');
end
disp(sprintf('\n\n---------------------------------------------------------------------'));
disp(sprintf('DETERMINANTE PRINCIPAL\n'));
disp(sprintf('\nEl determinante principal (Dp) es: '));
detY=det(y);
try
    pretty(detY)
catch
    disp(detY);
end
for columna=1:nmallas
    disp(sprintf('\n\n---------------------------------------------------------------------'));
    disp(sprintf('PARA ENCONTRAR v%d(t).\n',columna));
    subst=y;
    subst(1:nmallas,columna)=I;
    detS(columna)=det(subst);
    cociente(columna)=simplify(detS(columna)/detY);
    disp(sprintf('La matriz que origina el determinante sustituto %d (Ds%d) es: ',columna,columna));
    disp(subst);
    disp(sprintf('El Ds%d es: ',columna));
    try
        pretty(detS(columna))
    catch
        disp(detS(columna));
    end
    disp(sprintf('Ds%d/Dp: ',columna));
    try
        pretty(cociente(columna))
    catch
        disp(cociente(columna));
    end
    [num,den]=numden(cociente(columna));
    num=sym2poly(num);
    den=sym2poly(den);
    [r,p,k]=residue(num,den);
    fracparc=sum(k);
    for n=1:length(r)
        fracparc=fracparc+r(n)/(s-p(n));
    end
    disp(sprintf('Expresado en fracciones parciales: '));
    try
        pretty(fracparc)
    catch
        disp(fracparc);
    end
    disp(sprintf('Antitransformando tenemos v%d(t): ',columna));
    domtiempo=ilaplace(fracparc);
    try
        pretty(domtiempo)
    catch
        disp(domtiempo);
    end
    disp(sprintf('Expresado v%d(t) con formato punto decimal: ',columna));
    digits(digitos);
    try
        pretty(vpa(domtiempo))
    catch
        disp(vpa(domtiempo));
    end
end
set(0,'format', origFormat);