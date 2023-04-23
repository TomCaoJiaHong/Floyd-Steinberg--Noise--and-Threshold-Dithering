function dithered_image = floyd_steinberg_dither(image)
    % Floyd-Steinberg dithering function
    % Inputs:
    %   image: original image

    %get file name and set output file name
    [pathstr,name,ext] = fileparts(image);
    bit2_name = append(name, '_floyd_2bit', ext);
    bit4_name = append(name, '_floyd_4bit', ext);
    %read image
    im = imread(image);
    
    

    
    
end
