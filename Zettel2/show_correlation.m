function show_correlation (dig, xb, yb)

  s = strcat("digit", int2str(dig), ".mat");
  load(s)

  I = D(1,:);
	I = reshape(I, [28,28]); % converts I to size to 28 x 28
	I = imrotate(I,270);
  I = fliplr(I);

  p = 28*(yb-1)+xb;
  P = zeros(1,784);
  P(p) = 255;

  C = zeros(28, 28);
  b = I(xb,yb);
  for i = 1:28
    for j = 1:28
      C(i,j) = corr(I(i,j),b);
    endfor
  endfor


  P = reshape(P, [28,28]); % converts P to size 28 x 28
	P=imrotate(P,270);
	figure(1); imshow(fliplr(P),[]);
  figure(2); imshow(C,[]);
