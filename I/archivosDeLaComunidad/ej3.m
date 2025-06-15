clear all; close all;


disp('tension del circuito')
v1=180

disp('impedancias propias de malla')

z11=28-12i
z22=13+15i

disp('impedancias compartidas entre mallas') 

z12=-13

disp('matriz de impedancias')


z= [   z11,   z12;
   
       z12,   z22]



disp('vectro tension de mallas')

v=[v1;0]

disp('resultado: corriente de mallas')

I=inv(z)*v

I1=I(1)

I2=I(2)

Ir=I1-I2


disp('Triangulo de potencias')

disp('Potencia Aparente') 

S=v1*conj(I1)   
disp('Potencia Activa')  
P=real(S)
disp('Potencia Reactiva')
Q=imag(S)

disp('Comparaion de potencia Activa y la disipada por las resistencias ')
[I1a I1m]=cart2pol( real(I1),imag(I1));
[Ira Irm]=cart2pol( real(Ir),imag(Ir));

Pr1=15*(I1m*I1m)
Pr2=13*(Irm*Irm)

Pr=Pr1+Pr2
P=real(S)




