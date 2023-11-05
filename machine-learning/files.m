% @author: Armando Salazar
% @date: 03-11-23

clc %limpiar command window
clear %limpiar el workspace
%data = readtable("file.xlsx");
%puedes utilizar la función readtable para importar datos tabulares de una
%hoja de cálculo o un archivo de texto y almacenar el resultado como una
%tabla.
table=readtable("machine-learning/file.txt");
x=table.x; %obtener el contenido de la columna x.
disp(x);

plot(x, table.y)
axis equal %establece la relacion del aspecto