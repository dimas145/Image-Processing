function [img, heq] = chisteq(image)
    img = image;
    [row, col, channel] = size(img);
    heq = zeros(256, 1, channel);

    for k = 1:channel
        h = chist(image(:,:,k));
        n = sum(h);

        cfreq = 0;
        for i = 1:256
            cfreq = cfreq + h(i);
            cdf = cfreq / n;
            heq(i, k) = cdf * 255;
        end

        for i = 1:row
            for j = 1:col
                img(i,j,k) = round(heq(img(i,j,k) + 1, k));
            end
        end
    end
end