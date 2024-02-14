% rgb to gray
% @author: Armando Salazar
% @date: 12-02-24

clear; clc; close all;
% 2^7 2^6 2^5 2^4 2^3 2^2 2^1 2^0
% 128 64 32 16 8 4 2 1 = 255

I = imread("lenna.png");

figure(1);
% original image
subplot(1, 3, 1);
imshow(I);
title('Imagen original');
% gray image
IGray = rgb2gray(I);
subplot(1, 3, 2);
imshow(IGray);
title('Imagen en escala de grises');
% gray with maths
clear IGray;
%[m, n] = size(I);
IRed = I(:,:,1);
IGreen = I(:,:,2);
IBlue = I(:,:,3);

IGray = .299 * double(IRed) + .587 * double(IGreen) + .144 * double(IBlue);
IGray = uint8(IGray);
%for i=1:m
%    for j=1:n
%    end
%end
subplot(1, 3, 3)
imshow(IGray);
title('Imagen en escala de grises con formula')



