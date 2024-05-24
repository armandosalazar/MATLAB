clear; clc; close all;

I = imread(cat(2, pwd, '/input/you.jpeg'));

IGray = I(:, :, 1) / 3 + I(:, :, 2) / 3 + I(:, :, 3) / 3;

ISobel = sobel(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(ISobel);
title('Sobel Image');

IPrewitt = prewitt(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(IPrewitt);
title('Prewitt Image');

IRoberts = roberts(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(IRoberts);
title('Roberts Image');

ICanny = canny(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(ICanny);
title('Canny Image');

function I = sobel(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = -1 * I(r-1, c-1) - 2 * I(r-1, c) - I(r-1, c+1)...
				+ I(r+1, c-1) + 2 * I(r+1, c) + I(r+1, c+1);
			gy(r, c) = -1 * I(r-1, c-1) + I(r-1, c+1)...
				- 2 * I(r, c-1) + 2 * I(r, c+1)...
				- I(r+1, c-1) + I(r+1, c+1);
		end
	end
	% I = sqrt(gx.^2 + gy.^2);
	% I = uint8(I);
	gt = sqrt(gx.^2 + gy.^2);
	vMaxGt = max(max(gt));
	gtNormalized = (gt / vMaxGt) * 255;
	I = uint8(gtNormalized);
	B = I > 100;

	vMinGx = min(min(gx));
	vMinGy = min(min(gy));

	gradOffX = gx - vMinGx;
	gradOffY = gy - vMinGy;

	vMaxGx = max(max(gradOffX));
	vMaxGy = max(max(gradOffY));

	gxNormalized = (gradOffX / vMaxGx) * 255;
	gyNormalized = (gradOffY / vMaxGy) * 255;
end

function I = prewitt(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = -1 * I(r-1, c-1) - I(r-1, c) - I(r-1, c+1)...
				+ I(r+1, c-1) + I(r+1, c) + I(r+1, c+1);
			gy(r, c) = -1 * I(r-1, c-1) + I(r-1, c+1)...
				- I(r, c-1) + I(r, c+1)...
				- I(r+1, c-1) + I(r+1, c+1);
		end
	end
	I = sqrt(gx.^2 + gy.^2);
	I = uint8(I);
end

function I = roberts(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = I(r, c) - I(r+1, c+1);
			gy(r, c) = I(r+1, c) - I(r, c+1);
		end
	end
	I = sqrt(gx.^2 + gy.^2);
	I = uint8(I);
end

function I = canny(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = -1 * I(r-1, c-1) - 2 * I(r-1, c) - I(r-1, c+1)...
				+ I(r+1, c-1) + 2 * I(r+1, c) + I(r+1, c+1);
			gy(r, c) = -1 * I(r-1, c-1) + I(r-1, c+1)...
				- 2 * I(r, c-1) + 2 * I(r, c+1)...
				- I(r+1, c-1) + I(r+1, c+1);
		end
	end
	I = sqrt(gx.^2 + gy.^2);
	I = uint8(I);
end
