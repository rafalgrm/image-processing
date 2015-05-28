%% Przyklad 3.1
RGB=reshape(ones(64,1)*reshape(jet(64),1,192),[64,64,3]);
R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);
imshow(R)
figure, imshow(G)
figure, imshow(B)
figure, imshow(RGB)
%% Przyklad 4.1
A = imread('ngc6543a.jpg');
image(A);
A(300, 300, 1)
A(300, 300, 2)
A(300, 300, 3)
%% Przyklad 5.1
[X,map] = imread('corn.tif');
if ~isempty(map)
    Im = ind2rgb(X,map);
end
whos Im;
%% Przyklad 6
load clown
whos
imwrite(X,map,'clown.bmp')
imwrite(X,map, 'clown.jpg')
X/100
imwrite(X/100, 'clown3.jpg')
%% Przyklad 7
imfinfo('clown.bmp')
%% Przyklad 8
moon = imread('moon.tif');
imshow(moon);
figure, imshow(moon, 'Border', 'tight');
%% Przyklad 9
[X1,map1]=imread('forest.tif');
[X2,map2]=imread('trees.tif');
subplot(1,2,1), subimage(X1,map1)
subplot(1,2,2), subimage(X2,map2)

%% potem zadanie
[X1,map1]=imread('forest.tif');
[X2,map2]=imread('trees.tif');
subplot(1,2,1), imshow(X1,map1)
subplot(1,2,2), imshow(X2,map2)
%% Przyklad 10
imtool(moon)
%% przyklad 11
I = imread('circuit.tif');
imshow(I)
J = imresize(I,1.25);
figure, imshow(J)
J = imresize(I,[10 15]);
figure, imshow(J)
%% przyklad 12
I = imread('rice.png');
J = imresize(I, 0.5, 'Antialiasing', false);
figure, imshow(I), figure, imshow(J)
J = imresize(I, 0.5);
figure, imshow(J)

%% przyklad 13
J = imrotate(I,35,'bilinear');
imshow(I)
figure, imshow(J)
%% przyklad 14
I = imread('circuit.tif');
J = imcrop(I,[60 40 100 90]);
%imcrop(I)
imshow(I), figure, imshow(J)
%% przyklad 15
cb = checkerboard;
tform = affine2d([1 0 0; 0 1 0; 20 20 1]);
Rcb = imref2d(size(cb))
Rout = Rcb;
Rout.XWorldLimits(2) = Rout.XWorldLimits(2)+20;
Rout.YWorldLimits(2) = Rout.YWorldLimits(2)+20;

[out,Rout] = imwarp(cb,tform,'OutputView',Rout);

figure, subplot(1,2,1);
imshow(cb,Rcb);
subplot(1,2,2);
imshow(out,Rout)
%% przyklad  16
fixed = imread('westconcordorthophoto.png');
moving = imread('westconcordaerial.png');
iptsetpref('ImshowAxesVisible','on')
imshow(moving)
%% przyklad 17
fixed = imread('westconcordorthophoto.png');
moving = imread('westconcordaerial.png');
load westconcordpoints
tform = fitgeotrans(movingPoints, fixedPoints, 
			'projective');
registered = imwarp(moving, tform,
			'FillValues', 255);
figure, imshow(registered);
Rfixed = imref2d(size(fixed));
registered1 = imwarp(moving,tform,
			'FillValues', 255,
			'OutputView',Rfixed);
				
figure, imshowpair(fixed,registered1,'blend');
%% przyklad 18
I = dicomread('CT-MONO2-16-ankle.dcm');
imtool(I,'DisplayRange',[])
%% przyklad 19
I = imread('pout.tif');
imshow(I);
imtool(I);
imtool(J);
J = imadjust(I);
figure, imshow(J);
%% przyklad 20
[X,map] = imread('forest.tif');
I = ind2gray(X,map);
J = imadjust(I,[],[],0.5);
K = imadjust(I,[],[],2);
imshow(I)
%figure, imshow(J)
%figure, imshow(K)
imtool(J)
imtool(K)
%% przyklad 21
I = imread('pout.tif');
J = histeq(I);
imshow(I)
figure, imshow(J)
figure, imhist(J,64)
%% przyklad 21
originalRGB = imread('peppers.png');
imshow(originalRGB)
h = fspecial('motion', 50, 45);
filteredRGB = imfilter(originalRGB, h);
figure, imshow(filteredRGB)
boundaryReplicateRGB = imfilter(originalRGB, h, 'replicate');
figure, imshow(boundaryReplicateRGB)
%% przyklad 22
I = imread('moon.tif');
h = fspecial('unsharp')
I2 = imfilter(I,h);
imshow(I)
title('Original Image')
figure
imshow(I2)
title('Filtered Image')


