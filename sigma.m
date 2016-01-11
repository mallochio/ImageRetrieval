function [sig1,sig2,sig3] = sigma(im,E1,E2,E3)
%Function to calculate standard deviation.
% Toy code - Developed by Siddharth Ravi, Kes Cassee & Dave Verstrate. 


sig1=0; sig2=0; sig3=0;
[m,n,p] = size(im);
for i=1:m
    for j=1:n
        sig1 = sig1 + ((im(i,j,1)-E1))^2;
        sig2 = sig2 + ((im(i,j,2)-E2))^2;
        sig3 = sig3 + ((im(i,j,3)-E3))^2;
    end
end
sig1 = sqrt(double(sig1/(m*n)));
sig2 = sqrt(double(sig2/(m*n)));
sig3 = sqrt(double(sig3/(m*n)));
end