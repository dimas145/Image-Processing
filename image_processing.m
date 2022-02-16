%% No 1

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

%% No 4

%% Functions
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
end
