% @autor: Armando Salazar
% @date: 07-11-23

clc, clear, close all
p1=[1;2];
p2=[-1;2];
p3=[0;-1];
p4=[1;-1.5];

P=[p1 p2 p3 p4];

w=rand(1,2);
b=rand(1);

T = [1 0 0 1];

plotpv(P, T); % Para usar esto se necesita el Deep Learning Toolbox