#Exercise 1
N=100;

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
  axis([-1, 10, min(a)-10, max(a)+10]);
  xlabel ('matrix element');
  ylabel('frequency in A');
  hold on;
  plot([-1, 10],line([-1,10],[a_mean,a_mean]))
  hold off;

figure(2);
bar (b_c,b)
  title('Graph B');
  axis([bmin-1, bmax+1, 0, max(b)+10]);
  xlabel ('matrix element');
  ylabel('frequency in B');


#(f) and (g) Probability distributions

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
  axis([-1, 10, 0, 0.2]);
  xlabel ('matrix element');
  ylabel('probability');


# For plotting the graph for (g)
values_x=[bmin:0.1:bmax];
values_y= (1/(200*pi)*exp(-(((values_x).^2 )/200)));


figure(4);
plot(b_c,p_b,"+")
  title('probability distributions for Graph B');
  axis([bmin-1, bmax+1, 0, 0.06]);
  xlabel ('matrix element');
  ylabel('probability');
  hold on;
  plot(values_x,values_y)
  hold off;
  
#Sum of the  probabilities in distribution a and b:
Sum_a=sum(p_a)
Sum_b=sum(p_b)


#(h)

sum_omega1= 0;
for i= -10 : 10
  sum_omega1=sum_omega1+ sum(sum(B==i));
endfor;
sum_omega1=(sum_omega1*100)/(N*N)

sum_omega2= 0;
for i= -20 : 20
  sum_omega2=sum_omega2+ sum(sum(B==i));
endfor;
sum_omega2=(sum_omega2*100)/(N*N)

sum_omega3= 0;
for i= -30 : 30
  sum_omega3=sum_omega3+ sum(sum(B==i));
endfor;
sum_omega3=(sum_omega3*100)/(N*N)







