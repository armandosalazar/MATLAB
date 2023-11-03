% @author: Armando Salazar
% @date: 03-11-23

%Esto es un comentario:)
a = 5; %La variable a se define como 5
fprintf('The var is %d\n', a); %imprime en pantalla y formatea

m = 5*5;
disp(m); %mostrar el valor de una variable por pantalla
clc %borrar la ventana de comandos
a = 10; %añadir ; para ocultar el output: con punto y coma se oculta la salida
clear a m %eliminar los elementos de el área de trabajo (workspace)
% disp(a); %esto da un error porque la variable ya fue eliminada del
% workspace

avgAa=(8+-2)/2;