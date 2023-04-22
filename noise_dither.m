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

    %dither image, then set bit depth to 2
    im_nd = im > rand(size(im));
    dithered_image = round(((2^2-1)*im_nd)/(2^2-1));

    imwrite(dithered_image, bit2_name);

    %dither image, then set bit depth to 4 
    im_nd = im > rand(size(im));
    dithered_image = round(((2^4-1)*im_nd)/(2^4-1));

    imwrite(dithered_image, bit4_name);
end