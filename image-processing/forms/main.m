clear; clc; close all;

% Leer la imagen
I = imread("mario.jpeg");

% Convertir la imagen a escala de grises
IGray = RgbToGray(I);

% Binarizar la imagen
threshold = 128;
IBinary = Binarize(IGray, threshold);

% Definir el elemento estructurante
H = [1 1 1; 1 1 1; 1 1 1];  % elemento estructurante cuadrado de 3x3

% Pedir el número de iteraciones
prompt = 'Enter the number of iterations: ';
n = input(prompt);

% Aplicar la dilatación y erosión múltiples veces
IDilation = IBinary;
IErosion = IBinary;
for i = 1:n
    IDilation = Dilate(IDilation, H);
    IErosion = Erode(IErosion, H);
end

% Mostrar los resultados
figure;
imshow(IBinary);
title("Imagen binary");
figure;
imshow(IErosion);
title(strcat('Erosion Image with', ' ', int2str(n), ' iterations'));
figure;
imshow(IDilation);
title(strcat('Dilation Image with', ' ', int2str(n), ' iterations'));

function I = RgbToGray(I)
	I = I(:,:,1) ./ 3 + I(:,:,2) ./ 3 + I(:,:,3) ./ 3;
end

function I = Binarize(I, threshold)
	I(I < threshold) = 0;
	I(I >= threshold) = 255;
end

% Funciones personalizadas de erosión y dilatación
function IErosion = Erode(I, H)
    [rows, cols] = size(I);
    [hRows, hCols] = size(H);
    padSize = floor(hRows / 2);
    IPadded = padarray(I, [padSize padSize], 1);  % Pad with ones (assuming foreground is 1)

    IErosion = false(size(I));
    for i = 1:rows
        for j = 1:cols
            region = IPadded(i:i+hRows-1, j:j+hCols-1);
            if isequal(region & H, H)
                IErosion(i, j) = true;
            end
        end
    end
end

function IDilation = Dilate(I, H)
    [rows, cols] = size(I);
    [hRows, hCols] = size(H);
    padSize = floor(hRows / 2);
    IPadded = padarray(I, [padSize padSize], 0);  % Pad with zeros (assuming background is 0)

    IDilation = false(size(I));
    for i = 1:rows
        for j = 1:cols
            region = IPadded(i:i+hRows-1, j:j+hCols-1);
            if any(region & H, 'all')
                IDilation(i, j) = true;
            end
        end
    end
end
