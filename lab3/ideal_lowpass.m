img = imread('Fig0333(a)(test_pattern_blurring_orig).tif')
img_gray = im2gray(img);

img_fft= fftshift(fft2(img_gray));

[M,N] = size(img_gray);

D0 = 20;

[U,V] = meshgrid(1:N,1:M);

D = sqrt((U - N/2).^2 + (V - M/2).^2);
H = double(D <= D0);

img_lp_ideal = real(ifft2(ifftshift(H.*img_fft)));
img_lp_ideal = uint8(255 * mat2gray(img_lp_ideal));

figure;

subplot(1,2,1);
subplot(1,2,1);
imshow(img_gray);
title('Original Image');
subplot(1,2,2);
imshow(img_lp_ideal);
title('Ideal Low Pass Filtered');

sgtitle('Name: Aashutosh Pudasaini |> Roll Number 1123');
