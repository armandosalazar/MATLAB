% filters
% @author: Armando Salazar
% @date: 09-04-24

clear; clc; close all;

I = imread("mona.jpeg");

% IGray = I(:,:,1) / 3 + I(:,:,2) / 3 + I(:,:,3) / 3;

ISaltPepper = saltPepper(I);


IHalf = half(I);

figure(1);
subplot(1,3,1);
imshow(I);
title("Original Image");
subplot(1,3,2);
imshow(ISaltPepper);
title("Salt and Pepper Image");
subplot(1,3,3);
imshow(IHalf);
title("Half Image");


IAverage = average(I);
figure(2);
subplot(1,3,1);
imshow(I);
title("Original Image");
subplot(1,3,2);
imshow(ISaltPepper);
title("Salt and Pepper Image");
subplot(1,3,3);
imshow(IAverage);
title("Average Image");

imwrite(ISaltPepper, "saltPepper.jpeg");
imwrite(IHalf, "half.jpeg");
imwrite(IAverage, "average.jpeg");