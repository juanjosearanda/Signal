clear
M = 15 ;                             % Orden del filtro
nd = (M-1)/2;                        % Retardo de grupo
bdwd = 1.5                           % Ancho de banda del filtro
n = [0:M-1] ;                        % Vector de tiempo
% Calcular coeficientes del filtro:
h = bdwd/pi*sinc( (bdwd/pi)*(n-nd) ) % Calcular funcion de respuesta a impulso
hm = h.*hamming(M)' ;                % Ventana de la funcion de respuesta a impulso
% Calcular la respuesta en frecuencia
[H,w] = freqz(hm,1,256) ;
mag = 20 * log10 ( abs(H) ) ;        % Magnitud
% Grafica de la magnitud de la funcion de respuesta en frecuencia
plot(w,mag)
title ('Filtro de Fase Lineal')
xlabel('Frecuencia -discreta-')
ylabel('dB')
