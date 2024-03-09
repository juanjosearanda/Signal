% Autor:   Dr. Juan Jose Aranda Aboy;        Prof. Titular UNAB
%          CHILE -- CUBA ;                   3 de Noviembre de 2008 
%
clear all, close all
mpm = 10;
Kef = 1;
Apm=[0,1;0,0];
Bpm=[0;Kef/mpm];
Cpm=[1,0];
Dpm = 0;
hpm=ss(Apm,Bpm,Cpm,Dpm)
Ts=1;
hpmd=c2d(hpm,Ts)
n=[0:1000];
w0=1;
vpm=sin(w0*Ts*n);
ypm=lsim(hpmd,vpm);
plot(n*Ts,ypm,'*')
xlabel('Tiempo,seg'), ylabel('Desplazamiento')