clear all; close all;

disp('Tension del circuito')

va=10+0i


disp('admitancias propias de malla')

y11=(1/5i)+(1/3)+(1/2i)

y22=(1/5)

disp('admitancias compartidas entre mallas') 

y12=-(1/2i)




disp('matriz de admitancias')


y= [ y11, y12;
     y12, y22]

disp('vector corriente de ramas') 

ia=(10/5i);
ib=0;
i=[ia;ib]


disp('resultado: tensiones de nodos')

v=inv(y)*i;

va=v(1);
vb=v(2)

[van1 vm1]=cart2pol(real(va),imag(va));
vm1;
vangulo1=van1*180/pi;



[van2 vm2]=cart2pol(real(vb),imag(vb));
vm2
vangulo2=van2*180/pi


