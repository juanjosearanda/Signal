% Autor:   Dr. Juan Jose Aranda Aboy;        Prof. Titular UNAB
%          CHILE -- CUBA ;                   3 de Noviembre de 2008 
%
clear all, close all
r = 0.95;
W0 = 45;
zeta = cos((pi/180)*W0);
b = [1,-r*zeta,0];
a = [1, -2*r*zeta, r^2];
htf=tf(b,a,-1)
hss=ss(htf)
hzp=zpk(hss)