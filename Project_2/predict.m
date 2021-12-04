function prediction = predict(x, cov, mean, numVar)
    exponent = ((x - mean')') * inv(cov) * (x - mean');
    prediction = ((1 / (sqrt((2*pi)^numVar * abs(det(cov))))) * exp(-0.5 * exponent));
end