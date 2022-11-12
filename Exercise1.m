#Exercise 1
N=4;

#(a)Defining A and B
#We use fix() for A to obtain an integer because we want to stay in the interval (0,10]
#so witth 0 as possible value, but not 10 as possible value.
A = fix(10 * rand(N,N));
#We use round() for B to obtain an integer in order to keep it a normal distribution
B = round(10*randn(N,N));
A
B

#(b)Defining min and max for A and B
amin=min(min(A));
amax=max(max(A));
bmin=min(min(B));
bmax=max(max(B));

amin,amax,bmin,bmax

#(c)Determining the frequency of each matrix element
a=[];
for i=0 : 9
  a_help=sum(sum(A==i));
    a=[a,a_help];
endfor;

b=[];
for i=bmin : bmax
  b_help=sum(sum(B==i));
  b=[b,b_help];
endfor;



#(d) and (e)Plotting the histograms
a_mean= mean(a);
a_c= 0:9;
b_c=bmin:bmax;

figure(1);
bar(a_c,a)
  title('Graph A');
  axis([-1, 10, 0, max(a)+1]);
  xlabel ('matrix element');
  ylabel('frequency in A');
  hold on;
  plot([-1, 10],line([-1,10],[a_mean,a_mean]))
  hold off;

figure(2);
bar (b_c,b)
  title('Graph B');
  axis([bmin-1, bmax+1, 0, max(b)+1]);
  xlabel ('matrix element');
  ylabel('frequency in B');


#(f)Probability distributions

p_a=[];
for i=1 : length(a)
  a_help=a(i)/(N*N);
  p_a=[p_a,a_help];
endfor;

p_b=[];
for i=1 : length(b)
  b_help=b(i)/(N*N);
  p_b=[p_b,b_help];
endfor;


figure(3);
plot(a_c,p_a,"+")
  title('probability distributions for Graph A');
  axis([-1, 10, 0, 1]);
  xlabel ('matrix element');
  ylabel('probability');

Sum_a=sum(p_a)

figure(4);
plot(b_c,p_b,"+")
  title('probability distributions for Graph B');
  axis([bmin-1, bmax+1, 0, 1]);
  xlabel ('matrix element');
  ylabel('probability');

Sum_b=sum(p_b)



