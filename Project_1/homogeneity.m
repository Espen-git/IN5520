function idm = homogeneity(glcm)
    G = length(glcm);
    idm = 0;
    for i = 1:G
        for j = 1:G
            idm = idm + (glcm(i, j) / (1 + ((i-j)^2)));
        end
    end
end