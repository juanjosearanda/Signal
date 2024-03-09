% Autor:   Dr. Juan Jose Aranda Aboy;        Prof. Titular UNAB
%          CHILE -- CUBA ;                   3 de Noviembre de 2008 
%
clear all, close all
r = .9;
q = 45;
zeta = cos((pi/180)*q);
b = [1,-2*r*zeta,1];
a = [1, -2*r*zeta, r^2];
w = linspace(0,pi,400);
[h,w] = freqz(b,a,w);
figure
subplot(2,1,1) 
plot(w,abs(h))
xlabel('Frecuencia'), ylabel('Magnitud'), title('Respuesta en Frecuencia')
subplot(2,1,2)
plot(w,angle(h))
xlabel('Frecuencia'), ylabel('Fase')
n=[0:80];
wi=0.35;
x=cos(wi*n);
y=filter(b,a,x);
figure
plot(n,y,'o',n,x,'+'), title('Historia temporal')
xlabel('Tiempo'), legend('Señal de salida', 'Señal de entrada')