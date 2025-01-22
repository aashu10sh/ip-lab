A = imread('Fig0338(a)(blurry_moon).tif');


A = im2double(A);

% Display original image
subplot(2,2,1), imshow(A), title('Original Image');

% Define Powell filters
powell_x = [-1 0 1; -2 0 2; -1 0 1];
powell_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Define Sobel filters
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Apply Powell filters
powell_edge_x = abs(imfilter(A, powell_x, 'replicate'));
powell_edge_y = abs(imfilter(A, powell_y, 'replicate'));
powell_magnitude = sqrt(powell_edge_x.^2 + powell_edge_y.^2);

% Apply Sobel filters
sobel_edge_x = abs(imfilter(A, sobel_x, 'replicate'));
sobel_edge_y = abs(imfilter(A, sobel_y, 'replicate'));
sobel_magnitude = sqrt(sobel_edge_x.^2 + sobel_edge_y.^2);

% Calculate Powell direction
powell_direction = atan2(powell_edge_y, powell_edge_x);

% Display results
subplot(2,2,2), imshow(powell_magnitude, []), title('Powell Edge Detection');
subplot(2,2,3), imshow(sobel_magnitude, []), title('Sobel Edge Detection');

% Combine Powell magnitude and direction for visualization
powell_combined = powell_magnitude;
powell_combined(powell_direction > 0) = powell_combined(powell_direction > 0) * 1.2;
subplot(2,2,4), imshow(powell_combined, []), title('Powell with Direction Enhancement');

% Adjust figure properties for better visibility
set(gcf, 'Position', [100 100 800 600]);

% Optional: Add colorbar to see intensity values
colorbar('Position', [0.93 0.1 0.02 0.8]);


