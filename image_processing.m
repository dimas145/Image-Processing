%% No 1

%% No 2
figure,
a = 30;
b = 200;
img_path = "img/Picture2.png";

img = imread(img_path);
subplot(2, 2, 1);
imshow(img);
subplot(2, 2, 2);
imhist(img);

img_contrast = contrast_stretching(img_path, a, b);
subplot(2, 2, 3);
imshow(img_contrast);
subplot(2, 2, 4);
imhist(img_contrast);

%% No 3

%% No 4

%% Functions
function img = contrast_stretching(img_path, w1, w2)
    img = imread(img_path);
    rmin = min(img(:)); % TODO
    rmax = max(img(:));
    L = 255;
    a = w1 / rmin;
    b = (w2 - w1)/(rmax - rmin);
    g = (L - w2)/(L - rmax);

    [x, y, z] = size(img);
    for k = 1:z
        for i = 1:x
            for j = 1:y
                if img(i,j,k) <= rmin
                    r = img(i,j,k);
                    img(i,j,k) = (a * r);
                elseif img(i,j,k) > rmin && img(i,j,k) <= rmax
                    r = img(i,j,k);
                    img(i,j,k) = (b * (r - rmin)) + w1;
                else
                    r = img(i,j,k);
                    img(i,j,k) = (g * (r - rmax)) + w2;
                end
            end
        end
    end
end
