I=imread('rot.jpg');
IG= rgb2gray(I);
IBW = im2bw(IG);
figure,imshow(~IBW);

dil=imdilate(~IBW,ones(6,16));
figure,imshow(dil);
fil=imfill(dil,'holes');
figure,imshow(fil);
[L,n]=bwlabel(fil);

Ori = regionprops(L,'Orientation');
anglee=Ori.Orientation;