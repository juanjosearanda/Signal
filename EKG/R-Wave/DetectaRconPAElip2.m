% Programa ilustrativo de ejemplo
% Deteccion de Onda R mediante filtrado Pasa Alto
% con Filtro Eliptico de 2do orden
% Autor: Dr. Juan José Aranda Aboy
%        Profesor e Investigador Titular
%        Ingeniería Bioéedica
%        Universidad de Valparaiso
%        19 de Abril de 2004
clear
load ecg1
umbral = 0.08 ;
% Filtro Pasa Alto Eliptico de orden 2
[bepa, aepa] = ellip(2,3,20,0.95,'high')
y  = filter(bepa,aepa,ecg(:,2)) ;
figure
subplot(2,1,1), plot(ecg(:,1),ecg(:,2)), xlabel('Señal Original')
subplot(2,1,2), plot(ecg(:,1),y), xlabel('Filtrada PA Elip 2')
mind2 = y > umbral ;
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
set(f, 'Name', 'Deteccion de la Onda R del ECG mediante Filtrado Pasa Alto Eliptico de Orden 2' ) ;
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
