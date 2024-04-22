% filters
% @author: Armando Salazar
% @date: 09-04-24

clear; clc; close all;

% I = imread("input/lenna.png");
I = imread("mona.jpeg");

IGray = I(:,:,1) / 3 + I(:,:,2) / 3 + I(:,:,3) / 3;

% smoothing
IS = smoothing(IGray);
IB = box(IGray);
IG = gaussian(IGray);
IL = laplace(IGray);

figure(1);
subplot(1,2,1);
imshow(IGray);
title("Original Image");
subplot(1,2,2);
imshow(IS);
title("Smoothed Image");

imwrite(IGray, "output/original.png");
imwrite(IS, "output/smoothed.png");
imwrite(IB, "output/box.png");
imwrite(IG, "output/gaussian.png");
imwrite(IL, "output/laplace.png");
