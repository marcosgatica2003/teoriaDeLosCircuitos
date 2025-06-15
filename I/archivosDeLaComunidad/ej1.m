clear all; close all;


disp('tension del circuito')

v1=46.765+27i


disp('impedancias propias de malla')

z11=8+16-6i

z22=16+5i

z33=22+9i-6i


disp('impedancias compartidas entre mallas') 


z12=-16
z23=0
z31=6i




disp('matriz de impedancias')


z= [   z11,   z12,    z31;
   
       z12,   z22,    z23;
     
       z31,   z23,    z33]


disp('vectro tension de mallas')

 
v=[v1;0;0]



disp('resultado: corriente de mallas')

I=inv(z)*v



I1=I(1)

I2=I(2)

I3=I(3)

Ic=I1-I3

If=I1


disp('Convierte de cartesiano a polar')

[I1a,I1m]=cart2pol(real(I1),imag(I1))


[I2a,I2m]=cart2pol(real(I2),imag(I2))


[I3a,I3m]=cart2pol(real(I3),imag(I3))



disp('determinante de z')
detz=det(z)

