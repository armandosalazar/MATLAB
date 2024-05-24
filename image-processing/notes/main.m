I = imread('../input/mona.jpeg');

IGray = I(:,:,1) ./ 3 + I(:,:,2) ./ 3 + I(:,:,3) ./ 3;
ISmoothed = smoothed(I);
IBox = box(I);

figure;
subplot(1, 2, 1);
imshow(I);
subplot(1, 2, 2);
imshow(IBox);

function I = smoothed(I)
[m, n, ~] = size(I); % m = height, n = width
I = double(I);
for x=2:n-1
    for y=2:m-1
        I(x, y) = 1/9*...
            (I(x-1, y-1) + I(x, y-1) + I(x+1, y-1)...
            + I(x-1, y) + I(x, y) + I(x+1, y)...
            + I(x-1, y+1) + I(x, y+1) + I(x+1, y+1));
    end
end
I = uint8(I);
end

function I = box(I)
[m, n, ~] = size(I);
I = double(I);
H = [0,0,0,0,0;
    0,1,1,1,0;
    0,1,1,1,0;
    0,1,1,1,0;
    0,0,0,0,0];
sizeKernel = size(H);
for x = 2:m-1
    for y = 2:n-1
        sum = 0;
        for i = -floor(sizeKernel(1)/2):floor(sizeKernel(1)/2)
            for j = -floor(sizeKernel(2)/2):floor(sizeKernel(2)/2)
                xO = min(max(x + i, 1), m);
                yO = min(max(y + j, 1), n);
                sum = sum + double(I(xO, yO));
            end
        end
        I(x, y) = sum / (sizeKernel(1) * sizeKernel(2));
    end
end

I = uint8(I);
end
