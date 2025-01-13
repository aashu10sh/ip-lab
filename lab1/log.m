a1 = imread("Fig0305(a)(DFT_no_log).tif");
a = double(a1)/255;
c = 15;
f = c*log(1 + (a));
subplot(1,2,1), imshow(a), title("Original Image");
subplot(1,2,2), imshow((f)), title("Log Transformation Image");
