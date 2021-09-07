function h = histogram(img)
    counts = zeros(1,255);
    for pixel = img
       counts(1,pixel) = counts(1,pixel) + 1;
    end
    histogram(h, 255);
end