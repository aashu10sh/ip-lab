
moonImage = imread("Fig0338(a)(blurry_moon).tif");

subplot(2,2,1), imshow(moonImage), title("Original Moon Image")

moonDouble = im2double(moonImage);


thold = 0.5; % Adjust this value between 0 and 1 to get best results

binaryMoon = moonDouble > thold;

level = graythresh(moonImage);

binaryMoon_otsu = imbinarize(moonImage, level);


subplot(2,2,2), imshow(binaryMoon), title("Manual Threshold")
subplot(2,2,3), imshow(binaryMoon_otsu), title("Otsu Threshold")

subplot(2,2,4), imhist(moonImage), title("Image Histogram")
xlabel("Intensity"), ylabel("Pixel Count")
