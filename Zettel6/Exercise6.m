load 'train_labels.mat'
load 'train_images.mat'
load 'test_images.mat'

for i= 1:size(test_images,1)
    #I = test_images(i,:);
    #I = reshape(I,[112,92]);
    #figure(1), imshow(I,[]);
    #pause(0.1);
end
faceFeats = [];
nonFaceFeats = [];

numPix = 0;
for i = 1:size(train_images,1)
  I = train_images(i,:);
  I = reshape(I, [112,92]);

  P = train_labels(i,:);
  P = reshape(P, [112,92]);
  B = im2col(padarray(I, [1,1],0, 'both'), [3, 3], 'sliding');
  faceFeatsNew = B(:,logical(P(:)));
  nonFaceFeatsNew = B(:,~logical(P(:)));

  faceFeats = [faceFeats faceFeatsNew];
  nonFaceFeats = [nonFaceFeats nonFaceFeatsNew];
end

#Estimating parameters
#Faces
MF = mean(faceFeats)
CF = cov(double(faceFeats))
#Non-faces
MN = mean(nonFaceFeats)
CN = cov(double(nonFaceFeats))

#Getting an evaluation picture and converting it into feature vectors
eval_image      = test_images(1,:);
eval_image_feat = im2col(eval_image, []);

#Minimum Distance Classifier
dist_1 = sum((double(eval_image_feat) - repmat(MF', [1 size(eval_image_feat,2)])).^2);
dist_2 = sum((double(eval_image_feat) - repmat(MN', [1 size(eval_image_feat,2)])).^2);
result = dist_1 < dist_2;

#With Bayes
faceFeats = faceFeats';
nonFaceFeats = nonFaceFeats';
#Computing the priors
#p1 = size(faceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));
#p2 = size(nonfaceFeats,2)//(size(faceFeats,2)+size(nonFaceFeats,2));
p1 = 0.5;
p2 = 0.5;
#Computing the likelihoods for each image
p_x_1 = mvnpdf(doble(eval_image_feat'), MF, CF);
p_x_2 = mvnpdf(double(eval_image_feat'), MN, CN);

p_x_1_p_1 = p_x_1 * p1;
p_x_2_p_2 = p_x_2 * p2;

#With bayes decision rule, take largest discriminant function
result = p_x_1_p_1 > p_x_2_p_2;
