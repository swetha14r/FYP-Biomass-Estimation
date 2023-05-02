% Invert the image
AInv = imcomplement(im);

% Reduce the haze using the imreducehaze function.
BInv = imreducehaze(AInv,'ContrastEnhancement','none');

% Invert the results
BImp = imcomplement(BInv);

% Use the imguidedfilter function to remove noise from the enhanced image.
B = imguidedfilter(BImp);