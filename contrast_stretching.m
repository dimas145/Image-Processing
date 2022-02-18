function img = contrast_stretching(image)
    img = image;
    rmin = double(min(img(:)));
    rmax = double(max(img(:)));
    L = 255;

    [x, y, z] = size(img);
    for k = 1:z
        for i = 1:x
            for j = 1:y
                r = double(img(i, j, k));
                s = L * ((r - rmin) / (rmax - rmin));
                img(i, j, k) = s;
            end
        end
    end
end