% Autor:   Dr. Juan Jose Aranda Aboy;        Prof. Titular UNAB
%          CHILE -- CUBA ;                   3 de Noviembre de 2008 
%
clear all, close all
order = 4;
ripple = 3;
cutoff = 2;
normcf = 2/pi;
[b,a]=cheby1(order,ripple,normcf)
w=linspace(0,pi,600);
h=freqz(b,a,w);
mag=abs(h);
phase=(180/pi)*angle(h);
subplot(2,1,1),plot(w,mag),xlabel('Frecuencia discreta'),title('Magnitud')
subplot(2,1,2),plot(w,phase),xlabel('Frecuencia discreta'),title('Fase')