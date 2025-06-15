disp('definicion de parametros')
va=50;
ia=2;
l1=5i;
l2=40i;
r1=5;
r2=10;
c=-10i;

disp('calculo de elementos de la matriz admitancia')

y=(1/(l1+r1))+(1/(c+l2+r2))


disp('calculo de matriz corriente')


i1=(ia-(va/(r2+l2+c)));


disp('Resultados')
v1=i1/y;
v1=inv(y)*i1

io=(v1+va)/(r2+l2+c)

