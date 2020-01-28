cropped_image=imread('im4.jpg');

%d_img=imdilate(cropped_image,ones(10,10));
figure,imshow(cropped_image);
ss = imerode(cropped_image,ones(8,8));
[L,num_ojects]=bwlabel(~ ss);
figure,imshow(ss);
Objects = regionprops(L,'BoundingBox');
n=0;
     for i=1:num_ojects
             obj=Objects(i);
             object_X=obj.BoundingBox(1);
             object_Y=obj.BoundingBox(2);
             object_W=obj.BoundingBox(3);
             object_H=obj.BoundingBox(4);
          if object_W>20&&object_H>10
            charct_img=imcrop(cropped_image,[object_X,object_Y,object_W-1,object_H-1]); 
            n=n+1;
            figure,imshow(charct_img);
         end
     end