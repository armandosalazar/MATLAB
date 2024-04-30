function I = sobel(I)
fprintf("XXX");
[m, n, ~] = size(I);
I = double(I);

gy = zeros(m, n);
gx = zeros(m, n);

for r=2:m-1
    for c=2:n-1
	gy(r, c) = I(r-1, c-1) + 2*I(r-1, c) + I(r-1, c+1) - I(r+1, c-1) - 2*I(r+1, c) - I(r+1, c+1);
	gx(r, c) = I(r-1, c-1) + 2*I(r, c-1) + I(r+1, c-1) - I(r-1, c+1) - 2*I(r, c+1) - I(r+1, c+1);
    end
end

I = sqrt(gx.^2 + gy.^2);
% I = uint8(I);

Vm = max(max(I));
IN = I/Vm * 255;
IN = uint8(IN);

B=IN>100;

VminGx = min(min(gx));
VmaxGx = max(max(gx));

Gradx = gx - VminGx;
Grady = gy - VminGx;

GxN = Gradx/VmaxGx * 255;
GyN = Grady/VmaxGx * 255;

GxN = uint8(GxN);
GyN = uint8(GyN);


subplot(2, 4, 1);
imshow(I);
title('Sobel');

subplot(2, 4, 2);
imshow(IN);
title('Sobel Normalized');

subplot(2, 4, 3);
imshow(GxN);
title('Gx Normalized');

subplot(2, 4, 4);
imshow(GyN);
title('Gy Normalized');

end

