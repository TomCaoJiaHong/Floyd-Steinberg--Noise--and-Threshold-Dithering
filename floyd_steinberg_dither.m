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
    
    %dither image
    [height, width] = size(im);
    im_fs = zeros(height+1, width+2);
    im_fs(1:height, 2:width+1) = im;
    for k=1:height
        for l=2:width+1
            rounded = round(im_fs(k, l), -2);
            error = im_fs(k, l)-rounded;
            im_fs(k, l) = rounded;
            im_fs(k, l+1) = im_fs(k, l+1) + error*7/16;
            im_fs(k+1, l-1) = im_fs(k+1, l-1) + error*3/16;
            im_fs(k+1, l) = im_fs(k+1, l) + error*5/16;
            im_fs(k+1, l+1) = im_fs(k+1, l+1) + error/16;
        end
    end

    im_fs = im_fs(1:height, 2:width+1);

    %imshow(im_fs);

    %reduce bit depth to 4
    dithered_image = round(((2^4-1)*im_fs)/(2^4-1));
    %store the image
    imwrite(dithered_image, bit4_name);
    
    %reduce bit depth to 2
    dithered_image = round(((2^2-1)*im_fs)/(2^2-1));
    %store the image
    imwrite(dithered_image, bit2_name);
    
end
