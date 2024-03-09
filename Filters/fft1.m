%fft
randn('state',0)
t = 0:0.001:0.6;
x = sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + randn(1,length(t));
plot(y(1:50))
Y = fft(y,512);
Pyy = Y.*conj(Y) / 512;
f = 1000*(0:255)/512;
figure,plot(f,Pyy(1:256))


