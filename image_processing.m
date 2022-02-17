%% No 1
img_paths = ["img/baboon.tif", "img/aerial.tif", "img/strawberries.tif", "img/caster_stand.tif"];
for i = 1:length(img_paths)
    I = imread(img_paths(i));
    [~,~,channel] = size(I);
    figure,
    subplot(2,channel+1,1), imshow(I);
    subplot(2,channel+1,channel+2), imshow(I);

    for j = 1:channel
        [counts, binloc] = chist(I(:,:,j));
        subplot(2,channel+1,1+j), bar(binloc, counts);
        subplot(2,channel+1,channel+2+j), imhist(I(:,:,j));
    end

end

%% No 2
figure,
img_path = "img/Picture2.png";

img = imread(img_path);
subplot(2, 2, 1);
imshow(img);
subplot(2, 2, 2);
imhist(img);

img_contrast = contrast_stretching(img_path);
subplot(2, 2, 3);
imshow(img_contrast);
subplot(2, 2, 4);
imhist(img_contrast);

%% No 3
img_paths = ["img/Picture2.png", "img/aerial.tif", "img/bridge.tif", "img/office.tif"];
for i = 1:length(img_paths)
    I = imread(img_paths(i));
    J = chisteq(I);
    K = histeq(I);

    [~,~,channel] = size(I);
    figure,
    subplot(3,channel+1,1), imshow(I);
    subplot(3,channel+1,channel+2), imshow(J);
    subplot(3,channel+1,channel*2+3), imshow(K);

    for j = 1:channel
        [counts, binloc] = chist(I(:,:,j));
        subplot(3,channel+1,1+j), bar(binloc, counts);
        [counts, binloc] = chist(J(:,:,j));
        subplot(3,channel+1,channel+2+j), bar(binloc, counts);
        [counts, binloc] = chist(K(:,:,j));
        subplot(3,channel+1,channel*2+3+j), bar(binloc, counts);
    end
end
%% No 4

%% Functions
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

function img = contrast_stretching(img_path)
    img = imread(img_path);
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
    img = imagesc(img);
end

function img = chisteq(image)
    img = image;
    heq = zeros(256);
    [row, col, channel] = size(img);

    for k = 1:channel
        h = chist(image(:,:,k));
        n = sum(h);
        for i = 1:256
            heq(i) = floor(sum(h(1:i)) / n * 255);
        end

        for i = 1:row
            for j = 1:col
                img(i,j,k) = heq(img(i,j,k) + 1);
            end
        end
    end
end
