clear all; close all;


disp('tension del circuito')
v1=-32
v3=-18.38-18.23i

disp('impedancias propias de malla')

z11=12+40-21i
z22=40+9+6i
z33=18+9+12+3i+4i-21i

disp('impedancias compartidas entre mallas') 

z12=-40
z23=-9
z31=-12+21i

disp('matriz de impedancias')


z= [   z11,   z12,   z31;
   
       z12,   z22,   z23;
        
       z31,   z23,   z33]



disp('vectro tension de mallas')

v=[v1;0;v3]

disp('resultado: corriente de mallas')

I=inv(z)*v

I1=I(1)

I2=I(2)

I3=I(3)







