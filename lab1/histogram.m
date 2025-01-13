A = imread('Fig0316(2)(2nd_from_top).tif');
subplot(2,2,1), imshow(A), title("Input Image");

subplot(2,2,2), imhist(A,100), title('Input Image Histogram');
hist_eq = histeq(A);

subplot(2,2,3), imshow(hist_eq); title("Output Image");
subplot(2,2,4), imhist(hist_eq, 100), title('Output Image Histogram');

