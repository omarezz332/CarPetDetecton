function cropped_image = rotat( I,angle )
j=imrotate(I,-angle);
figure,imshow(j);
cropped_image=imcrop(j,[33,60,190,90]);
figure,imshow(cropped_image);
end

