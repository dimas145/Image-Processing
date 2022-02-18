function img = hist_specification(image_input, image_ref)
    img = image_input;
    img_ref = image_ref;
    [~, heq] = chisteq(img);
    [~, heq_ref] = chisteq(img_ref);
    [row, col, channel] = size(img);

    for k = 1:channel
        closest = zeros(256,1,1);
        for i = 1:length(heq)
            closest_diff = 999;
            for j = 1:length(heq_ref)
                diff = abs(heq(i, k) - heq_ref(j, k));
                if (diff < closest_diff)
                    closest(i) = j;
                    closest_diff = diff;
                end
            end
        end

        for i = 1:row
            for j = 1:col
                img(i, j, k) = closest(img(i, j, k) + 1);
            end
        end
    end
end