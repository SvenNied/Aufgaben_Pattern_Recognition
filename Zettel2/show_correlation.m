C=[];
function show_correlation (dig, xb, yb)

  s = strcat("digit", int2str(dig), ".mat");
  load(s)

  b_value= 28*(yb-1)+xb;
  base= rotdim(D(:,b_value)); % extracting the grey values of each image for base pixel

  C=[];

  for i=1: 784
    pixel = rotdim(D(:,i)); % extracting the grey values of each image for pixel i
    c = corr(pixel,base);   % correlation between pixel i and base pixel
    c=(c+1)*255/2;          % converting correlation to grey value
    C=[C,c];                % building vector of grey values for correlation image
  end

  P = zeros(1,784);
  P(b_value)=255;


  P = reshape(P, [28,28]); % converts P to size 28 x 28
	P=imrotate(P,270);
	figure(1); imshow(fliplr(P),[]);
	
  C=reshape(C,	[28,28]); % converts C to size to 28 x 28
 	C = imrotate(C,270);
 	figure(2), imshow(fliplr(C),[]);

endfunction
