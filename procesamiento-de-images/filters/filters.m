% filters
% @author: Armando Salazar
% @date: 09-04-24

clear; clc; close all;

% I = imread("input/lenna.png");
I = imread("input/mona.jpeg");

IGray = I(:,:,1) / 3 + I(:,:,2) / 3 + I(:,:,3) / 3;

% smoothing
% IS = smoothing(IGray);
% IS = box(IGray);
% IS = gaussian(IGray);
% IS = laplace(IGray);

figure(1);
subplot(1,2,1);
imshow(IGray);
title("Original Image");
subplot(1,2,2);
imshow(IS);
title("Smoothed Image");
