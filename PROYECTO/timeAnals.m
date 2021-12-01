%DESCIPCIÓN:
%En este archivo se lleva a cabo el analisis en el domi-
%nio del tiempo.
%________________________________________________________
clear;close;clc;
transFunc
t=0:1e-3:300;                  %tiempo de muestreo
x0=[G0;X0;Y0];                 %Condiciones iniciales
u=[heaviside(t);heaviside(t)]; %Entrada escalón a ambas entradas

%Respuesta natural
figure(1)
    initial(sys,x0,t)
    title("Respuesta a entrada cero")
    ylabel("Salidas")
    grid on
 
%Respuesta forzada
figure(2)
    step(sys,t)
    title("Respuesta a estado cero")
    xlabel("Tiempo")
    grid on
    
%Respuesta completa del sistema
figure(3)
    y=lsim(sys,u,t);
    subplot(3,1,1)
    plot(t, y(:,1), "green", "Linewidth",2)
    title("Respuesta completa del sistema (G(t))")
    xlabel("Tiempo")
    ylabel("G(t)")
    grid on
    
    subplot(3,1,2)
    plot(t, y(:,2), "magenta", "Linewidth",2)
    title("Respuesta completa del sistema (X(t))")
    xlabel("Tiempo")
    ylabel("X(t)")
    grid on
    
    subplot(3,1,3)
    plot(t, y(:,3), "cyan", "Linewidth",2)
    title("Respuesta completa del sistema (Y(t))")
    xlabel("Tiempo")
    ylabel("Y(t)")
    grid on
    
%Respuesta al impulso del sistema
figure(4)
    impulse(sys,t)
    title("Respuesta al impulso")
grid on

%Mapa de polor y ceros del sistema
figure(5)
    iopzmap(G)
    title("Mapas de polos y ceros")
    grid on
    
%Información desplegada en la command Window
disp("######################################")
disp("#Funciones de transferencia          #")
disp("######################################")
G

disp("######################################")
disp("#Polos:                              #")
disp("######################################")
pole(G)

disp("######################################")
disp("#Ganancia:                           #")
disp("######################################")
dcgain(G)