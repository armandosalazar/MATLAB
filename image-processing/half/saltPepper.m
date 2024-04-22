function I = saltPepper(I)
    [rows, cols] = size(I);
    I = double(I);
    for i = 1:rows
        for j = 1:cols
            if rand() < 0.05
                I(i, j) = 0;
            elseif rand() < 0.05
                I(i, j) = 255;
            end
        end
    end

    I = uint8(I);
end