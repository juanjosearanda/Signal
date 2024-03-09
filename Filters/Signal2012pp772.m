%
% Autor:   Dr. Juan Jose Aranda Aboy;        Prof. Titular (grado 5) UNAB
%          CHILE -- CUBA ;                   28 de Septiembre de 2008 
%
clear
a = -0.8;                       % Definir el parametro de la señal
N = 20;                         % Longitud del vector de tiempo
n = [0:N];                      % Vector de tiempo para la señal de entrada
x = a.^n ;                      % Generar la señal discreta
W = linspace(0,2*pi,400) ;      % Vector de frecuencia
X = 1./( 1 - a*exp(-j*W) ) ;    % Transformada de Fourier en Tiempo Discreto (DTFT)
Xmag = abs(X) ;                 % Espectro de Magnitud
Xphs = angle(X) ;               % Espectro de Fase
Dx = Xmag.^2 ;                  % Densidad espectral de energía
figure
subplot(4,1,1), plot(W,Xmag)    % Graficar espectro de magnitud
title('Espectro de Magnitud')
subplot(4,1,2), plot(W,Xphs)    % Graficar espectro de fase
title('Espectro de Fase')
subplot(4,1,3), plot(W,Dx)      % Graficar espectro de energia
title('Espectro de Energia')
xlabel('frecuencia,rad');
subplot(4,1,4), plot(n,x,'o')   % Señal
title('Señal')
xlabel('Tiempo');