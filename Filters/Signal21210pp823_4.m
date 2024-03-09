% Sistema con dos polos reales
clear                                     -
% defina la localizacion de polos
p1 = 0.25;                % primer polo
p2 = 0.85;                % segundo polo
b = [0,1];               % polinomio numerador
a=conv([1,-p1],[1,-p2]);  % polinomio denominador
figure(1)
zplane(b,a)
title('Gráfico de ceros/polos')
% calcule las respuestas en tiempo
n= [0,40];               % defina los ejes de tiempo
x=ones(size(n));         % señal de entrada
y = filter(b,a,x);       % calcule la señal de salida
figure(2)
stem(y)                  % grafique las señales de entrada y salida
xlabel('tiempo')
title('historias en el tiempo')