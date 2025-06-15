disp('definicion de parametros')
va=10+10i;
vb=10-10i;
l1=l2=1i;
r1=r2=r3=2;
c=-1i;

disp('calculo de elementos de la matriz admitancia')

y11=(1/r3)+(1/l1)+(1/r1);
y22=(1/l1)+(1/c)+(1/l2);
y33=(1/r3)+(1/l2)+(1/r2);

y12=(-1/l1);
y23=(-1/l2);
y31=(-1/r3);

disp('calculo de matriz corriente')

i1=(va/r1)+(vb/r3);
i2=0;
i3=-(vb/r3);
i=[i1;i2;i3]

disp('matriz admitancia')

y=[ y11, y12 ,y31;
    y12, y22, y23;
    y31, y23, y33]

disp('matriz admitancia')
v=inv(y)*i

v1=v(1)
v2=v(2)
v3=v(3)
