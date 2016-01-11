function [E1,E2,E3]  = Mean(im)
% Function to calculate mean.
% Toy code - Developed by Siddharth Ravi, Kes Cassee & Dave Verstrate. 


E1 = 0; E2 = 0; E3 = 0;
[m,n,p] = size(im);
for i=2:m
    for j=1:n
        E1 = im(i,j,1)+E1;
        E2 = im(i,j,2)+E2;
        E3 = im(i,j,3)+E3;       
    end
end
E1 = E1/(m*n);
E2 = E2/(m*n);
E3 = E3/(m*n);
end