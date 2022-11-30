#Task c and d

load("digit3.mat")
s_D = size(D,1);	% number of images
k = 1;			% index of the figures
m_x = 0:255;

Pixel = [297,155,203,210,217,399,410,595,605]; % 10 interesting pixel

for j = 1:10
	p = Pixel(j);		
	M = zeros(1,256);
	P = zeros(1,784);	
	P(p) = 255;		% changes the value at the given pixel p to 255

	for im_num= 1: s_D
	     I = D(im_num,:);
	     i=I(p)+1;
	     M(i)=M(i)+1;	% M(i) counts the number of images with value i-1 at pixel p
	end

	P = reshape(P, [28,28]); % converts P to size to 28 x 28
	P=imrotate(P,270);
	figure(k); imshow(fliplr(P),[]);

	figure(k+1);
	bar(m_x,M)
	t = strcat("gray value distribution of pixel number ", int2str(p));
	title(t);
	axis([-5, 260, 0, 400]);
	xlabel ('grey value');
	y = strcat("amount of pixels ", int2str(p) , " to have the greyvalue");
	ylabel(y);
k = k+2
end
