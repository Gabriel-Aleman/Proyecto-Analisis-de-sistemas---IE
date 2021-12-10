%DESCIPCIÃ“N:
%En este archivo se lleva a cabo el analisis en el domi-
%nio de la frecuencia.
%________________________________________________________
clear;close;clc;
transFunc

%Bode  G(t) debido a h
figure(1)
b11 = bodeplot(G(1,1),"Green");
opb11 = getoptions(b11);
opb11.Title.String = 'Diagrama de Bode de G(t) debido a h(t)';
opb11.Ylabel.String = {'Magnitud', 'Fase'};
opb11.Xlabel.String = 'Frecuencia';
opb11.PhaseWrapping = 'on';
setoptions(b11, opb11);
grid on;

%Bode  G(t) debido a i
figure(2)
b12 = bodeplot(G(1,2),"Green");
opb12 = getoptions(b12);
opb12.Title.String = 'Diagrama de Bode de G(t) debido a i(t)';
opb12.Ylabel.String = {'Magnitud', 'Fase'};
opb12.Xlabel.String = 'Frecuencia';
opb12.PhaseWrapping = 'on';
opb12.PhaseWrappingBranch = -450;
setoptions(b12, opb12);
grid on;

%Bode  X(t)
figure(3)
b2 = bodeplot(G(2,2),"Magenta");
opb2 = getoptions(b2);
opb2.Title.String = 'Diagrama de Bode de X(t) debido a i(t)';
opb2.Ylabel.String = {'Magnitud', 'Fase'};
opb2.Xlabel.String = 'Frecuencia';
opb2.PhaseWrapping = 'on';
setoptions(b2, opb2);
grid on;

%Bode  Y(t)
figure(4);
b3 = bodeplot(G(3,2), "Cyan");
opb3 = getoptions(b3);
opb3.Title.String = 'Diagrama de Bode de Y(t) debido a i(t)';
opb3.Ylabel.String = {'Magnitud', 'Fase'};
opb3.Xlabel.String = 'Frecuencia';
opb3.PhaseWrapping = 'on';
setoptions(b3, opb3);
grid on;