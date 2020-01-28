function [ A  , C,numbers,gov ] = plats_detect( I )
IG= rgb2gray(I);
IBW = im2bw(IG,200/250);
%figure,imshow(~IBW);

dil=imdilate(~IBW,ones(6,16));
%figure,imshow(dil);
fil=imfill(dil,'holes');
%figure,imshow(fil);
[L,n]=bwlabel(fil);
     Objects = regionprops(L,'BoundingBox','Orientation');
     for i=1:n
         
         obj=Objects(i);
         object_X=obj.BoundingBox(1);
         object_Y=obj.BoundingBox(2);
         object_W=obj.BoundingBox(3);
         object_H=obj.BoundingBox(4);
         
         cropped_image=imcrop(I,[object_X,object_Y,object_W-1,object_H-1]);
         angle=obj.Orientation;
         if angle> 8 || angle <-10
             if n>1
             cropped_image=imresize(cropped_image,1.6);
             end
             cropped_image = rotat( cropped_image,angle );
             
             %figure,imshow(cropped_image);
         end
         
         %figure,imshow(cropped_image);
         [A  , C,numbers,gov] = detector(cropped_image);
         imwrite(cropped_image,['F:\4rd\Image Processing\project\result\im' num2str(i) '.jpg']);
         str=[A '  ' num2str(C) ' ' gov ];
          figure,imshow(cropped_image),title( str );
     end


end

