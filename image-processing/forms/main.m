clear; clc; close all;

I = imread("forms/mario.jpeg");

IGray = funcRgbToGray(I);
IBinary = funcBinarize(IGray, 128);
H = [1 1 1; 1 1 1; 1 1 1];

prompt = 'Enter the number of iterations: ';
n = input(prompt);

IDilation = funcDilationMultiple(IBinary, H, n);
IErotion = funcErotionMultiple(IBinary, H, n);

figure;
imshow(IErotion);
title(strcat('Erotion Image with ', int2str(n), ' iterations'));
figure;
imshow(IDilation);
title(strcat('Dilation Image with ', int2str(n), ' iterations'));

function I = funcRgbToGray(I)
	I = I(:,:,1) ./ 3 + I(:,:,2) ./ 3 + I(:,:,3) ./ 3;
end

function I = funcBinarize(I, threshold)
	I(I < threshold) = 0;
	I(I >= threshold) = 255;
end

function I = funcErotion(I, H)
  [rows, cols] = size(I);
  IErotion = zeros(rows, cols);

  for i=2:rows-1
	for j=2:cols-1
	  if sum(sum(I(i-1:i+1, j-1:j+1) & H)) == sum(H(:))
		IErotion(i, j) = 1;
	  else
		IErotion(i, j) = 0;
	  end
	end
  end
end

function IDilation = funcDilation(I, H)
  [rows, cols] = size(I);
  IDilation = zeros(rows, cols);

  for i = 2:rows-1
	for j = 2:cols-1
	  if sum(sum(I(i-1:i+1, j-1:j+1) & H)) > 0
		IDilation(i, j) = 1;
	  else
		IDilation(i, j) = 0;
	  end
	end
  end
end

function IErotion = funcErotionMultiple(I, H, n)
	IErotion = I;
	for i = 1:n
	IErotion = funcErotion(IErotion, H);
	end
end

function IDilation = funcDilationMultiple(I, H, n)
	IDilation = I;
	for i = 1:n
	IDilation = funcDilation(IDilation, H);
	end
end
