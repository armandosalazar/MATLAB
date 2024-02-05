% RGB image
% @author: Armando Salazar
% @date: 04-02-24

clear; clc; close all;
% 2^7 2^6 2^5 2^4 2^3 2^2 2^1 2^0
% 128 64 32 16 8 4 2 1 = 255

img = imread("RBG.png"); % 660x960x3 uint8 = 0-255
figure(1), subplot(2,3,2)
imshow(img), title('Imagen original');

imgr = img(:,:,1); % red
imgg = img(:,:,2); % green
imgb = img(:,:,3); % blue
figure(1), subplot(2,3,4), imshow(imgr), title('Plano Rojo');
figure(1), subplot(2,3,5), imshow(imgg), title('Plano Verde');
figure(1), subplot(2,3,6), imshow(imgb), title('Plano Azul');