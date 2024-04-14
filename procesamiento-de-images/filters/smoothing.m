function I = smoothing(I)
[m, n, ~] = size(I);
I = double(I);
for r=2:m-1
    for c=2:n-1
        I(r, c) = 1/9*...
            (I(r-1, c-1) + I(r-1, c) + I(r-1, c+1)...
            + I(r, c-1) + I(r, c) + I(r, c+1)...
            + I(r+1, c-1) + I(r+1, c) + I(r+1, c+1));
    end
end
I = uint8(I);
end