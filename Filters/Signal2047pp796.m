clear
fs = 10 ;    % Frecuencia de Muestreo
Ts = 1/fs ;  % Periodo de Muestreo
Ns = 20 ;    % Numero de puntos de la TDF
n = 0:Ns-1 ; % Vector de tiempo
alpha = 1; % Parametro de la señal continua
a = exp(-alpha*Ts) ; % Parametro de la señal discreta
x = a.^n ; % Señal discreta
wd = 2*pi/Ns ; % Espaciado de frecuencia de la TDF
ft = 40 ; % Puintos de interpolacion para el eje de las frecuencias
W = 0:wd/ft:2*pi ; % Vector de frecuencias discreto
X = 1./(1-a*exp(-j*W)) ; % TFTD
Xdft = fft(x) ; % TDF
Wdft = n*wd ; % Vector de frecuencias para la TDF
plot(W,abs(X), Wdft, abs(Xdft),'o')
title('Comparacion entre la TFTD y la TDF')
xlabel('Frecuencia en radianes')
ylabel('Espectro de amplitud')
