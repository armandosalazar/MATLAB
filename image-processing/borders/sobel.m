function I = sobel(I)
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
I = uint8(I);
end

