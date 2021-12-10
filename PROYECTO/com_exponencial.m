%DESCIPCI�N:
%En este archivo se compara la respuesta del modelo line-
%alizado contra la respuesta sistema real descrito por el
%conjunto de ecuacuaciones diferenciales. Se simula una
%entrada exponencial decreciente.
%________________________________________________________

clear; close; clc;
mve     %Matrices MVE

t=0:1e-3:300; %tiempo de muestreo

%ENTRADAS
%----------------------------------------------------------------------
h=exp(-t)+h0; %Entrada exponencial en t=0
i=exp(-t)+i0; %Entrada exponencial en t=0
%----------------------------------------------------------------------

%SISTEMA REAL - ECUACIONES DIFERENCIALES
%----------------------------------------------------------------------
tRange=[0 300];
y0=[G0; X0; Y0];  %Condiciones iniciales 
[tout, y]=ode45(@difEqSet, tRange, y0);

%APROCIMACI�N - SISTEMA LINEALIZADO
%----------------------------------------------------------------------
%Matrices de la versi�n linealizada del modelo:
G=ss(A, B, C, D); %Descripci�n del sistema!

du=[h-h0; i-i0]; 
dy=lsim(G,du,t);


%SALIDAS EXACTAS Y SU APROXIMACI�N
figure(1)

    subplot(3,1,1)
    
    p=plot(tout, y(:,1),": cyan", t, dy(:,1), "blue");
    legend("G(t)", "G(t) -  lin")
    ylabel("G(t)")
    p(1).LineWidth=3;
    p(2).LineWidth=2;
    grid on
    title("Comparacion del modelo original con el linealizado ante una entrada exponencial")
    subplot(3,1,2)
    p=plot(tout, y(:,2),": cyan", t, dy(:,2), "blue");
    legend("X(t)", "X(t) -  lin")
    ylabel("X(t)")
    p(1).LineWidth=3;
    p(2).LineWidth=2;
    grid on
    
    subplot(3,1,3)
    p=plot(tout, y(:,3),": cyan",  t, dy(:,3), "blue");
    legend("Y(t)", "Y(t) -  lin")
    ylabel("Y(t)")
    xlabel("Tiempo (segundos)")
    p(1).LineWidth=3;
    p(2).LineWidth=2;
    grid on
    
%Modelo exacto con ode45()
function dxdt=difEqSet(t, x)
    param
    %Entradas del sistema:
    h=exp(-t)+h0; %entrada exponencial en t=0
    i=exp(-t)+i0; %entrada exponencial en t=0
    
    %Variables de estado:
    G=x(1);
    X=x(2);
    Y=x(3);
    
    %Derivadas
    dGdt=-p1*G-G*X-GB*X+h;
    dXdt=-p2*X+p3*Y;
    dYdt=-p4*(Y+YB)+(i/VL);
    
    dxdt=[dGdt; dXdt; dYdt];
end