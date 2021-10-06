function inr = inertia(glcm)
    G = length(glcm);
    inr = 0;
    for i = 1:G
        for j = 1:G
            inr = inr + (glcm(i, j) * ((i-j)^2));
        end
    end
end