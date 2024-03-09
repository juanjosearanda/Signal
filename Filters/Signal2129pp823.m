% Ejemplo 21.2.9: Sistema discreto estándar de segundo orden
clear
% definir la localización de polos
r=0.95;                    % radio
W0=45;                     % ángulo
zeta=cos((pi/180)*W0);
b=[1,-r*zeta,0];           % polinomio numerador
a=[1,-2*r*zeta,r^2];       % polinomio denominador
h=filt(b,a);
figure(1)
zplane(b,a)
title('Gráfico ceros/polos')
% cálculo de respuestas en tiempo
n= [0:40];                 % defina ejes de tiempo
wi = pi/5;                 % frecuencia de la sinusoide de entrada
x=cos(wi*n);               % señal de entrada
y = lsim(h,x);             % calcule la señal de salida
figure(2)
plot (n,x,'o',n,y,'+')     % grafique las señales de entrada y salida
xlabel('tiempo')
title('historias en tiempo')
legend('señal de entrada','señal de salida')