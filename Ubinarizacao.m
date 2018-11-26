im = imread('quadrado.png');
im2 = rgb2gray(im);
im2 = im2bw(im2(:));
figure, imshow(im2);
x = uint8(-1*(double(im2)-255));
figure, imshow(x);