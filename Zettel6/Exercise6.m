load 'train_labels.mat'
load 'train_images.mat'
load 'test_images.mat'
pkg load image
pkg load statistics

faceFeats = [];
nonFaceFeats = [];
numPix = 0;
images=train_images;
labels=train_patterns;
for i = 1:size(images,1)
  I = images(i,:);
  I = reshape(I, [112,92]);
  P = labels(i,:);
  P = reshape(P, [112,92]);

  B = im2col(padarray(I, [1,1],0, 'both'), [3, 3], 'sliding');
  faceFeatsNew = B(:,logical(P(:)));
  nonFaceFeatsNew = B(:,~logical(P(:)));
  faceFeats = [faceFeats faceFeatsNew];
  nonFaceFeats = [nonFaceFeats nonFaceFeatsNew];
end

#Estimating parameters
#Faces
MF = mean(faceFeats');
CF = cov(double(faceFeats'));
#Non-faces
MN = mean(nonFaceFeats');
CN = cov(double(nonFaceFeats'));

#Getting an evaluation picture
eval_image      = test_images(1,:);

#Minimum Distance Classifier
dist_1 = sum((double(eval_image) - repmat(MF', [1 size(eval_image,2)])).^2);
dist_2 = sum((double(eval_image) - repmat(MN', [1 size(eval_image,2)])).^2);
result = dist_1 < dist_2;

% Reshape result row vector into a 2D image
eval_image_res = reshape(eval_image, [112,92]);
classified = reshape(result, size(eval_image_res, 1), size(eval_image_res, 2));

% Plot image
 figure(1), imshow(eval_image_res,[]);
 figure(2), imshow(classified,[]);

#With Bayes
faceFeats = faceFeats';
nonFaceFeats = nonFaceFeats';
eval_image_feat = im2col(padarray(eval_image_res, [1, 1], 0, 'both'), [3, 3], 'sliding');

#Computing the priors
p1 = size(faceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));
p2 = size(nonFaceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));


#Computing the likelihoods for each image
p_x_1 = mvnpdf(double(eval_image_feat'), MF, CF);
p_x_2 = mvnpdf(double(eval_image_feat'), MN, CN);

p_x_1_p_1 = p_x_1 * p1;
p_x_2_p_2 = p_x_2 * p2;

#With bayes decision rule, take largest discriminant function
result = p_x_1_p_1 > p_x_2_p_2;

% Reshape result row vector into a 2D image
classified = reshape(result, size(eval_image_res, 1), size(eval_image_res, 2));

% Plot image
 figure(3), imshow(classified,[]);
