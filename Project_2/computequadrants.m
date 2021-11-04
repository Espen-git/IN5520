function [Q1, Q2, Q3, Q4] = computequadrants(glcm)
    q1 = sum(glcm(1:8,1:8),'all');
    q2 = sum(glcm(1:8,9:16),'all');
    q3 = sum(glcm(9:16,1:8),'all');
    q4 = sum(glcm(9:16,9:16),'all');
    total_sum = q1 + q2 + q3 + q4;
    Q1 = q1/total_sum;
    Q2 = q2/total_sum;
    Q3 = q3/total_sum;
    Q4 = q4/total_sum;
end