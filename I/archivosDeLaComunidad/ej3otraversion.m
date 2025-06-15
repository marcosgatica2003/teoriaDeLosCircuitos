disp('tensiones')
v1=100

disp('impedancias propias y compartidas')
z11=4+28i
z22=16+12i

z12=-16i
disp('matriz impedancia')
z=[z11,z12;
   z12,z22]

disp('tensiones como vector')
v=[v1;0]

disp('calculo de I')
I=inv(z)*v

I1=I(1)
I2=I(2)

[I1a I1m]=cart2pol( real(I1), imag(I1));

I1m;
I1andgulo=I1a*180/pi;
