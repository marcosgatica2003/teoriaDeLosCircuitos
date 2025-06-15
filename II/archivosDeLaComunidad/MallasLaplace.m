% TEORÍA DE LOS CIRCUITOS II
% UNIVERSIDAD TECNOLÓGICA NACIONAL - FACULTAD REGIONAL CÓRDOBA
%
% Comunicar bugs o sugerencias a Daniel Muñoz: danymt01@gmail.com
% Version: 20080522
%
% Instrucciones:
%  Ingrese los datos de impedancias y tensiones en el dominio de Laplace a
%  medida que el programa los vaya pidiendo. Tenga en cuenta que debe
%  ingresar el signo correspondiente a cada coimpedancia (si las corrientes
%  que las atraviesan son opuestas, llevan signo negativo) y que no le va a
%  pedir z12 y z21 por ejemplo, porque son iguales. Va a saltear z21.
%
clc
echo off;
syms s;
origFormat = get(0, 'format');
format('rational');
disp(sprintf('MÉTODO DE LAS MALLAS EN EL DOMINIO DE LAPLACE.'));
disp(sprintf('---------------------------------------------------------------------'));
nmallas=input('¿Cuantas mallas tiene el circuito?: ');
digitos=input('¿Cuantos dígitos de precisión quiere ver en el resultado?: ');
seguir='n';
disp(sprintf('\n\n---------------------------------------------------------------------'));
disp(sprintf('MATRIZ DE IMPEDANCIAS.\n'));
disp(sprintf('A continuación ingrese los elementos de la matriz de impedancias en el\ndominio de Laplace utilizando "s" como variable generalizada de Laplace.'));
disp(sprintf('***Sepa que debe ingresar las coimpedancias con su SIGNO CORRESPONDIENTE**'));
while ((seguir~='S') & (seguir~='s'))
    z=[];
    for fila=1:nmallas
        ztemp=[];
        for columna=1:nmallas
            if fila<=columna
                ztemp=[ztemp input(sprintf('Ingrese z[%d,%d]: ',fila,columna))];
            else
                ztemp=[ztemp z(columna,fila)];
            end
        end
        z=[z;ztemp];
    end
    z=sym(z);
    disp(sprintf('Así quedó la matriz de impedancias:'));
    disp(z);
    seguir=input('¿Está bien?(S/N): ','s');
end
disp(sprintf('\n\n---------------------------------------------------------------------'));
disp(sprintf('MATRIZ DE TENSIONES.\n'));
seguir='n';
while ((seguir~='S') & (seguir~='s'))
    V=[];
    for columna=1:nmallas
        V=[V;input(sprintf('Ingrese V[%d]: ',columna))];
    end
    V=sym(V);
    disp(sprintf('Así quedó la matriz de Tensiones:'));
    disp(V);
    seguir=input('¿Está bien?(S/N): ','s');
end
disp(sprintf('\n\n---------------------------------------------------------------------'));
disp(sprintf('DETERMINANTE PRINCIPAL\n'));
disp(sprintf('\nEl determinante principal (Dp) es: '));
detZ=det(z);
try
    pretty(detZ)
catch
    disp(detZ);
end
for columna=1:nmallas
    disp(sprintf('\n\n---------------------------------------------------------------------'));
    disp(sprintf('PARA ENCONTRAR i%d(t).\n',columna));
    subst=z;
    subst(1:nmallas,columna)=V;
    detS(columna)=det(subst);
    cociente(columna)=simplify(detS(columna)/detZ);
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
    disp(sprintf('Antitransformando tenemos i%d(t): ',columna));
    domtiempo=ilaplace(fracparc);
    try
        pretty(domtiempo)
    catch
        disp(domtiempo);
    end
    disp(sprintf('Expresado i%d(t) con formato punto decimal: ',columna));
    digits(digitos);
    try
        pretty(vpa(domtiempo))
    catch
        disp(vpa(domtiempo));
    end
end
set(0,'format', origFormat);