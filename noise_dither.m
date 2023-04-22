function dithered_image = noise_dither(image)
    % Noise dithering function
    % Inputs:
    %   image: original image

    %get file name and set output file name
    [pathstr,name,ext] = fileparts(image);
    bit2_name = append(name, '_noise_2bit', ext);
    bit4_name = append(name, '_noise_4bit', ext);
    %read image
    im = imread(image);

end