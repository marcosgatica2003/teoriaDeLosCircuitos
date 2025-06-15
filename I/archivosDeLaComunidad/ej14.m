clear all; close all;

disp('Tension y corrientes del circuito')

v=0+0.25i

i=4.33+2.5i


disp('admitancias propias de malla')

y11=(1/5)+(1/10i)

y22=(1/10i)+(1/5)+(1/(5+5i))





disp('admitancias compartidas entre mallas') 

y12=0-(1/10i)

disp('matriz de admitancias')


y= [ y11, y12;
     y12, y22 ]

disp('vector corriente de ramas') 

i1=(4.33+2.5i);
i2=(0.25i)/(5+5i);

i=[i1;i2]



disp('resultado: tensiones de nodos')

v=inv(y)*i

vc=v(1)
va=v(2)




disp('resultado :D')
va


