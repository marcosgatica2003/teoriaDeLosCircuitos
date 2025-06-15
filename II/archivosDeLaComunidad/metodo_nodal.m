format long e
echo off
clc;
fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                  M?TODO DE NUDOS');
fprintf('\n');
fprintf('                  Desarrollado por : Ing. Juan Jose Garcia Abad');
fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\');



Num_Nudos=input('\nN?mero de Nudos ?  ');

if  Num_Nudos==1 
   Y11=input('\nValor de Y11 ?  ');
   I1=input('\nCorriente en el nudo 1 ?  ');
   V1=I1/Y11;
   
   format long;
   fprintf('\nLa Tension V1 es : %8.8f Voltios \n\n',V1);
end

if  Num_Nudos==2 
   Y11=input('\nValor de Y11 ?  ');
   Y12=input('\nValor de Y12 ?  ');
   Y21=Y12;
   Y22=input('\nValor de Y22 ?  ');
   I1=input('\nCorriente en el nudo 1 ?  ');
   I2=input('\nCorriente en el nudo 2 ?  ');
   DET_P=det([Y11 -Y12;-Y12 Y22]);
   DET_S1=det([I1 -Y12;I2 Y22]); 
   DET_S2=det([Y11 I1;-Y12 I2]);
   V1=DET_S1/DET_P;
   V2=DET_S2/DET_P;
   fprintf('\n\n');
   fprintf('        | %12.8f   %12.8f   |\n',Y11,-Y12);
   fprintf('DET_P = | %12.8f   %12.8f   |\n',-Y12,Y22);
   fprintf('\n\n');
   
   fprintf('DET_P =  %12.8f \n',DET_P);
   
   fprintf('\n\n');
   fprintf('         | %12.8f   %12.8f   |\n',I1,-Y12);
   fprintf('DET_S1 = | %12.8f   %12.8f   |\n',I2,Y22);
   fprintf('\n\n');
   
   fprintf('DET_S1 =  %12.8f \n',DET_S1);
   
   fprintf('\n\n');
   fprintf('         | %12.8f   %12.8f   |\n',Y11,I1);
   fprintf('DET_S2 = | %12.8f   %12.8f   |\n',-Y12,I2);
   fprintf('\n\n');
   
   fprintf('DET_S2 =  %12.8f \n',DET_S2);
   
   format long;
   fprintf('\n\n');
   fprintf('\n\n');
   fprintf('La Tension V1 es : %8.8f Voltios ',V1);
   fprintf('\n\n');
   fprintf('La Tension V2 es : %8.8f Voltios \n\n',V2);

   
   
end

if  Num_Nudos==3 
   Y11=input('\nValor de Y11 ?  ');
   Y12=input('\nValor de Y12 ?  ');
   Y21=Y12;
   Y13=input('\nValor de Y13 ?  ');
   Y31=Y13;
   Y22=input('\nValor de Y22 ?  ');
   Y23=input('\nValor de Y23 ?  ');
   Y32=Y23;
   Y33=input('\nValor de Y33 ?  ');
   I1=input('\nCorriente en el nudo 1 ?  ');
   I2=input('\nCorriente en el nudo 2 ?  ');
   I3=input('\nCorriente en el nudo 3 ?  ');
   DET_P=det([Y11 -Y12 -Y13;-Y21 Y22 -Y23;-Y31 -Y32 Y33]);
   DET_S1=det([I1 -Y12 -Y13;I2 Y22 -Y23;I3 -Y23  Y33]); 
   DET_S2=det([Y11 I1 -Y13;-Y21 I2 -Y23;-Y31 I3 Y33]);
   DET_S3=det([Y11 -Y12 I1;-Y21 Y22 I2;-Y31 -Y32 I3]);
   V1=DET_S1/DET_P;
   V2=DET_S2/DET_P;
   V3=DET_S3/DET_P;
   fprintf('\n\n');
   fprintf('        | %12.8f   %12.8f   %12.8f   |\n',Y11,-Y12,-Y13);
   fprintf('DET_P = | %12.8f   %12.8f   %12.8f   |\n',-Y12,Y22,-Y23);
   fprintf('        | %12.8f   %12.8f   %12.8f   |\n',-Y13,-Y23,Y33);
   fprintf('\n\n');
   
   fprintf('DET_P =  %12.8f \n',DET_P);
   
   fprintf('\n\n');
   fprintf('         | %12.8f   %12.8f   %12.8f   |\n',I1,-Y12,-Y13);
   fprintf('DET_S1 = | %12.8f   %12.8f   %12.8f   |\n',I2,Y22,-Y23);
   fprintf('         | %12.8f   %12.8f   %12.8f   |\n',I3,-Y23,Y33);
   fprintf('\n\n');
   
   fprintf('DET_S1 =  %12.8f \n',DET_S1);
   
   fprintf('\n\n');
   fprintf('         | %12.8f   %12.8f   %12.8f   |\n',Y11,I1,-Y13);
   fprintf('DET_S2 = | %12.8f   %12.8f   %12.8f   |\n',-Y12,I2,-Y23);
   fprintf('         | %12.8f   %12.8f   %12.8f   |\n',-Y13,I3,Y33);
   fprintf('\n\n');
   
   fprintf('DET_S2 =  %12.8f \n',DET_S2);
   
   fprintf('\n\n');
   fprintf('         | %12.8f   %12.8f   %12.8f   |\n',Y11,-Y12,I1);
   fprintf('DET_S3 = | %12.8f   %12.8f   %12.8f   |\n',-Y12,Y22,I2);
   fprintf('         | %12.8f   %12.8f   %12.8f   |\n',-Y13,-Y23,I3);
   fprintf('\n\n');
   
   fprintf('DET_S3 =  %12.8f \n',DET_S3);

   fprintf('\n\n');
   
   format long;
   fprintf('La Tension V1 es : %12.8f Voltios ',V1);
   fprintf('\n\n');
   fprintf('La Tension V2 es : %12.8f Voltios',V2);
   fprintf('\n\n');
   fprintf('La Tension V3 es : %12.8f Voltios \n\n',V3);

end

if  Num_Nudos==4 
   Y11=input('\nValor de Y11 ?  ');
   Y12=input('\nValor de Y12 ?  ');
   Y21=Y12;
   Y13=input('\nValor de Y13 ?  ');
   Y31=Y13;
   Y14=input('\nValor de Y14 ?  ');
   Y41=Y14;
   Y22=input('\nValor de Y22 ?  ');
   Y23=input('\nValor de Y23 ?  ');
   Y32=Y23;
   Y24=input('\nValor de Y24 ?  ');
   Y42=Y24;
   Y33=input('\nValor de Y33 ?  ');
   Y34=input('\nValor de Y34 ?  ');
   Y43=Y34;
   Y44=input('\nValor de Y44 ?  ');

   I1=input('\nCorriente en el nudo 1 ?  ');
   I2=input('\nCorriente en el nudo 2 ?  ');
   I3=input('\nCorriente en el nudo 3 ?  ');
   I4=input('\nCorriente en el nudo 4 ?  ');
   DET_P=det([Y11 -Y12 -Y13 -Y14;-Y21 Y22 -Y23 -Y24;-Y31 -Y32 Y33 -Y34;-Y41 -Y42 -Y43 Y44]);
   DET_S1=det([I1 -Y12 -Y13 -Y14;I2 Y22 -Y23 -Y24;I3 -Y32 Y33 -Y34;I4 -Y42 -Y43 Y44]); 
   DET_S2=det([Y11 I1 -Y13 -Y14;-Y21 I2 -Y23 -Y24;-Y31 I3 Y33 -Y34;-Y41 I4 -Y43 Y44]);
   DET_S3=det([Y11 -Y12 I1 -Y14;-Y21 Y22 I2 -Y24;-Y31 -Y32 I3 -Y34;-Y41 -Y42 I4 Y44]);
   DET_S4=det([Y11 -Y12 -Y13 I1;-Y21 Y22 -Y23 I2;-Y31 -Y32 Y33 I3;-Y41 -Y42 -Y43 I4]);
   V1=DET_S1/DET_P;
   V2=DET_S2/DET_P;
   V3=DET_S3/DET_P;
   V4=DET_S4/DET_P;
   
   fprintf('\n\n');
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',Y11,-Y12,-Y13,-Y14);
   fprintf('DET_P = | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y21,Y22,-Y23,-Y24);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y31,-Y32,Y33,-Y34);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y41,-Y42,-Y43,Y44);
   fprintf('\n\n');
   
   fprintf('DET_P =  %12.8f \n',DET_P);
   
   fprintf('\n\n');
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',I1,-Y12,-Y13,-Y14);
   fprintf('DET_S1= | %12.8f   %12.8f   %12.8f   %12.8f   |\n',I2,Y22,-Y23,-Y24);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',I3,-Y32,Y33,-Y34);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',I4,-Y42,-Y43,Y44);   
   fprintf('\n\n');
   
   fprintf('DET_S1 =  %12.8f \n',DET_S1);
   
   fprintf('\n\n');
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',Y11,I1,-Y13,-Y14);
   fprintf('DET_S2= | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y21,I2,-Y23,-Y24);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y31,I3,Y33,-Y34);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y41,I4,-Y43,Y44);
   fprintf('\n\n');
   
   fprintf('DET_S2 =  %12.8f \n',DET_S2);
   
   fprintf('\n\n');
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',Y11,-Y12,I1,-Y14);
   fprintf('DET_S3= | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y21,Y22,I2,-Y24);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y31,-Y32,I3,-Y34);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y41,-Y42,I4,Y44);
   fprintf('\n\n');
   
   fprintf('DET_S3 =  %12.8f \n',DET_S3);

   fprintf('\n\n');
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',Y11,-Y12,-Y13,I1);
   fprintf('DET_S4= | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y21,Y22,-Y23,I2);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y31,-Y32,Y33,I3);
   fprintf('        | %12.8f   %12.8f   %12.8f   %12.8f   |\n',-Y41,-Y42,-Y43,I4);
   fprintf('\n\n');
   
   fprintf('DET_S4 =  %12.8f \n',DET_S4);
   fprintf('\n\n');
   
   format long;
   fprintf('La Tension V1 es : %8.8f Voltios ',V1);
   fprintf('\n\n');
   fprintf('La Tension V2 es : %8.8f Voltios',V2);
   fprintf('\n\n');
   fprintf('La Tension V3 es : %8.8f Voltios',V3);
   fprintf('\n\n');
   fprintf('La Tension V4 es : %8.8f Voltios \n\n',V4);


end

