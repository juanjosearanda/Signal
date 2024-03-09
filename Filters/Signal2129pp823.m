% Ejemplo 21.2.9: Sistema discreto est�ndar de segundo orden
clear
% definir la localizaci�n de polos
r=0.95;                    % radio
W0=45;                     % �ngulo
zeta=cos((pi/180)*W0);
b=[1,-r*zeta,0];           % polinomio numerador
a=[1,-2*r*zeta,r^2];       % polinomio denominador
h=filt(b,a);
figure(1)
zplane(b,a)
title('Gr�fico ceros/polos')
% c�lculo de respuestas en tiempo
n= [0:40];                 % defina ejes de tiempo
wi = pi/5;                 % frecuencia de la sinusoide de entrada
x=cos(wi*n);               % se�al de entrada
y = lsim(h,x);             % calcule la se�al de salida
figure(2)
plot (n,x,'o',n,y,'+')     % grafique las se�ales de entrada y salida
xlabel('tiempo')
title('historias en tiempo')
legend('se�al de entrada','se�al de salida')