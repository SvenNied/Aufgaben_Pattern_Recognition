%Task 1
%Part A

load ("twoClasses.mat")
c_0= patterns(:,1:2000);
c_0= transpose(c_0);
c_1= patterns(:,2001:4000);
c_1= transpose(c_1);


L_col=cell(1,3);          % cell array containing the labels for the columns
L_row=cell(2000,1);         % cell array containing the labels for the rows

L_col(1,2)="Sensor1";
L_col(1,3)="Sensor2";

for i=1:2000
  L_row(i,1)=strcat("Obs", int2str(i));
end

% Adding labels to c_0
L_col(1,1)="Class0";
c_0_L = num2cell(c_0);
c_0_L = cat (2,L_row, c_0_L);
c_0_L = cat (1,L_col, c_0_L);

% Adding labels to c_1
L_col(1,1)="Class1";
c_1_L = num2cell(c_1);
c_1_L = cat (2,L_row, c_1_L);
c_1_L = cat (1,L_col, c_1_L);

%assembeling cloud1
cloud1 =  cat(3, c_0_L, c_1_L);   %assambeling iris1

%defining help variables
Class0_sensor1= c_0(:,1);
Class0_sensor2= c_0(:,2);
Class1_sensor1= c_1(:,1);
Class1_sensor2= c_1(:,2);


%Part B
% Gaussian model with independent components

%Calculating mean for class 0 and 1
m01 = mean(Class0_sensor1);  %mean for class 0 and sensor 1
m02 = mean(Class0_sensor2);
m11 = mean(Class1_sensor1);
m12 = mean(Class1_sensor2);

%Calculating standard deviation for class 0 and 1
d01=sqrt(var(Class0_sensor1));
d02=sqrt(var(Class0_sensor2));
d11=sqrt(var(Class1_sensor1));
d12=sqrt(var(Class1_sensor2));


%Declaring min and max for each class and sensor
min01=min(Class0_sensor1);
max01=max(Class0_sensor1);
min02=min(Class0_sensor2);
max02=max(Class0_sensor2);
min11=min(Class1_sensor1);
max11=max(Class1_sensor1);
min12=min(Class1_sensor2);
max12=max(Class1_sensor2);

%Declaring interval of values for each class and sensor
i01 = min01:0.1:max01;
i02 = min02:0.1:max02;
i11 = min11:0.1:max11;
i12 = min12:0.1:max12;

%Calculating the maginals for class 0 and 1
p0_s1 = exp(-0.5*((i01-m01)./d01).^2)./(sqrt(2*pi)*d01);
p0_s2 = exp(-0.5*((i02-m02)./d02).^2)./(sqrt(2*pi)*d02);
p0_joint= p0_s2'*p0_s1;
p1_s1 = exp(-0.5*((i11-m11)./d11).^2)./(sqrt(2*pi)*d11);
p1_s2 = exp(-0.5*((i12-m12)./d12).^2)./(sqrt(2*pi)*d12);
p1_joint= p1_s2'*p1_s1;

%Plotting the two point distributions of the classes with contours of the two Gaussian distributions

figure (1);
plot(Class0_sensor1,Class0_sensor2,"go",Class1_sensor1,Class1_sensor2,"y*")
  title('Sensor1 vs Sensor2');
  xlabel ('Sensor 1');
  ylabel ('Sensor 2');
  legend("Class0","Class1");
  hold on;
  contour(i01,i02,p0_joint,"blue");
  contour(i11,i12,p1_joint,"red");
  hold off;
  #axis([min_c01-1, max_c01+1 , min_c02-1, max_c02+1]);

figure(2);
plot(i01,p0_s1);

figure(3);
plot(i02,p0_s2);

figure(4);
surf(i01,i02,p0_joint);
axis([min01-1, max01+1 , min02-1, max02+1]);



#i1=[-2:0.1:8];
#i2=[10:0.1:24];

#figure(2);
#plot(i1,normpdf(i1,mean_0(1,1),Var_0(1,1)));
#figure(3);
#plot(i2,normpdf(i2,mean_0(1,2),Var_0(1,2)));











