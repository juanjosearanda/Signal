% Comparación de filtros IIR y filtros FIR de fase lineal
clear
% genere los coeficientes del filtro
bdwd = .2;                           % el ancho de banda del filtro es .2*pi
[b,a] = ellip(4,.5,20,bdwd);                % filtro IIR
fltord=40;                            % orden del filtro FIR
h2 = fir1 (fltord,bdwd,kaiser(fltord+1,2));  % filtro FIR de fase lineal
% genere la señal de entrada
pw = 15;                             % ancho del pulso
n = [0:pw*5];                        % vector tiempo
x = zeros(size(n));
x(1 :pw) = ones(1 ,pw);                   % señal de entrada pulso
% calcule las señales de salida
y1 = filter(b,a,x);                         % respuesta del filtro IIR
y2 = filter(h2,1,x);                        % respuesta del filtro FIR
% genere la señal retardada de entrada para el gráfico del FIR
xshift = zeros(size(n));
delay=ceil((fltord-1)/2);
xshift(delay:delay+pw-1) = ones(1,pw);
% grafique las respuestas del filtro
figure(1)
subplot(2,1,1), plot(n,x,'+r',n,y1,'ob')
title('Señales de entrada y salida del filtro IIR')
xlabel('tiempo')
legend('señal de entrada','señal de salida')
subplot(2,1,2), plot(n,xshift,'+r',n,y2,'ob')
title('Señales de entrada y salida del filtro FIR')
xlabel('tiempo')
legend('señal de entrada','señal de salida')
% calcule la respuesta de frecuencia de los filtros
[hmag1,f1] = freqz(b,a);                 % respuesta de frecuencia IIR
[hmag2,f2] = freqz(h2,1);                % respuesta de frecuencia FIR
% grafique magnitud y fase de los filtros
figure(2)
subplot(2,1,1), plot(f1,abs(hmag1),'og',f2,abs(hmag2),'--b')
title('Magnitud del filtro elíptico y del filtro FIR')
xlabel('frecuencia, rad')
legend('Flltro IIR','Filtro FIR')
subplot(2,1,2)
plot(f1,(180/pi)*unwrap(angle(hmag1)),'og',f2,(180/pi)*unwrap(angle(hmag2)),'--b')
title('Fase del filtro elíptico y del FIR')
xlabel('frecuencia, rad')
ylabel('grados')
legend('Filtro IIR','FiltroFIR')
%calcule la TFTD de las señales de entrada y salida
[xspec,fx] = freqz (x,1);                 % TFTD de la señal de entrada
[y1spec,fy1] = freqz (y1,1);              % TFTD de la señal de salida
[y2spec,fy2] = freqz (y2,1);              % TFTD de la señal de salida
% espectros de amplitud normalizados
xmagn = abs(xspec)./max(abs(xspec));
y1magn = abs(y1spec)./max(abs(y1spec));
y2magn = abs(y2spec)./max (abs (y2spec));
% espectros de fase sin envolvente
xphs = (180/pi)*unwrap(angle (xspec));
y1phs = (180/pi)*unwrap (angle (y1spec));
y2phs = (180/pi)*unwrap (angle (y2spec));
% gráfico de amplitud y espectros de fase de las señales de entrada y salida
figure(3)
subplot(2,1,1), plot (fx,xmagn,'+r', fy1 ,y1magn,'--g',fy2,y2magn,':b')
xlabel('frequencia, rad')
title('Espectro de amplitud de x, y1 y y2')
legend('señal de entrada','señal de salida IIR','Señal de salida FIR')
subplot(2,1,2), plot (fx,xphs,'+r',fy1,y1phs,'--g',fy2,y2phs,':b')
xlabel('frecuencia,rad')
ylabel('grados')
title('Fase de la FFT de x, y1 y y2')
legend('señal de entrada','señal de salida IIR','Señal de salida FIR')
