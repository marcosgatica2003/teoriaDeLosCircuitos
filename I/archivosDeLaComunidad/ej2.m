disp('tensiones')
v1=18
v2=19+11i

disp('impedancias propias y compartidas')
z11=20+9i
z22=20+4i

z12=3j
disp('matriz impedancia')
z=[z11,z12;
   z12,z22]

disp('tensiones como vector')
v=[v1;v2]

disp('calculo de I')
I=inv(z)*v

I1=I(1)
I2=I(2)

[I1a I1m]=cart2pol( real(I1), imag(I1))

i3=I1a*180/pi
