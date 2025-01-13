power_image = imread('Fig0309(a)(washed_out_aerial_image).tif');
r = double(power_image)/255;
c = 1;
gamma = 5;
s = c*(r).^gamma;
subplot(1,2,1), imshow(uint8(power_image)), title('Original Image');
subplot(1,2,2), imshow(s), title("Power Law Transformed Image")
