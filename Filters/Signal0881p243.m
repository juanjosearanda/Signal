clear all
T0 = 2;
ep = 1;
t0 = 0;
A = 1;
w0 = 2*pi/T0;
nterm = 10;
X0 = A*ep/T0;
for kk=1:nterm
X(kk)=X0*exp(-j*kk-w0*t0))*sinc(kk*ep/T0);
X(kk)=X0*(exp(-j*kk-w0*t0))*sinc(kk*ep/T0);
for kk=1:nterm
X(kk)=X0*(exp(-j*kk-w0*t0))*sinc(kk*ep/T0);
end
Am = 2*abs(X)
qm = angle(X)
t = linspace(-2*T0+ep/2, 2*T0 -ep/2, 400);
x = X0*ones(size(t));
for jj=1:nterm
x = x + Am(jj)*cos(jj*w0*t+qm(jj));
end
plot(t,x), title('Serie de Fourier'), xlabel('Tiempo')
Xt = abs(X);
Amp = [fliplr(Xt),X0,Xt];
w = [-nterm:nterm]*w0;
figure, plot(w,Amp), title('Espectro bilateral de Amplitud'), xlabel('frecuencia, rad/s')
Pt = abs(X).^2;
Pwr = [fliplr(Pt),X0^2,Pt];
figure, plot(w,Pwr), title('Espectro de Potencia'), xlabel('frecuencia, rad/s')
