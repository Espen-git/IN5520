function prediction = predict(x, cov, mean, numVar)
    exponent = ((x - mean')') * inv(cov) * (x - mean');
    prediction = ((1 / (sqrt((2*pi)^numVar * abs(det(cov))))) * exp(-0.5 * exponent));
    %prediction = ((-0.5 * exponent) - (numVar/2 * log(2*pi)) - (0.5 * log(det(cov))));
end