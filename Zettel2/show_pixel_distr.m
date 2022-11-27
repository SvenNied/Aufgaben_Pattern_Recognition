#Task c and d

load("digit3.mat")
s_D= size(D,1);
k=1;
m_x=0:255;

# Interesting Pixel
Pixel=[297,155]; 

#Edit to j=1:10 once list Pixel is completed
for j=1:2
p=Pixel(j);
M=zeros(1,256);
P= zeros(1,784);
P(p)=255;

for im_num= 1: s_D
		 I	= D(im_num,:);
     i=I(p)+1;
     M(i)=M(i)+1;

end


P	=	reshape(P,	[28,28]); %	converts I	to	size to	28	x	28
P=imrotate(P,270);
figure(k); imshow(fliplr(P),[]);


figure(k+1);
bar(m_x,M)
title('gray value distribution of pixel number 297');
axis([-5, 260, 0, 400]);
xlabel ('grey value');
ylabel('amount of pixels 297 to have the greyvalue');
k=k+2

end
