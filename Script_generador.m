clc
clear all
s = tf('s');
tf_pos = 0.28455/(s*(s+11.48))                        % tf de prueba para la posicion
tf_ang = (-0.3736*(s+2.412)/(s^2 + 0.01693*s + 35.39))% tf de prueba para el angulo


%conversion a espacio de estados:
ss_pos = ss(tf_pos);
ss_ang = ss(tf_ang);

%conversion a espacio de estados observable( matriz c con salidas en 1);
[SS_Po,XXX1] = compreal(ss_pos,"o")
[SS_An,XXX] = compreal(ss_ang,"o")

% las matrices se llama como SS_Po.A, para la matriz A del sistema
% observable de la posicion.

%sistema mimo ingresado a pata observando los valores de las matrices de
%cada sistema en espacio de estados

disp('Matrices del sistema de posicion:')
disp('A pos');SS_Po.A % matriz A
disp('B pos');SS_Po.B % matriz B
disp('C pos');SS_Po.C % matriz C

disp('Matrices del sistema del angulo:')
disp('A ang');SS_An.A % matriz A
disp('B ang');SS_An.B % matriz B
disp('C ang');SS_An.C % matriz C

%sistema simo, agregado a pie viendo los valores de las matrices de
%ambas tf
Planta = ss([0 0 1 0;0 0 0 1;0 0 -11.48 0;0 -35.39 0 -0.01639],[0;-0.3736;0.2846;-0.8948],[1 0 0 0;0 1 0 0],0)

% comparacion
zpk(Planta)%devuelve las tf del sistema
zpk(tf_pos)% tf de la posicion
zpk(tf_ang)% tf del angulo 



