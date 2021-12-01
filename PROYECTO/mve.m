%DESCIPCIÓN:
%En este archivo se encuentran las matrices del modelo de
%de variables de estado (MVE) de la aproximación para el
%modelo.
%________________________________________________________
clear; close; clc;
param
A=[-p1, -GB,   0;
    0,  -p2,  p3;
    0,    0, -p4];

B=[1,     0;
   0,     0;
   0, 1/VL];

C=[1, 0, 0;
   0, 1, 0;
   0, 0, 1];

D=[0, 0;
   0, 0;
   0, 0];