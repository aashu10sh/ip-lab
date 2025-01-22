% Read the input image
A = imread('Fig0338(a)(blurry_moon).tif');
% Convert to double for better precision
A = im2double(A);

% Display original image
subplot(2,2,1), imshow(A), title('Original Image');

% Define Laplacian kernels
laplacian_4 = [0 1 0; 1 -4 1; 0 1 0];  % 4-connected neighborhood
laplacian_8 = [1 1 1; 1 -8 1; 1 1 1];  % 8-connected neighborhood

% Apply Laplacian filters
edge_4 = abs(imfilter(A, laplacian_4, 'replicate'));
edge_8 = abs(imfilter(A, laplacian_8, 'replicate'));

% Apply Gaussian smoothing before Laplacian (LoG - Laplacian of Gaussian)
gaussian = fspecial('gaussian', [5 5], 1);
smoothed = imfilter(A, gaussian, 'replicate');
edge_log = abs(imfilter(smoothed, laplacian_8, 'replicate'));

% Display results
subplot(2,2,2), imshow(edge_4, []), title('4-connected Laplacian');
subplot(2,2,3), imshow(edge_8, []), title('8-connected Laplacian');
subplot(2,2,4), imshow(edge_log, []), title('Laplacian of Gaussian (LoG)');

% Adjust figure properties for better visibility
set(gcf, 'Position', [100 100 800 600]);

