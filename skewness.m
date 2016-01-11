function [s1,s2,s3] = skewness(im,E1,E2,E3)
% Function to calculate skewness.
% Toy code - Developed by Siddharth Ravi, Kes Cassee & Dave Verstrate. 

s1=0; s2=0; s3=0;
[m,n,p] = size(im);
for i=1:m
    for j=1:n
        s1 = s1 + (abs(im(i,j,1)-E1))^3;
        s2 = s2 + (abs(im(i,j,2)-E2))^3;
        s3 = s3 + (abs(im(i,j,3)-E3))^3;
    end
end
s1 = (s1/(m*n))^(1/3);
s2 = (s2/(m*n))^(1/3);
s3 = (s3/(m*n))^(1/3);
end