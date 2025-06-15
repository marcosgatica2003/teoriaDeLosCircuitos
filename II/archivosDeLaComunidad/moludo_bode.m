#!/usr/bin/octave

pkg load control

clc;
clear;


%            55 * P^3 * (P+60)^2 * (P+2000)^2;
% -----------------------------------------------------
%     (P+1)^3 * (P+5) * (P+300) * (P+900) * (P+8000) 

##Z = [0 0 0 -60 -60 -2000 -2000];
##P = [-1 -1 -1 -5 -300 -900 -8000];
##k = 34.80726;
##%K = 10^(34.80726/20) = 55;

%K = 10^(k/20);

%Z = [0 0 80 3000 8000]
%P = [1 1 200 200 10000]
%K = 35
Z = [0 2 2 20 20 3000 20000]
P = [1 8 800 70000 500000]
K = 15

fprintf('Kte = %f\n', K);

sys = zpk(Z,P,K);

%sys = num/den;
[mag, phase, wout] = bode(sys,{10^-1, 10^5});
semilogx(wout, 20*log10(abs(mag)));
grid on;


% Para el pedestal q se pide, 
% w < w_pedestal ===> se conserva 'P'
% w > w_pedestal ===> se conserva 'Nro'
% pedestal_dB = 20*Log10(pedestal)
