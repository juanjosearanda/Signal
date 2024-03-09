% 
% Autores: MSc. Gloria Lidia Appelgren Lara; Prof. Asociado UNICIT 
%       y  Dr. Juan Jose Aranda Aboy;        Prof. Titular UV
%          CHILE -- CUBA ;                   10 de Enero de 2004 
%
clear
% Crear vector a 440 Hz de 100 milisegundos
fs = 8000 ; % Frecuencia de Muestreo
t = (1:800)/fs ; % Marco de 100 milisegundos
% Tono puro
s = sin(2*pi*t*440) ;
%%%% plot(t,s)
sound(s)
% Agregar armonico
s1 = sin(2*pi*t*440) + sin(2*pi*t*880) ;
%%%% figure, plot(t,s1)
sound(s1)
% Agregar dos armonicos
s2 = sin(2*pi*t*440) + 0.5*sin(2*pi*t*880) + 0.5*sin(2*pi*t*1760) ;
%%OJO figure, plot(t,[s' s1' s2'] )
sound(s2)
figure
subplot( 3,1,1), plot(t,s)
subplot( 3,1,2), plot(t,s1)
subplot( 3,1,3), plot(t,s2)
% Construir filtro eliptico pasabanda 300 - 500 Hz
wp1 = 300/4000; wp2 = 500/4000;
ws1 = 250/4000; ws2 = 550/4000;
wp = [wp1 wp2]; ws = [ws1 ws2];
rp = 0.1; rs = 40;
[n,Wn] = ellipord(wp, ws, rp, rs)
% Determinar coeficientes del filtro
[b,a] = ellip(n,.1,40,Wn)
% Magnitud y Fase del filtro normalizada segun frecuencia de Nyquist
% figure, freqz(b,a)
% Calcular y dibujar respuesta en frecuencias del filtro
% [H,w] = freqz(b,a) ;
% figure, plot(w*fs/(2*pi), abs(H) ), grid
% Construir filtro eliptico pasabanda 750 - 950 Hz
wp1m = 750/4000; wp2m = 950/4000;
ws1m = 700/4000; ws2m = 1000/4000;
wpm = [wp1m wp2m]; wsm = [ws1m ws2m];
rp = 0.1; rs = 40;
[nm,Wnm] = ellipord(wpm, wsm, rp, rs)
% Determinar coeficientes del filtro
[bm,am] = ellip(n,.1,40,Wnm)
% Construir filtro eliptico pasabanda 1500 - 1850 Hz
wp1n = 1500/4000; wp2n = 1850/4000;
ws1n = 1250/4000; ws2n = 2000/4000;
wpn = [wp1n wp2n]; wsn = [ws1n ws2n];
rp = 0.1; rs = 40;
[nn,Wnn] = ellipord(wpn, wsn, rp, rs)
% Determinar coeficientes del filtro
[bn,an] = ellip(n,.1,40,Wnn)
% Filtrar y mostrar la señal en el tiempo
sf = filter(b,a,s) ;
s1f = filter(b,a,s1) ;
%%OJO figure, plot(t, [sf' s1f'] )
figure
subplot( 2,1,1), plot(t,sf)
subplot( 2,1,2), plot(t,s1f)
s2f1 = filter(b,a,s2) ;
s2f2 = filter(bm,am,s2) ;
s2f3 = filter(bn,an,s2) ;
%%OJO figure, plot(t, [sf s1f s2f1 s2f2 s2f3] )
figure
subplot( 3,1,1), plot(t,s2f1)
subplot( 3,1,2), plot(t,s2f2)
subplot( 3,1,3), plot(t,s2f3)
% Señal original en el dominio de la frecuencia
S = fft(s, 512) ;
% Señal filtrada en el dominio de la frecuencia
SF = fft(sf,512) ;
% Escalar el vector de frecuencia
f = (0:255)/256*(fs/2) ;
figure, plot(f, abs([S(1:256)' SF(1:256)' ] ))
% Señal 1 original en el dominio de la frecuencia
S1 = fft(s1, 512) ;
% Señal 1 filtrada en el dominio de la frecuencia
S1F = fft(s1f,512) ;
figure, plot(f, abs([S1(1:256)' S1F(1:256)' ] ))
% Señal 2 original en el dominio de la frecuencia
S2 = fft(s2, 512) ;
% Señal 2 filtrada en el dominio de la frecuencia
S2F1 = fft(s2f1,512) ;
S2F2 = fft(s2f2,512) ;
S2F3 = fft(s2f3,512) ;
figure, plot(f, abs([S2(1:256)' S2F1(1:256)' S2F2(1:256)' S2F3(1:256)' ] ))
