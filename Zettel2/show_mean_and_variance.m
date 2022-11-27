load("digit2.mat")
# Task b, Calculating the mean

Sum= zeros(1,784);
s_D= size(D,1);
for im_num= 1: s_D
  for i=1:784
		 I	= D(im_num,:);
     Sum(i) = Sum(i) + I(i);

end
end

Avg=Sum/s_D;
I	=	reshape(Avg,	[28,28]); %	converts I	to	size to	28	x	28
I=imrotate(I,270);
figure(1), imshow(fliplr(I),[]);

# Calculating the variance

SumDev= zeros(1,784);
for im_num= 1: s_D
  for i=1:784
		 I	= D(im_num,:);
     SumDev(i) = SumDev(i)+((I(i)-Avg(i))^2);


end
end

Var=SumDev/s_D;

I	=	reshape(Var,	[28,28]); %	converts I	to	size to	28	x	28
I=imrotate(I,270);
figure(2), imshow(fliplr(I),[]);
