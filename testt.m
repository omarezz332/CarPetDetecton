I=imread('rot.jpg');
figure,imshow(I);

img= rgb2gray(I);
img = im2bw(img);
figure,imshow(I);
cropped_image = rotat( img,18 );

gray_plat=imerode(cropped_image,ones(3,3));
gray_plat=imresize(gray_plat,[360,500]);
figure,imshow(gray_plat);
[L,num_ojects]=bwlabel(gray_plat);
Objects = regionprops(L,'Extent','BoundingBox');
     for i=1:num_ojects
         
         obj=Objects(i).Extent;
            obj
        
             object_X=Objects(i).BoundingBox(1);
             object_Y=Objects(i).BoundingBox(2);
             object_W=Objects(i).BoundingBox(3);
             object_H=Objects(i).BoundingBox(4);
            if obj >.7 && obj<1 &&object_W>10
                object_X
                object_W
            charct_img=imcrop(gray_plat,[object_X,object_Y,object_W-1,object_H-1]); 
            figure,imshow(charct_img);
         end
     end

         
 %[L,B]=bwlabel(numbers_img);

 C = Morpholog( charct_img );
 
 %[L,C]=bwlabel(charct_img);