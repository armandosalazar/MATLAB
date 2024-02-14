clear, clc, close all;
img = imread('lenna.jpeg');

figure
subplot(1, 2, 1)
imshow(img)

img = rgb2gray(img);

edgeCanny = edge(img, 'canny');
edgePrewitt = edge(img, 'prewitt');
f = figure;
movegui(f, 'center')
imshowpair(edgeCanny, edgePrewitt, 'montage')

clear