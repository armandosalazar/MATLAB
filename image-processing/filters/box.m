function [I] = box(I)
[m, n, ~] = size(I);
I = double(I);
sizeKernel = [5, 5];
for x = 1:m
    for y = 1:n
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