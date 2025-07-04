% routh.m realiza el calculo del algoritmo de Routh-Hourwitz y permite aplicarlo
% a polinomios hasta de grado 8.
%
% Desarrollado por Ing. Juan Jose Garcia Abad - UTN Fac. Cordoba
format long e
echo off
fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
fprintf('                  ALGORITMO DE ROUTH-HOURWITZ');
fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');



Grado=input('\nGrado del polinomio [3 a 8] ?');

if  Grado==8 
   A8=input('\nValor de A8 ?');
   A7=input('\nValor de A7 ?');
   A6=input('\nValor de A6 ?');
   A5=input('\nValor de A5 ?');
   A4=input('\nValor de A4 ?');
   A3=input('\nValor de A3 ?');
   A2=input('\nValor de A2 ?');
   A1=input('\nValor de A1 ?');
   A0=input('\nValor de A0 ?');
   B6=(A7*A6-A8*A5)/A7;
   B4=(A7*A4-A8*A3)/A7;
   B2=(A7*A2-A8*A1)/A7;
   B0=A0;
   FlagB6=0;
   if ((B6==0) & (B4==0) & (B2==0) & (B1==0)) 
               B6=A7*7;
               B4=A5*5;
               B2=A3*3;
               B0=0;
               FlagB6=1;
            end 
   if B6==0 B6=1e-10; FlagB6=2; end         
   C5=(B6*A5-A7*B4)/B6;
   C3=(B6*A3-A7*B2)/B6;
   C1=(B6*A1-A7*B0)/B6;
   FlagC5=0;
   if ((C5==0)& (C3==0) & (C1==0)) 
               C5=B6*6;
               C3=B4*4;
               C1=B2*2;
               FlagC5=1;
            end 
   if C5==0 C5=1e-10; FlagC5=2; end
   
   FlagD4=0;
   D4=(C5*B4-B6*C3)/C5;
   D2=(C5*B2-B6*C1)/C5;
   D0=A0;
   if(D4==0) D4=1e-10; FlagD4=1; end
        
   FlagE3=0;
   E3=(D4*C3-C5*D2)/D4;
   E1=(D4*C1-C5*D0)/D4;
   if ((E3==0)&(E1==0))
      E3=D4*4;
      E1=D2*2;
      FlagE3=1;
   end
   if(E3==0) E3=1e-10; FlagE3=2; end
   
   FlagF2=0;
   F2=(E3*D2-D4*E1)/E3;
   if(F2==0) F2=1e-10; FlagF2=2; end
   
   F0=A0;
   
   FlagG1=0;
   G1=(F2*E1-E3*F0)/F2;
   if(G1==0)
      G1=F2*2;
      FlagG1=1;
   end

   H0=A0;
   fprintf('\n\n******************************************************************************************************\n'); 
   fprintf('\n    %8.4f*P8 + %8.4f*P7 + %8.4f*P6 + %8.4f*P5 + %8.4f*P4 + %8.4f*P3 + %8.4f*P2 + %8.4f*P1 + %8.4f \n',A8,A7,A6,A5,A4,A3,A2,A1,A0); 
   fprintf('\n******************************************************************************************************\n'); 
   fprintf('\n    P8  |     %8.4f     %8.4f      %8.4f      %8.4f      %8.4f \n',A8,A6,A4,A2,A0);   
   fprintf('\n    P7  |     %8.4f     %8.4f      %8.4f      %8.4f      \n',A7,A5,A3,A1);   
   if FlagB6==0
   fprintf('\n    P6  |     %8.4f     %8.4f      %8.4f      %8.4f      \n',B6,B4,B2,B0);   
	end
	   
   if FlagB6==2
      fprintf('\n    P6  |     %8.4f     %8.4f      %8.4f      %8.4f      \n',0,B4,B2,B0);  
      fprintf('\n    P6  |     %8.4f     %8.4f      %8.4f      %8.4f      \n',B6,B4,B2,B0); 
	end

   if FlagC5==0
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
   end
   if FlagC5==1
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',0,0,0); 
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
   end
   
   if FlagC5==2
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',0,C3,C1); 
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
   end
   
   if FlagD4==0
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;  
   end
   
   if FlagD4==2
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',0,D2,D0) ;  
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;
   end
   
   if FlagE3==0
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==1
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,0);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==2
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,E1);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagF2==0
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagF2==2
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',0,F0);   
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagG1==0
   fprintf('\n    P1  |     %8.4f     \n',G1);   
   end
   
   if FlagG1==1
   fprintf('\n    P1  |     %8.4f     \n',0);   
   fprintf('\n    P1  |     %8.4f     \n',G1);
   end
      
   fprintf('\n    P0  |     %8.4f     \n',H0);
   P(1)=sign(A8);P(2)=sign(A7);P(3)=sign(B6);P(4)=sign(C5);P(5)=sign(D4);P(6)=sign(E3);P(7)=sign(F2);P(8)=sign(G1);P(9)=sign(H0);
   Raices=0;
   for R=1:8
   Signo= P(R)+P(R+1);    
       if Signo==0  Raices=Raices+1;
       end 
   end
   fprintf('\n\n	El polinomio dado tiene %2d raices a parte real positiva\n\n',Raices);    
   fprintf('\n\n	Las raices del polinomio dado son:\n\n');
   
   a=roots([A8,A7,A6,A5,A4,A3,A2,A1,A0]);
    Raices=size(a);
   for I = 1:Raices,
        fprintf('	S%1.0d = %8.4f    %8.4f*i\n',I,real(a(I)),imag(a(I)));     
         end

   fprintf('\n\n');
   

end


if  Grado==7 

   A7=input('\nValor de A7 ?');
   B6=input('\nValor de A6 ?');
   A5=input('\nValor de A5 ?');
   B4=input('\nValor de A4 ?');
   A3=input('\nValor de A3 ?');
   B2=input('\nValor de A2 ?');
   A1=input('\nValor de A1 ?');
   B0=input('\nValor de A0 ?');
        
   C5=(B6*A5-A7*B4)/B6;
   C3=(B6*A3-A7*B2)/B6;
   C1=(B6*A1-A7*B0)/B6;
   
   FlagC5=0;
   if ((C5==0)& (C3==0) & (C1==0)) 
               C5=B6*6;
               C3=B4*4;
               C1=B2*2;
               FlagC5=1;
            end 
   if C5==0 C5=1e-10; FlagC5=2; end
   
   FlagD4=0;
   D4=(C5*B4-B6*C3)/C5;
   D2=(C5*B2-B6*C1)/C5;
   D0=B0;
   if(D4==0) D4=1e-10; FlagD4=1; end
        
   FlagE3=0;
   E3=(D4*C3-C5*D2)/D4;
   E1=(D4*C1-C5*D0)/D4;
   if ((E3==0)&(E1==0))
      E3=D4*4;
      E1=D2*2;
      FlagE3=1;
   end
   if(E3==0) E3=1e-10; FlagE3=2; end
   
   FlagF2=0;
   F2=(E3*D2-D4*E1)/E3;
   if(F2==0) F2=1e-10; FlagF2=2; end
   
   F0=B0;
   
   FlagG1=0;
   G1=(F2*E1-E3*F0)/F2;
   if(G1==0)
      G1=F2*2;
      FlagG1=1;
   end

   H0=B0;
   
   fprintf('\n\n******************************************************************************************************\n'); 
   fprintf('\n    %8.4f*P7 + %8.4f*P6 + %8.4f*P5 + %8.4f*P4 + %8.4f*P3 + %8.4f*P2 + %8.4f*P1 + %8.4f \n',A7,B6,A5,B4,A3,B2,A1,B0); 
   fprintf('\n******************************************************************************************************\n'); 
   fprintf('\n    P7  |     %8.4f     %8.4f      %8.4f      %8.4f      \n',A7,A5,A3,A1);   
   fprintf('\n    P6  |     %8.4f     %8.4f      %8.4f      %8.4f      \n',B6,B4,B2,B0);   
	 
   
   if FlagC5==0
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
   end
   if FlagC5==1
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',0,0,0); 
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
   end
   
   if FlagC5==2
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',0,C3,C1); 
      fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
   end
   
   if FlagD4==0
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;  
   end
   
   if FlagD4==2
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',0,D2,D0) ;  
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;
   end
   
   if FlagE3==0
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==1
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,0);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==2
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,E1);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagF2==0
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagF2==2
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',0,F0);   
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagG1==0
   fprintf('\n    P1  |     %8.4f     \n',G1);   
   end
   
   if FlagG1==1
   fprintf('\n    P1  |     %8.4f     \n',0);   
   fprintf('\n    P1  |     %8.4f     \n',G1);
   end
   
   fprintf('\n    P0  |     %8.4f     \n',H0);
   P(2)=sign(A7);P(3)=sign(B6);P(4)=sign(C5);P(5)=sign(D4);P(6)=sign(E3);P(7)=sign(F2);P(8)=sign(G1);P(9)=sign(H0);
   Raices=0;
   for R=2:8
   Signo= P(R)+P(R+1);    
       if Signo==0  Raices=Raices+1;
       end 
   end
   fprintf('\n		El polinomio dado tiene %2d raices a parte real positiva\n\n',Raices);    
  
   fprintf('\n\n	Las raices del polinomio dado son:\n\n');
   a=roots([A7,B6,A5,B4,A3,B2,A1,B0]);
    Raices=size(a);
   for I = 1:Raices,
        fprintf('	S%1.0d = %8.4f    %8.4f*i\n',I,real(a(I)),imag(a(I)));     
         end

   fprintf('\n\n');
   
end

if  Grado==6
   B6=input('\nValor de A6 ?');
   C5=input('\nValor de A5 ?');
   B4=input('\nValor de A4 ?');
   C3=input('\nValor de A3 ?');
   B2=input('\nValor de A2 ?');
   C1=input('\nValor de A1 ?');
   B0=input('\nValor de A0 ?');
   
   FlagD4=0;
   D4=(C5*B4-B6*C3)/C5;
   D2=(C5*B2-B6*C1)/C5;
   D0=B0;
   if(D4==0) D4=1e-10; FlagD4=2; end
        
   FlagE3=0;
   E3=(D4*C3-C5*D2)/D4;
   E1=(D4*C1-C5*D0)/D4;
   if ((E3==0)&(E1==0))
      E3=D4*4;
      E1=D2*2;
      FlagE3=1;
   end
   if(E3==0) E3=1e-10; FlagE3=2; end
   
   FlagF2=0;
   F2=(E3*D2-D4*E1)/E3;
   if(F2==0) F2=1e-10; FlagF2=2; end
   
   F0=B0;
   
   FlagG1=0;
   G1=(F2*E1-E3*F0)/F2;
   if(G1==0)
      G1=F2*2;
      FlagG1=1;
   end

   H0=B0;
   fprintf('\n\n******************************************************************************************************\n'); 
   fprintf('\n    %8.4f*P6 + %8.4f*P5 + %8.4f*P4 + %8.4f*P3 + %8.4f*P2 + %8.4f*P1 + %8.4f \n',B6,C5,B4,C3,B2,C1,B0); 
   fprintf('\n******************************************************************************************************\n'); 
   fprintf('\n    P6  |     %8.4f     %8.4f      %8.4f      %8.4f      \n',B6,B4,B2,B0);   
	 fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
      
   if FlagD4==0
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;  
   end
   
   if FlagD4==2
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',0,D2,D0) ;  
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;
   end
   
   if FlagE3==0
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==1
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,0);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==2
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,E1);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagF2==0
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagF2==2
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',0,F0);   
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagG1==0
   fprintf('\n    P1  |     %8.4f     \n',G1);   
   end
   
   if FlagG1==1
   fprintf('\n    P1  |     %8.4f     \n',0);   
   fprintf('\n    P1  |     %8.4f     \n',G1);
   end
   
   fprintf('\n    P0  |     %8.4f     \n',H0);
   
   P(3)=sign(B6);P(4)=sign(C5);P(5)=sign(D4);P(6)=sign(E3);P(7)=sign(F2);P(8)=sign(G1);P(9)=sign(H0);
   Raices=0;
   for R=3:8
   Signo= P(R)+P(R+1);    
       if Signo==0  Raices=Raices+1;
       end 
   end    
   fprintf('\n\n	El polinomio dado tiene %2d raices a parte real positiva\n\n',Raices);  
   fprintf('   	Las raices del polinomio dado son:\n\n');
   a=roots([B6,C5,B4,C3,B2,C1,B0]);
   Raices=size(a);
   for I = 1:Raices,
        fprintf('	S%1.0d = %8.4f    %8.4f*i\n',I,real(a(I)),imag(a(I)));     
         end
   fprintf('\n\n');
   

end

if  Grado==5
   C5=input('\nValor de A5 ?');
   D4=input('\nValor de A4 ?');
   C3=input('\nValor de A3 ?');
   D2=input('\nValor de A2 ?');
   C1=input('\nValor de A1 ?');
   D0=input('\nValor de A0 ?');
            
   FlagE3=0;
   E3=(D4*C3-C5*D2)/D4;
   E1=(D4*C1-C5*D0)/D4;
   if ((E3==0)&(E1==0))
      E3=D4*4;
      E1=D2*2;
      FlagE3=1;
   end
   if(E3==0) E3=1e-10; FlagE3=2; end
   
   FlagF2=0;
   F2=(E3*D2-D4*E1)/E3;
   if(F2==0) F2=1e-10; FlagF2=2; end
   
   F0=D0;
   
   FlagG1=0;
   G1=(F2*E1-E3*F0)/F2;
   if(G1==0)
      G1=F2*2;
      FlagG1=1;
   end

   H0=D0;
   fprintf('\n\n******************************************************************************************************\n'); 
   fprintf('\n    %8.4f*P5 + %8.4f*P4 + %8.4f*P3 + %8.4f*P2 + %8.4f*P1 + %8.4f \n',C5,D4,C3,D2,C1,D0); 
   fprintf('\n******************************************************************************************************\n'); 
      
	fprintf('\n    P5  |     %8.4f     %8.4f      %8.4f      \n',C5,C3,C1); 
      
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;  
      
   if FlagE3==0
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==1
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,0);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagE3==2
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',0,E1);   
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
   end
   
   if FlagF2==0
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagF2==2
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',0,F0);   
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagG1==0
   fprintf('\n    P1  |     %8.4f     \n',G1);   
   end
   
   if FlagG1==1
   fprintf('\n    P1  |     %8.4f     \n',0);   
   fprintf('\n    P1  |     %8.4f     \n',G1);
   end
   
   fprintf('\n    P0  |     %8.4f     \n',H0);
   P(4)=sign(C5);P(5)=sign(D4);P(6)=sign(E3);P(7)=sign(F2);P(8)=sign(G1);P(9)=sign(H0);
   Raices=0;
   for R=4:8
   Signo= P(R)+P(R+1);    
       if Signo==0  Raices=Raices+1;
       end 
   end    
   fprintf('\n\n	El polinomio dado tiene %2d raices a parte real positiva\n\n',Raices);  
   
   fprintf('	Las raices del polinomio dado son:\n\n');
   a=roots([C5,D4,C3,D2,C1,D0]);
    Raices=size(a);
   for I = 1:Raices,
        fprintf('	S%1.0d = %8.4f    %8.4f*i\n',I,real(a(I)),imag(a(I)));     
         end

   fprintf('\n\n');
   

end

if  Grado==4
   D4=input('\nValor de A4 ?');
   E3=input('\nValor de A3 ?');
   D2=input('\nValor de A2 ?');
   E1=input('\nValor de A1 ?');
   D0=input('\nValor de A0 ?');
   
   FlagF2=0;
   F2=(E3*D2-D4*E1)/E3;
   if(F2==0) F2=1e-10; FlagF2=2; end
   
   F0=D0;
   
   FlagG1=0;
   G1=(F2*E1-E3*F0)/F2;
   if(G1==0)
      G1=F2*2;
      FlagG1=1;
   end

   H0=D0;
   fprintf('\n\n******************************************************************************************************\n'); 
   fprintf('\n   %8.4f*P4 + %8.4f*P3 + %8.4f*P2 + %8.4f*P1 + %8.4f \n',D4,E3,D2,E1,D0); 
   fprintf('\n******************************************************************************************************\n'); 
   
   fprintf('\n    P4  |     %8.4f     %8.4f      %8.4f      \n',D4,D2,D0) ;  
      
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
  
   if FlagF2==0
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagF2==2
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',0,F0);   
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
   end
   
   if FlagG1==0
   fprintf('\n    P1  |     %8.4f     \n',G1);   
   end
   
   if FlagG1==1
   fprintf('\n    P1  |     %8.4f     \n',0);   
   fprintf('\n    P1  |     %8.4f     \n',G1);
   end
   
   fprintf('\n    P0  |     %8.4f     \n',H0);
   P(5)=sign(D4);P(6)=sign(E3);P(7)=sign(F2);P(8)=sign(G1);P(9)=sign(H0);
   Raices=0;
   for R=5:8
   Signo= P(R)+P(R+1);    
       if Signo==0  Raices=Raices+1;
       end 
   end    
   fprintf('\n\n	El polinomio dado tiene %2d raices a parte real positiva\n\n',Raices);  
   
   fprintf('	Las raices del polinomio dado son:\n\n');
   a=roots([D4,E3,D2,E1,D0]);
    Raices=size(a);
   for I = 1:Raices,
        fprintf('	S%1.0d = %8.4f    %8.4f*i\n',I,real(a(I)),imag(a(I)));     
         end

   fprintf('\n\n');
   
   
end

if  Grado==3
   E3=input('\nValor de A3 ?');
   F2=input('\nValor de A2 ?');
   E1=input('\nValor de A1 ?');
   F0=input('\nValor de A0 ?');
   
   FlagG1=0;
   G1=(F2*E1-E3*F0)/F2;
   if(G1==0)
      G1=F2*2;
      FlagG1=1;
   end

   H0=F0;
   fprintf('\n\n******************************************************************************************************\n'); 
   fprintf('\n   %8.4f*P3 + %8.4f*P2 + %8.4f*P1 + %8.4f \n',E3,F2,E1,F0); 
   fprintf('\n******************************************************************************************************\n'); 
   fprintf('\n    P3  |     %8.4f     %8.4f      \n',E3,E1);   
  
   fprintf('\n    P2  |     %8.4f     %8.4f      \n',F2,F0);   
      
   if FlagG1==0
   fprintf('\n    P1  |     %8.4f     \n',G1);   
   end
   
   if FlagG1==1
   fprintf('\n    P1  |     %8.4f     \n',0);   
   fprintf('\n    P1  |     %8.4f     \n',G1);
   end
   
   fprintf('\n    P0  |     %8.4f     \n',H0);
   P(6)=sign(E3);P(7)=sign(F2);P(8)=sign(G1);P(9)=sign(H0);
   Raices=0;
   for R=6:8
   Signo= P(R)+P(R+1);    
       if Signo==0  Raices=Raices+1;
       end 
   end    
   fprintf('\n\n	El polinomio dado tiene %2d raices a parte real positiva\n\n',Raices);  
   
   fprintf('	Las raices del polinomio dado son:\n\n');
   a=roots([E3,F2,E1,F0]);
    Raices=size(a);
   for I = 1:Raices,
        fprintf('	S%1.0d = %8.4f    %8.4f*i\n',I,real(a(I)),imag(a(I)));     
         end

   fprintf('\n\n');
   

end

fprintf('\n**************************************************************************\n');
fprintf('\n Se solicita reportar errores a jgarcia_abad@electronica.frc.utn.edu.ar  \n');
fprintf('     GRACIAS\n');
fprintf('\n**************************************************************************\n');