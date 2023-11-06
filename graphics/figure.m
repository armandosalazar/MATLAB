% @author: Armando Salazar
% @date: 05-11-23

clc, clear

t=-pi:pi/50:pi;
x = cos(3*t);
y = 2*cos(t).^2;
z = sin(2*t);
plot3(x, y, z);