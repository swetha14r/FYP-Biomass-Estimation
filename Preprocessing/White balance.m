%% Image input
% We take a RGB image as input and convert it to grayscale and store it in another variable, so we can get the mean luminance.

rgbImage=imread(im);
rgbImage=im2double(rgbImage);
grayImage = rgb2gray(rgbImage); 

%% White Balancing
% Extract the individual red, green, and blue color channels.
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

meanR = mean2(redChannel);
meanG = mean2(greenChannel);
meanB = mean2(blueChannel);
meanGray = mean2(grayImage);

% Make all channels have the same mean
redChannel = (double(redChannel) * meanGray / meanR);
greenChannel = (double(greenChannel) * meanGray / meanG);
blueChannel = (double(blueChannel) * meanGray / meanB);

%redChannel and blueChannel Correction
redChannel=redChannel-0.3*(meanG-meanR).*greenChannel.*(1-redChannel);
blueChannel=blueChannel+0.3*(meanG-meanB).*greenChannel.*(1-blueChannel);


% Recombine separate color channels into a single, true color RGB image.
rgbImage_white_balance = cat(3, redChannel, greenChannel, blueChannel);


%% Gamma Correction and sharpening
I = imadjust(rgbImage_white_balance,[],[],0.5);

J=(rgbImage_white_balance+(rgbImage_white_balance-imgaussfilt(rgbImage_white_balance)));

%% Image Fusion using wavelet transform

XFUS = wfusimg(I,J,'sym4',3,'max','max');

B=histeq(XFUS);