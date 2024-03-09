% Promediado
clear
n = [0:20];                   % vector de tiempo para la se�al de entrada
x = n;                        % se�al de entrada
N=3;                          % par�metro de promedio
h=(1/N)*[0:N-1];              % funci�n respuesta al impulso
y = conv(h,x);                % comando de convoluci�n
ny=[0:length(y)-1];           % vector tiempo para la se�al de salida
plot(n,x,'o',ny,y,'*')
xlabel ('tiempo')
title ('promedio')
