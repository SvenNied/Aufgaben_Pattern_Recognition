#Exercise 1
#Defining A
A = 10 * rand(100,100);
for i= 1 : 100
  for j= 1 : 100
    A(i,j) = fix(A(i,j));
  end
 end
A;
#Defining B, if X standard nornal distributed then kX has variance k^2 if k is constant
B = 10 * randn(100,100);
for i= 1 : 100
  for j= 1 : 100
    B(i,j) = round(B(i,j));
  end
 end
B;

#Finding min and max
amin = min(A(1));
for j= 2 : 100
    if(amin > min(A(j)))
        amin = min(A(j));
    endif
end

amax =  max(A(1));
for j= 2 : 100
    if(amin < max(A(j)))
        amin = max(A(j));
    endif
end

bmin = min(B(1));
for j= 2 : 100
    if(amin > min(B(j)))
        amin = min(B(j));
    endif
end

bmax = max(B(1));
for j= 2 : 100
    if(amax > max(B(j)))
        amax = max(B(j));
    endif
end

#Determining frequency of elements
#The list for A
#Create matrix new where every value is 1 where the searched value is to find.
#Then use the function find to find all ones and take the length of that vector
for i = 1 : 10
    newA = A == i-1;
    a(i) = length(find(newA));
endfor
a;

#The list for B. Its the same principle as above
b = [0 0 0 0];
for i = 1 : 100
    newB = B == -50 + i;
    b(i) = length(find(newB));
endfor
b:

#Plotting the distributions
#For A

#For B



