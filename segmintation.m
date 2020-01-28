function [ type ] = segmintation( I )
I=imresize(I,[460,500]); 
%figure,imshow(I);

    x=260;
    y=60;

    if I(y,x,1)>0 && I(y,x,1)<40 &&I(y,x,2)>70 && I(y,x,2)<140 && I(y,x,3)>120 && I(y,x,3)<250
        s='B';
    elseif I(y,x,1)>130 && I(y,x,1)<250 && I(y,x,2)>0 && I(y,x,2)<90 && I(y,x,3)>0 && I(y,x,3)<90
                 
         s='R';
    elseif I(y,x,1)>170 && I(y,x,1)<215 && I(y,x,2)>120 && I(y,x,2)<215 && I(y,x,3)>120 && I(y,x,3)<215
                 
         s='G';
    else 
        s='O';
     
        
    end
    
    if s=='B'
        type='Owners cars';
    elseif s=='R'
        type='Transport';
    elseif s=='G'
         type='Government cars';
    else
         type='Taxi';
        
    end

end

