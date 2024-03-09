function [] = fftej1(N,D)

% fftej1(N,D)
% Ejemplo de una FFT de una se¤al sinusoidal de 20Hz,30Hz,40Hz en un tiempo D.
% N es el numero de puntos de la funci¢n. Elegir preferiblemente valores
% que sean potencias de 2

ts=D/N;
d=ts/2;
t=0:ts:D-d;

x=sin(2*pi*20*t)+sin(2*pi*30*t)+sin(2*pi*40*t);

X=fft(x);

%Reordenar X
M=N/2;
Xaux=X;X(M+1:N)=Xaux(1:M);
X(1:M)=Xaux(M+1:N);

Xm=abs(X)/N;
Xf=unwrap(angle(X))*180/pi;

%Reordenar los indices k
faux(M+1:N)=0:M-1;faux(1:M)=-M:-1;
f=faux/D;

figure;plot(t,x,'-g');zoom;
xlabel('Tiempo (s)');ylabel('x(t)');
title('x=sin(2*pi*20*t)+sin(2*pi*30*t)+sin(2*pi*40*t)');
figure;stem(f,Xm);zoom;
xlabel('Frecuencia (Hz)');ylabel('|X[k]|');
title('Módulo de Coeficientes Espectrales |X[k]|');
figure;stem(f,Xf);zoom;
xlabel('Frecuencia (Hz)');ylabel('Fase (º)');
title('Fase de Coeficientes Espectrales X[k]');


% Reconstrucción de la señal a partir de los X[k]
% Utilizamos un mayor número de puntos fs=500 Hz

fs=500;
ts=1/fs;
d=ts/2;
t=0:ts:D-d;
Ns=length(t);
x=sin(2*pi*20*t)+sin(2*pi*30*t)+sin(2*pi*40*t);

xr=zeros(1,Ns);
for i=1:Ns
	for k=1:N
		xr(i)=xr(i)+X(k)*exp(j*2*pi*f(k)*ts*(i-1))/N;
	end
end

figure;plot(t,x,'g-');hold on;plot(t,xr,'r--');zoom;
title('Comparación entre x(t) y su reconstrucción a partir de X[k]');
xlabel('Tiempo (t)');ylabel('x(t)');

