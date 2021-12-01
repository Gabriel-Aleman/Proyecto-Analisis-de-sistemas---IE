%DESCIPCIÓN:
%En este archivo se lleva a cabo el analisis en el domi-
%nio de la frecuencia.
%________________________________________________________
clear;close;clc;
transFunc

%Bode  G(t)
figure(1)
bode(G(1,:),"Green")
title("Digrama de Bode 'G(t)' ")

%Bode  X(t)
figure(2)
bode(G(2,2),"Magenta")
title("Digrama de Bode 'X(t)' ")

%Bode  Y(t)
figure(3)
bode(G(3,2),"Cyan")
title("Digrama de Bode 'Y(t)' ")