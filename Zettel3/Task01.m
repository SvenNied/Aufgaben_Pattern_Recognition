%Task 1

load ("iris_data.mat")
load ("iris_species.mat")

c_1 = meas(1:50,:);
c_2 = meas(51:100,:);
c_3 = meas(101:150,:);

iris = cat(3,c_1,c_2,c_3);

%Task 2

iris1	=	cell(51,	5,	3);	%	we	need	a	larger	array	for
                          %	saving	the	additional	labels

L_col = cell(1,5);          % cell array containing the labels for the columns
L_row = cell(50,1);         % cell array containing the labels for the rows

L_col(1,2) = "SepalLength";
L_col(1,3) = "SepalWidth";
L_col(1,4) = "PetalLength";
L_col(1,5) = "PetalWidth";

for i = 1:50
  L_row(i,1) = strcat("Obs", int2str(i));
end

L_col(1,1) = "Setosa";
c_1_L = num2cell(c_1);
c_1_L = cat (2,L_row, c_1_L);
c_1_L = cat (1,L_col, c_1_L);

L_col(1,1) = "Versicolor";
c_2_L = num2cell(c_2);
c_2_L = cat (2,L_row, c_2_L);
c_2_L = cat (1,L_col, c_2_L);

L_col(1,1) = "Virginica";
c_3_L = num2cell(c_3);
c_3_L = cat (2,L_row, c_3_L);
c_3_L = cat (1,L_col, c_3_L);

iris1 = cat(3, c_1_L, c_2_L, c_3_L);   %assambeling iris1


%Task 3

function printcell(arr)
dim_x = size(arr,1);
dim_y = size(arr,2);
dim_z = size(arr,3);

for k = 1:dim_z

  for j = 1:dim_x
  line = arr(j,:,k);

    for i = 1:dim_y
    printf(num2str(line{i})), printf("  ")
    end
    printf("\n")
  end
end



endfunction


%Task 4

setosa	=	reshape([iris1{2:51,	2:5,	1}],	50,	4);
versicolor=	reshape([iris1{2:51,	2:5,	2}],	50,	4);
virginica	=	reshape([iris1{2:51,	2:5,	3}],	50,	4);

%Task 5
Sum=zeros(1,4);
s_v= size(versicolor,1);

for i=1:s_v
  for j=1:4
		 Sum(j) = Sum(j) + versicolor(i,j);
end
end
Avg=Sum/s_v;

variance_sepallenght = var(versicolor(:,1));
variance_sepalwidth  = var(versicolor(:,2));
variance_petallenght = var(versicolor(:,3));
variance_petalwidth  = var(versicolor(:,4));

Var=[variance_sepallenght,variance_sepalwidth,variance_petallenght,variance_petalwidth];

%building the cell array "myarray" with labels:
L_col_new=L_col;
L_col_new(1,1)="Versicolor";
L_row_new=cell(2,1);
L_row_new(1,1)= "mean";
L_row_new(2,1)= "variance";

Avg_L=num2cell(Avg);
Var_L=num2cell(Var);

myarray= cat(1,Avg_L, Var_L);
myarray= cat(2,L_row_new, myarray);
myarray= cat (1,L_col_new, myarray);

printcell(myarray);

%Task 6
figure(1)
  plot(c_1(:,1),c_1(:,2),"bo", c_2(:,1),c_2(:,2),"r*")
  title('Sepal Length and vs Sepal Width');
  xlabel ('Sepal Length');
  ylabel('Sepal Width');
  legend("Setosa", "Versicolor");

figure(2)
  plot(c_1(:,1),c_1(:,2),"bo", c_3(:,1),c_3(:,2),"r*")
  title('Sepal Length vs Sepal Width');
  xlabel('Sepal Length');
  ylabel('Sepal Width');
  legend("Setosa", "Virginica");

figure(3)
  plot(c_1(:,1),c_1(:,3),"bo", c_2(:,1),c_2(:,3),"r*")
  title('Sepal Length vs Petal Length');
  xlabel ('Sepal Length');
  ylabel('Petal Length');
  legend("Setosa", "Versicolor");

figure(4)
  plot(c_1(:,3),c_1(:,4),"bo", c_2(:,3),c_2(:,4),"r*")
  title('Petal Length vs Petal Width');
  xlabel ('Petal Length');
  ylabel('Petal Width');
  legend("Setosa", "Versicolor");

figure(5)
  setosa_petal_length_width       = c_1(:,1)./c_1(:,2);
  versicolor_petal_length_width   = c_2(:,1)./c_2(:,2);
  setosa_setosa_length_width      = c_1(:,3)./c_1(:,4);
  versicolor_setosa_length_width  = c_2(:,3)./c_2(:,4);
  plot(setosa_petal_length_width, setosa_setosa_length_width,"bo",
       versicolor_petal_length_width,versicolor_setosa_length_width,"r*")
  title('Relation Petal Length/Width vs Relation Sepal Length/Width');
  xlabel ('Petal Length/Length');
  ylabel('Sepal Length/Width');
  legend("Setosa", "Versicolor");















