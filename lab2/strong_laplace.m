% Read the input image
A = imread('Fig0338(a)(blurry_moon).tif');

% Convert to the correct format
% Local Laplacian filter requires either RGB or grayscale scaled to [0,1]
if size(A,3) == 1  % If grayscale
    A = im2single(A);
else  % If RGB
    A = im2single(rgb2gray(A));
end

try
    % Display original image
    subplot(2,2,1), imshow(A), title('Original Image');

    % Apply local Laplacian filter with different parameters
    % Default parameters
    filtered1 = locallapfilt(A, 0.4, 0.5);  % Alpha=0.4, Sigma=0.5

    % Increased enhancement for edges
    filtered2 = locallapfilt(A, 0.4, 0.5, 'NumIntensityLevels', 8);

    % More aggressive enhancement
    filtered3 = locallapfilt(A, 0.2, 0.3, 'NumIntensityLevels', 4);

    % Display results
    subplot(2,2,2), imshow(filtered1), title('Default Local Laplacian');
    subplot(2,2,3), imshow(filtered2), title('Enhanced Edges');
    subplot(2,2,4), imshow(filtered3), title('Aggressive Enhancement');

    % Adjust figure properties for better visibility
    set(gcf, 'Position', [100 100 800 600]);

    % Display differences in a new figure
    figure;
    subplot(2,2,1), imshow(A), title('Original Image');
    subplot(2,2,2), imshow(abs(A - filtered1), []), title('Difference (Default)');
    subplot(2,2,3), imshow(abs(A - filtered2), []), title('Difference (Enhanced)');
    subplot(2,2,4), imshow(abs(A - filtered3), []), title('Difference (Aggressive)');
    set(gcf, 'Position', [100 100 800 600]);

catch ME
    fprintf('Error: %s\n', ME.message);
    fprintf('Try using a different MATLAB version or ensure Image Processing Toolbox is installed.\n');
end

