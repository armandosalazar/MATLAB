% rgb to gray
% @author: Armando Salazar
% @data: 13-02-24

clear; clc; close all;

I = imread('lenna.png');

subplot(1, 3, 1);
imshow(I);
title('Original');

IFirst = I;
[m, n, p] = size(I);
for i=1:m
    for j=1:n
        gray = I(i, j) * .299 + I(i, j) * .587 + I(i, j) * .144;
        IFirst(i, j, 1) = gray;
        IFirst(i, j, 2) = gray;
        IFirst(i, j, 3) = gray;
    end
end

subplot(1, 3, 2);
imshow(IFirst);
title('Grises ponderación');

imwrite(IFirst, "ponderacion.png")

ISecond = I(:,:,1) / 3 + I(:,:,2) / 3 + I(:,:,2) / 3;

subplot(1, 3, 3)
imshow(ISecond);
title('Greses promedio');

imwrite(ISecond, "promedio.png")
