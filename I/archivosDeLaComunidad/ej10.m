clear all; close all;

disp('Tension del circuito')

va=10

vb=17.32+10i



disp('admitancias propias de malla')

y11=(1/2)+(1/20i)-(1/5i)+(1/2)

y22=(1/2)-(1/20i)+(1/5i)

y33=1



disp('admitancias compartidas entre mallas') 

y12=-1/2

y13=-1/20i

y23=1/20i



disp('matriz de admitancias')


y= [ y11, y12, y13;
     y12, y22, y23;
     y13, y23, y33]

disp('vector corriente de ramas') 

i1=(10/2);
i2=0;
i3=-vb;
i=[i1;i2;i3]



disp('resultado: tensiones de nodos')

v=inv(y)*i

v1=v(1)
v2=v(2)
v3=v(3)





