function n = Morpholog( cropped_image )
 
d_img=imdilate(cropped_image,ones(4,4));
%figure,imshow(d_img);


[L,num_ojects]=bwlabel(~ d_img);

Objects = regionprops(L,'BoundingBox');
n=0;
     for i=1:num_ojects
             obj=Objects(i);
             object_X=obj.BoundingBox(1);
             object_Y=obj.BoundingBox(2);
             object_W=obj.BoundingBox(3);
             object_H=obj.BoundingBox(4);
          if object_W>12&&object_H>10&&object_Y>5&&object_Y<160&&object_X>5
            charct_img=imcrop(cropped_image,[object_X,object_Y,object_W-1,object_H-1]); 
            n=n+1;
           %figure,imshow(charct_img);
         end
     end

end

