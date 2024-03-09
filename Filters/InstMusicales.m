function y = InstMusicales(fb,fs,ns) ;
%
% Esta funcion devuelve el sonido de un Diapason, un Clarinete y una
% Trompeta en la frecuencia que recibe como parametro de entrada.
% Muestra que los armonicos se comportan iguales, independiente del tono
%
% Bibliografia: "Fisica para las Ciencias de la Vida" 
%               D Jou, JE Llebot y C Perez
%               McGrawHill 1994, p282
%
% USADA COMO:
%             [y]= InstMusicales(fb,fp,fs,nt) 
%
% donde:
%       fb -- Tono (Nota Musical deseada) en hertzios:
%
%       fs -- Frecuencia de Muestreo. Valores tipicos:
%             8000Hz, 11025Hz, 16KHz, 22KHz, 44KHz, 48KHz
%
%       ns -- Total de segundos a generar 
%
% Autores: MSc. Gloria Lidia Appelgren Lara; Prof. Asociado UNICIT 
%       y  Dr. Juan Jose Aranda Aboy;        Prof. Titular UV
%          CHILE -- CUBA ;                   20 de Diciembre de 2003 
%
if nargin < 1 fb = 440 ;  end % Tono asumido: LA
if nargin < 2 fs = 8000 ; ns = 1 ; end % Frecuencia de Muestreo
if nargin < 3 ns = 1 ;  end % Portadora de la vocal
%% Vector de trabajo
t = linspace(-1,1,ns*fs) ;
%% Diapason
pd = cos(2*pi*440*t) ; 
sound(pd,8000)
%% Clarinete
pc = 2.5*pd + 1.3*cos(4*pi*440*t) + 2.7*cos(6*pi*440*t) + 1.4*cos(8*pi*440*t) + 2.2*cos(10*pi*440*t) + 1.4*cos(12*pi*440*t) + 2*cos(14*pi*440*t) ;
sound(pc,8000)
%% Trompeta
pt = 1.76*pd + 2.12*cos(4*pi*440*t) + 3*cos(6*pi*440*t) + 1.8*cos(8*pi*440*t) + cos(10*pi*440*t) ;
sound(pt,8000)
figure
subplot(3,1,1), plot(t,pd), ylabel('Intensidad')%%, axis([1 100 min(pd) max(pd)])
xlabel('Diapason') 
subplot(3,1,2), plot(t,pc)%%, axis([1 100 min(pc) max(pc)])
xlabel('Clarinete') 
subplot(3,1,3), plot(t,pt)%%, axis([1 100 min(pt) max(pt)])
xlabel('Trompeta') 
figure
[fd,td] = periodogram(pd) ;
subplot(3,1,1), plot(td,fd), ylabel('Intensidad relativa')
[fc,tc] = periodogram(pc) ;
subplot(3,1,2), plot(tc,fc)
[ft,tt] = periodogram(pt) ;
subplot(3,1,3), plot(tt,ft)
%%subplot
%%title('Instrumentos Musicales')
