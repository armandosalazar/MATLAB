function I = average(I)
    [m, n, ~] = size(I);
    I = double(I);
    fprintf("height: %d\n", m);
    fprintf("width: %d\n", n);
    arrAverage = zeros(17);
    % 
    for x = 2:m-1
        for y = 2:n-1
            % 1
            arrAverage(1) = I(x-1, y-1);
            % 3
            arrAverage(2) = I(x-1, y);
            arrAverage(3) = I(x-1, y);
            arrAverage(4) = I(x-1, y);
            % 2
            arrAverage(5) = I(x-1, y+1);
            arrAverage(6) = I(x-1, y+1);
            % 2
            arrAverage(7) = I(x, y-1);
            arrAverage(8) = I(x, y-1);
            % 4
            arrAverage(9) = I(x, y);
            arrAverage(10) = I(x, y);
            arrAverage(11) = I(x, y);
            arrAverage(12) = I(x, y);
            % 1
            arrAverage(13) = I(x, y+1);
            % 1
            arrAverage(13) = I(x, y+1);
            % 2
            arrAverage(14) = I(x+1, y-1);
            arrAverage(15) = I(x+1, y-1);
            % 1
            arrAverage(16) = I(x+1, y);

            arrAverage = sort(arrAverage);

            I(x, y) = arrAverage(9);
        end
    end
    I = uint8(I);
end