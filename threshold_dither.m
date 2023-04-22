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
end
