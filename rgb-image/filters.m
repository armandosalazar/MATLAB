clear, clc, close all;

% Filtros pasa baja (suavizado)
I = imread('lenna.jpeg');

figure
subplot(2, 3, 2)
imshow(I), title('Imagen original')

J = imnoise(I, 'salt & pepper', 0.02); % Añadir ruido a la imagen
subplot(2, 3, 1)
imshow(J), title('Imagen con ruido')

% Filtro 1
h = fspecial('average', 2);

clear;