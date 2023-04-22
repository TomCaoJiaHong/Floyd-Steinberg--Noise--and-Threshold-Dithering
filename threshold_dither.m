function dithered_image = threshold_dither(image)
    % Threshold dithering function
    % Inputs:
    %   image: original image

    %get file name and set output file name
    [pathstr,name,ext] = fileparts(image);
    bit2_name = append(name, '_threshold_2bit', ext);
    bit4_name = append(name, '_threshold_4bit', ext);
    %read image
    im = imread(image);
    %set bit depth to 2, then dither image
    levels =  2^2;
    dithered_image = double(im) > levels;
    imwrite(dithered_image, bit2_name);
    %set bit depth to 4, then dither image
    levels = 2^4;
    dithered_image = double(im) > levels;
    imwrite(dithered_image, bit4_name);
end
