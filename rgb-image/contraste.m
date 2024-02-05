% @author: Armando Salazar
% @date: 04-02-24

clear, clc, close all;

% 8 bits = 1px
imgOriginal = imread("paisaje.jpg");
imgGreen = imgOriginal(:,:,2);
% imgGray = rgb2gray(imgOriginal);

% Before
% 16 bit = 1px
imgDouble = double(imgGreen); % Convet to double::for more precision
imgNormalized = imgDouble ./ max(imgDouble(:)); % Normalized
% La normalización de imágenes puede implicar diferentes técnicas, como escalar los valores de píxeles para que estén en un rango específico (por ejemplo, [0, 1] o [-1, 1]), restar la media y dividir por la desviación estándar, o aplicar transformaciones para que los datos sigan una distribución específica (como una distribución normal estándar). La elección de la técnica de normalización depende del contexto específico y del tipo de algoritmo que se esté utilizando.
fprintf('Max::%d\n', max(imgDouble(:)))
fprintf('Div::%f\n', (227/253))

imgProcessed = imgNormalized.*2;
% imgProcessed = imgProcessed./2;
% After
imgGreen = imgNormalized.*max(imgDouble(:)); % Denormalized
imgGreen = uint8(imgGreen); % Return to 8 bits image::original

figure(1), subplot(1,2,1), imshow(imgGreen), title("Imagen original");
figure(1), subplot(1,2,2), imshow(imgProcessed), title("Imagen procesada");
