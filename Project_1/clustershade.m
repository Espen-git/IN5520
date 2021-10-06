function shd = clustershade(glcm)
    G = length(glcm);
    mux = 0;
    muy = 0;
    for i = 1:G
        mux = mux + (i * sum(glcm(i, :)));
        muy = muy + (i * sum(glcm(:, i)));
    end
    shd = 0;
    for i = 1:G
        for j = 1:G
            shd = shd + (glcm(i, j) * ((i+j-mux-muy)^3));
        end
    end
end