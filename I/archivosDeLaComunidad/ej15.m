clear all; close all;

disp('Tension y corrientes del circuito')




disp('admitancias propias de malla')

y11=(1/3)-(1/5i)

y22=-(1/5i)+(1/4i)+(1/12)





disp('admitancias compartidas entre mallas') 

y12=(1/5i)

disp('matriz de admitancias')


y= [ y11, y12;
     y12, y22 ]

disp('vector corriente de ramas') 

ia=1;
ib=0;

i=[ia;ib]



disp('resultado: tensiones de nodos')

v=inv(y)*i

va=v(1)
vb=v(2)


