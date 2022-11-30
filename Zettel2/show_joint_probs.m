function show_joint_probs(min, max, digit)

  C = zeros(28,28);
  s = strcat("digit",int2str(digit),".mat");
	load(s)
  sized = 0;
  for i = 1:size(D,1)
	I = D(i,:);
	I = reshape(I, [28,28]); %converts I to	size to	28 x28
         I  = imrotate(I,270);
         I  = fliplr(I);
         sized = sized + 1;

         for k = 1:28
           for j = 1:28
             if(C(k,j) >= min && C(k,j) < max)
             C(k,j) = C(k,j) + 1;
             endif
           endfor
         endfor


end
maxp = 0;
minp = 1;
  for i = 1:28
    for j = 1:28
      x = C(i,j) \ sized;
      C(i,j) = x;
      maxp = max(x, maxp);
      minp = min(x, minp);
    endfor
  endfor

   for i = 1:28
    for j = 1:28
      C(i,j) = (C(i,j) -  minp) * 255 / (maxp - minp);
    endfor
  endfor

  figure(1); imshow(C,[]);
