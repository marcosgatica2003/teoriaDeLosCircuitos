clear all; close all;


disp('tension del circuito')
v1=10+10j
v2=10-10i

disp('impedancias propias de malla')

z11=10
z22=10+10i
z33=10

disp('impedancias compartidas entre mallas') 

z12=0-5i
z23=0-5i
z31=0+5i

disp('matriz de impedancias')


z= [   z11,   z12,   z31;
   
       z12,   z22,   z23;
        
       z31,   z23,   z33]



disp('vectro tension de mallas')

v=[v1;-v2;0]

disp('resultado: corriente de mallas')

I=inv(z)*v

I1=I(1)

I2=I(2)

I3=I(3)




