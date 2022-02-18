function [counts, binLocations] = chist(image)
    binLocations = 0:255;
    [row, col] = size(image);
    counts = zeros(256,1,"double");
    for i = 1:row
        for j = 1:col
            value = uint16(image(i,j)) + 1;
            counts(value) = counts(value) + 1;
        end
    end
end