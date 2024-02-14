% RGB image
% @author: Armando Salazar
% @date: 04-02-24

clear; clc; close all;
% 2^7 2^6 2^5 2^4 2^3 2^2 2^1 2^0
% 128 64 32 16 8 4 2 1 = 255

I = imread("rgb.png"); % 660x960x3 uint8 = 0-255
figure(1), subplot(2,3,2)
imshow(I), title('Imagen original');

IRed    = I(:,:,1); % red
IGreen  = I(:,:,2); % green
IBlue   = I(:,:,3); % blue

figure(1), subplot(2,3,4), imshow(IRed), title('Plano Rojo');
figure(1), subplot(2,3,5), imshow(IGreen), title('Plano Verde');
figure(1), subplot(2,3,6), imshow(IBlue), title('Plano Azul');

ISize = size(I);
fprintf('m=%d,n=%d,p=%d\n', ISize);
fprintf('m=%d,n=%d\n', size(IRed));

% write image
% imwrite(IRed, 'r.png')
a = 4;
ISub = I(1:a:end,1:a:end,1:1:end);
figure(2);
imshow(ISub);
