function [I] = laplace(I)
sigma = 1.5;
kernelSize = 2 * ceil(2 * sigma) + 1;
kernel = zeros(kernelSize, kernelSize);
center = floor(kernelSize / 2) + 1;
for i = 1:kernelSize
    for j = 1:kernelSize
        x = i - center;
        y = j - center;
        kernel(i, j) = (1 / (sqrt(2 * pi) * sigma^3)) * (1 - ((x^2 + y^2) / (sigma^2))) * exp(-(x^2 + y^2) / (2 * sigma^2));
    end
end
kernel = kernel / sum(kernel(:));
[m, n, ~] = size(I);
I = double(I);
for x = 1:m
    for y = 1:n
        ssum = 0;
        for i = 1:kernelSize
            for j = 1:kernelSize
                xO = min(max(x + i - center, 1), m);
                yO = min(max(y + j - center, 1), n);
                ssum = ssum + double(I(xO, yO)) * kernel(i, j);
            end
        end
        I(x, y) = ssum;
    end
end
I = uint8(I);
end
