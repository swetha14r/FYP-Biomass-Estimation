% Enhancing low light images using Dehazing Algorithm
% Step 1: Invert the low-light image.
% 
% Step 2: Apply the haze removal algorithm to the inverted low-light image.
% 
% Step 3: Invert the enhanced image

% Import an RGB image captured in low light.

A = imread('frame_003425.PNG');
imshow(A);

% Invert the image and notice how the low-light areas in the original image appear hazy.

AInv = imcomplement(A);
imshow(AInv);

% Reduce the haze using the imreducehaze function.

BInv = imreducehaze(AInv);
imshow(BInv);

% Invert the results to obtain the enhanced image.

B = imcomplement(BInv);