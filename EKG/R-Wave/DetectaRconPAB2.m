% Programa ilustrativo de ejemplo
% Deteccion de Onda R mediante filtrado Pasa Alto
% con Filtro Butterworth de 2do orden
% Autor: Dr. Juan Jos� Aranda Aboy
%        Profesor e Investigador Titular
%        Ingenier�a Biom�dica
%        Universidad de Valparaiso
%        19 de Abril de 2004
clear
load ecg1
umbral = -2e-3 ;
% Filtro Pasa Alto Butterworth de orden 2
[bpa,apa] = butter(2,0.85,'high') ;
y  = filter(bpa,apa,ecg(:,2)) ;
figure
subplot(2,1,1), plot(ecg(:,1),ecg(:,2)), xlabel('Se�al Original')
subplot(2,1,2), plot(ecg(:,1),y), xlabel('Filtrada Pasa Alto Butterworth de 2do Orden')
mind2 = y < umbral ;
%figure
%stem(ecg(:,1),mind2)
lugar = zeros(950,1) ;
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
f = figure ;
set(f, 'NumberTitle', 'off') ;
set(f, 'Name', 'Deteccion de la Onda R del ECG mediante Filtrado Pasa Alto Butterworth de Orden 2' ) ;
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
