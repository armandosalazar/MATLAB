function I = half(I)
    [m, n, ~] = size(I); % m = height, n = width
    I = double(I);
    fprintf("height: %d\n", m);
    fprintf("width: %d\n", n);
    arrHalf = zeros(9);

    for x = 2:m-1
        for y = 2:n-1
            arrHalf(1) = I(x-1, y-1);
            arrHalf(2) = I(x-1, y);
            arrHalf(3) = I(x-1, y+1);
            arrHalf(4) = I(x, y-1);
            arrHalf(5) = I(x, y);
            arrHalf(6) = I(x, y+1);
            arrHalf(7) = I(x+1, y-1);
            arrHalf(8) = I(x+1, y);
            arrHalf(9) = I(x+1, y+1);

            arrHalf = sort(arrHalf);

            I(x, y) = arrHalf(5);
        end
    end

    I = uint8(I);
end