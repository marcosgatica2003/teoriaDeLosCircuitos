w=linspace(-4,4,1000);
alfa=2*acosh(w);
beta=2*asin(w);
P1=plot(w,alfa,'r');
set(P1,'color',[0,0,1],'linewidth',2);
hold on;
P2=plot(w,beta);
set(P2,'color',[1,0,0],'linewidth',2);
grid on;