function cooc_matrix = glcm(window, ngraylevels, dx=1, dy=1)
    cooc_matrix = zeros(ngraylevels, ngraylevels);
    [m,n] = size(window);
    
    for i = 1:(n-dx)
        for j = 1:(m-dy)
            a = window(i,j);
            
            cooc_matrix();
        end
    end
    
end


