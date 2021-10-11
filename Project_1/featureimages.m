function [IDM INR SHD] = featureimages(glcms, L)
    G = length(glcms(:,:,1));

    % Normalize glcms
    glcms_normalized = zeros(G, G);
    for i = 1:length(glcms)
        glcms_normalized(:,:,i) = glcms(:,:,i)./(sum(glcms(:,:,i), 'all'));
    end

    % Compute features
    IDM = zeros(L);
    INR = zeros(L);
    SHD = zeros(L);
    for i = 1:length(glcms)
        IDM(i) = homogeneity(glcms_normalized(:,:,i));
        INR(i) = inertia(glcms_normalized(:,:,i));
        SHD(i) = clustershade(glcms_normalized(:,:,i));
    end
end