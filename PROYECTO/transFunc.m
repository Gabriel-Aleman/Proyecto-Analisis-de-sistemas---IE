%DESCIPCIÓN:
%En este archivo se obtiene la función de transferencia 
%del sistema linealizado, así como sus polos, zeros  y
%ganancia.
%________________________________________________________
clear; close; clc;
mve
sys=ss(A,B,C,D);
G=tf(sys);

