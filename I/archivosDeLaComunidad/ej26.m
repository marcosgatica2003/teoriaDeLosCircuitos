disp('tensiones')
v1=10
v2=10

disp('impedancias propias y compartidas')
z11=2+4i
z22=3i-8i
z12=-2j

disp('matriz impedancia')
z=[z11,z12;
   z12,z22]

disp('tensiones como vector')
v=[v1;v2]

disp('calculo de I')
I=inv(z)*v;

I1=I(1)
I2=I(2)

[I1a I1m]=cart2pol( real(I1), imag(I1));
[I2a I2m]=cart2pol( real(I2), imag(I2));

i1modulo=I1m
i1angulo=I1a*180/pi

i2modulo=I2m
i2angulo=I2a*180/pi


