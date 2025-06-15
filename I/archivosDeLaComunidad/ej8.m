clear all; close all;

disp('Tension del circuito')

v1=100

v2=140

v3=60

v4=80



disp('admitancias propias de malla')

y11=(1/8)+(1/10)+(1/5)

y22=(1/10)+(1/7)+(1/4)

y33=(1/8)+(1/7)+(1/12)



disp('admitancias compartidas entre mallas') 

y12=-1/10

y13=-1/8

y23=-1/7



disp('matriz de admitancias')


y= [ y11, y12, y13;
     y12, y22, y23;
     y13, y23, y33]

disp('vector corriente de ramas') 

i1=(100/8)+(140/10);
i2=(-140/10)-(60/7);
i3=(-100/8)+(60/7)-(80/12);
i=[i1;i2;i3]



disp('resultado: tensiones de nodos')

v=inv(y)*i

va=v(1)
vb=v(2)
vc=v(3)



disp('resultado :D')
Ix=(140+vb-va)/10



