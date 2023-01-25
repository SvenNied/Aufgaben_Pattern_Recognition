axis ([-60 60 -10000 10000]);
fig = 1;
X = [];
Maxlies = [];
Logli = [];
#Different means and standdev
for mean = 1:8
  for standdev = 1:8
    #Get a 10x10 matrix with random numbers which are normally distributed
    #with mean and standard deviation (standdev)
    m = mean + standdev * randn(10)
    #Make one vector out of the 100 entrys of the matrix
    m = reshape(m,1,[])
    #No negative samples
    m = abs(m)
    #Maximum-likelihood estimate following the theory sheet
    maxlies = 100 * (1/sum(m))
    #Computing log-likelihood function
    logli = 100 * log(maxlies) - (maxlies * (sum(m)))
    #Vector with 100 settings around maxlies
    vec = []
    for dif = -49:50
      vec(end+1) = maxlies + dif
    endfor
    #Compute log-likelihood function on vec
    for i = 1:100
      vec(i) = 100 * log(vec(i)) - (vec(i) * (sum(m)))
    endfor
    #Show result
    figure(fig);
    x = 1:100;
    plot (maxlies - 50 + x,vec(x));
    hold on;
    #the line at the maximum-likelihood estimate
    plot([maxlies,maxlies],[-10000,10000]);
    xlabel ("lambda");
    ylabel ("training data likelihoods");
    tit = cstrcat("Plot for mean ",num2str(mean)," and standard deviation ", num2str(standdev));
    title (tit);
    hold off;

    fig = fig + 1;
    #Put the new values into the matrix X, Maxlies and Logli
    X = vertcat(X,x)
    Maxlies = vertcat(Maxlies,maxlies)
    Logli = vertcat(Logli,logli)
  endfor
endfor




