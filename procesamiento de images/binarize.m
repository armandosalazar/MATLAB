% rgb to binarize
% @author: Armando Salazar
% @data: 13-02-24

clear; clc; close all;

I = imread('lenna.png');

subplot(1, 2, 1);
imshow(I);
title('Original');

[m, n, p] = size(I);
for i=1:m
    for j=1:n
        gray = I(i, j) * .299 + I(i, j) * .587 + I(i, j) * .144;
        I(i, j, 1) = gray;
        I(i, j, 2) = gray;
        I(i, j, 3) = gray;
    end
end

for i=1:m
    for j=1:n
        if I(i, j) <= 192
            I(i, j, 1) = 0;
            I(i, j, 2) = 0;
            I(i, j, 3) = 0;
        else
            I(i, j, 1) = 255;
            I(i, j, 2) = 255;
            I(i, j, 3) = 255;
        end
    end
end

subplot(1, 2, 2);
imshow(I);
title('Binarización');

imwrite(I, "binarize.png")
