

fig = 1;
X = [];
Maxlies = [];
Logli = [];
#Different means and standdev
for mean = 1:10
  for standdev = 1:10
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
    #vector with 100 settings around maxlies
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
    plot (x - 50,vec(x));
    hold on;
    plot (x - 50, maxlies);
    xlabel ("x");
    ylabel ("training data likelihoods");
    title (x - 50);

    fig = fig + 1;
    #Put the new values into the matrix X, Maxlies and Logli
    X = vertcat(X,x)
    Maxlies = vertcat(Maxlies,maxlies)
    Logli = vertcat(Logli,logli)
  endfor
endfor




