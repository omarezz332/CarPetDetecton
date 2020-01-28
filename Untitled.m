I=imread('Noised image.JPG');
img= rgb2gray(I);
img = im2bw(img,170/250);

img=imresize(img,[460,500]);
for y=150:500
    img(y,253)=0;
end

[L,num_ojects]=bwlabel(img);
Objects = regionprops(L,'Extent','BoundingBox');
p=0;
numbers=0;
charct=0;

     for i=1:num_ojects
             obj=Objects(i).Extent;
             object_X=Objects(i).BoundingBox(1);
             object_Y=Objects(i).BoundingBox(2);
             object_W=Objects(i).BoundingBox(3);
             object_H=Objects(i).BoundingBox(4);
          if obj >.7 && obj<1 &&object_W>30&&object_W<300&&object_H>200
            cimg=imcrop(img,[object_X,object_Y,object_W-1,object_H-1]);
              
             figure,imshow(img);
             if object_X>1&&object_X<100&&object_W>100
                 ss = imerode(cimg,ones(5,5));
                 numbers = Morpholog( ss );

             else
                 ss = imerode(cimg,ones(15,8));

                 charct= Morpholog( ss );
                 
                 
             end
             
             p=p+1;
             
            imwrite(cimg,['F:\4rd\Image Processing\project\result\im' num2str(i) '.jpg']);
           
         end
     end
     C= numbers+charct;
      if C==6
          if numbers==3
              gov='Cairo';
          else
              gov='Giza';
              
          end
      else
          gov='Alex';
      end
          
