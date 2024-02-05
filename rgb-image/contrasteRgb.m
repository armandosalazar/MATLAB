% @author: Armando Salazar
% @date: 04-02-24

clear, clc, close all;

img = imread("paisaje.jpg");

imgRed = img(:,:,1);
imgGreen = img(:,:,2);
imgBlue = img(:,:,3);

imgRedDouble = double(imgRed);
imgRedNormalized = imgRedDouble./max(imgRedDouble(:)); % Normalizar la imagen
% Procesamiento de la imagen
imgRedProcessed = imgRedNormalized./2; % al disminuir la saturacion de rojo desaparece, en este caso dividiendo entre dos.
figure(1), subplot(2, 3, 1), imshow(img), title('Imagen original');
figure(1), subplot(2, 3, 2), imshow(imgRedNormalized), title 'Imagen roja original';
figure(1), subplot(2, 3, 3), imshow(imgRedProcessed), title('Imagen contraste rojo');
% Desnormalizar la imagen
imgRed = imgRedProcessed.*max(imgRedDouble);
% Reset a 8 bits
imgRed = uint8(imgRed);
imgNew = cat(3, imgRed, imgGreen, imgBlue);
figure(1), subplot(2, 3, 5), imshow(imgNew), title('Nueva imagen con contraste saturado');