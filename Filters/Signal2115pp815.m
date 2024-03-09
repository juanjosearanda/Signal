% Promediado
clear
n = [0:20];                   % vector de tiempo para la señal de entrada
x = n;                        % señal de entrada
N=3;                          % parámetro de promedio
h=(1/N)*[0:N-1];              % función respuesta al impulso
y = conv(h,x);                % comando de convolución
ny=[0:length(y)-1];           % vector tiempo para la señal de salida
plot(n,x,'o',ny,y,'*')
xlabel ('tiempo')
title ('promedio')
