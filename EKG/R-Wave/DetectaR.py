'''
% Deteccion de Onda R mediante derivadas %
% Autor: Dr. Juan José Aranda Aboy       %
%        Profesor e Investigador Titular %
       
Este es un programa ilustrativo de ejemplo. Debe utilizarse solamente con fines motivacionales,
para y por los estudiantes que comienzan su aprendizaje del Cálculo Diferencial y 
la programación en Python 3.
El código es una versión creada el 9 de Marzo de 2024 a partir del original en MATLAB 6.5, 
escrito el 19 de Abril de 2004
Espero que motive a los estudiantes, y se comparta libremente entre todos los interesados.
¡Disfruten este ejercicio!
'''
import numpy as np
print(np.__version__)
# 1.25.0
import matplotlib.pyplot as plt
# '3.7.1'
ecg1 = np.loadtxt('ecg.csv', delimiter=',')
# Calcular primera derivada
d1 = np.convolve(ecg1[:, 1], [-1, 1], mode='valid')
# Calcular segunda derivada
d2 = np.convolve(d1, [-1, 1], mode='valid')
# Obtener máximos de la primera derivada
maxd1 = abs(d1) > 0.2
# Obtener mínimos de la segunda derivada
mind2 = d2 < -0.15

# Graficar datos del ECG y ambas derivadas
# Crear rejilla 3x1 para subplot
# plt.figure("Deteccion de la Onda R del ECG mediante calculo de la 1ra y 2da derivada")
plt.title('Deteccion de la Onda R del ECG mediante calculo de la 1ra y 2da derivada')
plt.ylabel('Amplitud')
plt.xlabel('Tiempo')
plt.subplot(3, 1, 1)
plt.plot(ecg1[:, 1])
plt.title('ECG Original')
plt.legend()
plt.subplot(3,1,2)
plt.plot(d1)
plt.title('1ra Derivada')
plt.legend()
plt.subplot(3,1,3)
plt.plot(d2)
plt.title('2da Derivada')
plt.legend()

# Identificar las posiciones de los máximos en la señal original 
'''
Código en MATLAB / Octave:
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
'''
# Versión de Copilot en Python 3:
lugar = np.zeros(len(ecg1), dtype=int)
for i in range(10, 941):
    if mind2[i]:
        mayor = ecg1[i, 1]
        posicion = i
        for j in range(i - 10, i + 9):
            if mayor < ecg1[j, 1]:
                mayor = ecg1[j, 1]
                posicion = j
        lugar[posicion] = 1
# Superponer posiciones de los máximos en la señal original:
'''
# Código en MATLAB / Octave:
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
'''
# Versión de Copilot en Python 3:
# Create a stem plot
f2 = plt.figure()
plt.stem(ecg1[:, 0], lugar, linefmt='-.r', markerfmt='xr', basefmt=' ')

# Set plot labels
plt.xlabel('Localizacion')
plt.title('Deteccion de la Onda R del ECG mediante calculo de la 1ra y 2da derivada')

# Create a separate figure for the second plot
f3 = plt.figure()
#f3.canvas.set_window_title('Deteccion de la Onda R del ECG mediante calculo de la 1ra y 2da derivada')

# Plot the original ECG data
plt.plot(ecg1[:, 0], ecg1[:, 1])
plt.xlabel('Numero de Muestra')
plt.ylabel('Amplitud')

# Highlight specific points
posi = []
valo = []
for i in range(950):
    if lugar[i] == 1:
        posi.append(i)
        valo.append(ecg1[i, 1])
        plt.stem(ecg1[i, 0], ecg1[i, 1], linefmt='-.r', markerfmt='xr')

plt.show()

print('¡Espero que hayan disfrutado este ejercicio! ¡Gracias!')
