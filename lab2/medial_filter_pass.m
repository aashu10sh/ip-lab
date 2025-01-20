A = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');

subplot(2,2,1), imshow(A), title('Input Image with impulse noise (salt and pepper)');

J1 = medfilt2(A);

B = imboxfilt(A,11);

subplot(2,2,2), imshow(B), title('Average Filter Output');

subplot(2,2,3), imshow(J1), title('Default Median Filter');

J2 = medfilt2(A, [7,7]);

subplot(2,2,4), imshow(J2), title('Median by specified kernel size');

