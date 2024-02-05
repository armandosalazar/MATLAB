clear, clc, close all;
img = imread("Lenna.png");

imgGray = rgb2gray(img); % Convertimos a escala de grises

figure(1), subplot(2, 3, 1), imshow(img), title("Imagen original");
figure(1), subplot(2, 3, 2), imshow(imgGray), title("Imagen en grises");

imgBin = imbinarize(imgGray, 0.5); % Convertimos a binario
figure(1), subplot(2, 3, 3), imshow(imgBin), title('Imagen binarizada');
% Aprender sobre ROI
ROI = img(244:283,244:352,:);
figure(1), subplot(2, 3, 5), imshow(ROI), title('Segmentación ojos');