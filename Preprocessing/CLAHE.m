% Defining input and output folders
myFolder = '/Users/swetha/Downloads/images'
outfolder='/Users/swetha/Downloads/CLAHE_op';

%Check for input folder
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

%Path to images
filePattern = fullfile(myFolder, '*.PNG');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  I2=imageArray; 

  %Check if already in RGB color space
  if(size(I2,3) == 3)
        % Convert the input image from the RGB colorspace to the L*a*b* colorspace.
        LAB = rgb2lab(I2);

        %Scale values to the range expected by the adapthisteq function, [0 1].
        L = LAB(:,:,1)/100;

        %Perform CLAHE on the L channel. Scale the result to get back to the range used by the L*a*b* color space.
        L = adapthisteq(L,'NumTiles',[8 8],'ClipLimit',0.005);
        LAB(:,:,1) = L*100;

        %Convert the resulting image back into the RGB color space.
        J = lab2rgb(LAB);
        outFile = [outfolder,filesep,baseFileName] ;
        imwrite(J,outFile) 
  end  
end