Input_Image = imread("Fig0304(a)(breast_digital_Xray).tif");
%imshow(Input_Image)

negative_Image_Breast = 255 - Input_Image

subplot(2,2,1), imshow(Input_Image), title("Original Image")
subplot(2,2,2), imshow((negative_Image_Breast)), title("Negative Transformation Image")


imwrite(negative_Image_Breast, 'transform_negative_image.png')

image_complement = imcomplement(Input_Image)

subplot(2,2,4), imshow(image_complement), title('Complement Image')
