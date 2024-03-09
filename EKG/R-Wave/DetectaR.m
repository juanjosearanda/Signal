% Programa ilustrativo de ejemplo
% Deteccion de Onda R mediante derivadas
% Autor: Dr. Juan José Aranda Aboy
%        Profesor e Investigador Titular
%        Ingeniería Biomédica
%        Universidad de Valparaiso
%        19 de Abril de 2004
clear
load ecg1
d1 = conv(ecg(:,2), [-1 1]) ;
d2 = conv(d1, [-1 1]) ;
maxd1 = abs(d1(1:950)) > 0.2 ;
mind2 = d2(1:950) < -0.15 ;
f1 = figure ;
set(f1, 'NumberTitle', 'off') ;
set(f1, 'Name', 'Deteccion de la Onda R del ECG mediante calculo de la 1ra y 2da derivada' ) ;
subplot(3,1,1), plot(ecg(:,1),ecg(:,2)), xlabel('Original')
subplot(3,1,2), plot(ecg(:,1),d1(1:950)), xlabel('1ra derivada')
subplot(3,1,3), plot(ecg(:,1),d2(1:950)), xlabel('2da derivada')
f2 = figure ;
set(f2, 'NumberTitle', 'off') ;
set(f2, 'Name', 'Deteccion de la Onda R del ECG mediante calculo de la 1ra y 2da derivada' ) ;
subplot(3,1,1), plot(ecg(:,1),maxd1), xlabel('Maximos de la 1ra derivada')
subplot(3,1,2), plot(ecg(:,1),mind2), xlabel('Minimos de la 2da derivada')
lugar = zeros(950,1) ;
subplot(3,1,3)
for i=10:1:940
    if mind2(i) == 1
        mayor = ecg(i,2) ;
        posicion = i ;
        for j= i-10:1:i+10
            if mayor < ecg(j,2)
                mayor = ecg(j,2) ;
                posicion = j ;
            end
        end
        lugar(posicion) = 1;
    end
end
stem(ecg(:,1),lugar), xlabel('Localizacion')
f3 = figure ;
set(f3, 'NumberTitle', 'off') ;
set(f3, 'Name', 'Deteccion de la Onda R del ECG mediante calculo de la 1ra y 2da derivada' ) ;
plot(ecg(:,1),ecg(:,2))
xlabel('Numero de Muestra')
ylabel('Amplitud')
posi = [] ;
valo = [] ;
hold on
for i=1:1:950
    if lugar(i) == 1
        posi = [posi,i] ;
        valo = [valo, ecg(i,2) ] ;
        stem(ecg(i,1),ecg(i,2),'-.rx')
    end
end
hold off
disp('Posiciones de los "peaks" de la Onda R:')
posi
disp('Valores de la Onda R en dichos "peaks":')
valo
