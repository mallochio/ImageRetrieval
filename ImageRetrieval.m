% Place the following piece of code in a folder where all the image files
% are located. Pick an image number as query image. The code would return
% the two closest matches based on the minimal euclidean distance of the
% feature vectors.
% Toy code - Developed by Siddharth Ravi, Kes Cassee & Dave Verstrate. All
% rights reserved.

clear; clc; close all;

imagefiles = dir('*.jpg');   %Read all image files, change formats if required
nfiles = length(imagefiles);    % Number of files found
for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   images{i} = currentimage;


im = rgb2hsv(images{i});

% Moment 1- mean
[E1,E2,E3] = Mean(im);

% Moment 2- standard deviation
[sig1,sig2,sig3] = sigma(im,E1,E2,E3);

% Moment 3- skewness
[s1,s2,s3] = skewness(im,E1,E2,E3);

FV(i,:) = [E1 E2 E3 sig1 sig2 sig3 s1 s2 s3];
end

[rows,cols] = size(FV);

num = 78; %Type an image number in directory to compare with
for i = 1:rows
    if i ~= num
        for j = 1:cols
            temp(j) = (FV(num,j)-FV(i,j))^2;
        end
        dist(i) = sqrt(sum(temp));
    else
        dist(i) = 100;
    end
    

end
[mindist,index] = min(dist); % Best image match
[mindist2,index2] = min(setdiff(dist(:),min(dist(:)),'stable'));%Secondbest


    
%%
figure(1)
imshow(images{num})%User image
title('Query image')

figure(2)
imshow(images{index}) %Best match
title('Best match image')

figure(3)
imshow(images{index2}); %Second best match
title('Second best match')

