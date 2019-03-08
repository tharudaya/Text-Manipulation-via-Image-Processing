
%sunglass = imread('C:\Users\Tharaka\Desktop\sun7.jpg');
%hat = imread('C:\Users\Tharaka\Desktop\hat2.png');
face = imread('C:\Users\Tharaka\Desktop\Dip_Project\me3.jpg');
%image = imadjust(face,[.1 .2 0; .8 .9 1],[]);
%monkey = imread('C:\Users\Tharaka\Desktop\monkey.png');
faceDetector = vision.CascadeObjectDetector;
shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 255]);
bboxes = step(faceDetector, face);
%EyeDetect = vision.CascadeObjectDetector('EyePairBig');
%bboxes = step(EyeDetect,face);


%I_faces = step(shapeInserter,face,int32(bboxes));
%imshow(I_faces);
%[J, rect] = imcrop(I_faces);
%figure,imshow(J);

%filter = face;
%rectangle(sunglass,bboxes2);
%bboxes
%crop = imcrop(face,bboxes);
%imshow(crop);
%imtool(face);
%size(crop)
%size(sunglass)

%J = imresize(sunglass,[20 60]);

%face(1:20,1:60,:) = J;
%imshow(face);

xMin = ceil(bboxes(1))
xMax = xMin + bboxes(3) - 1
yMin = ceil(bboxes(2))
yMax = yMin + bboxes(4) - 1


I2 = imcrop(face,[xMin-20 yMin-20 xMax-xMin+41 yMax-yMin+41]);
%resize = imresize(I2,[100 100]);
%imshow(resize);
imshow(I2);


%Oface = imcrop(face,bboxes);
%[xMax-xMin yMax-yMin d] = size(Oface)

%sunglass1 = imresize(sunglass,[yMax-yMin xMax-xMin ]);
%sung = face(yMin+1:yMax,xMin+1:xMax,:),sunglass1;
%hold on;
%imtool(sunglass1);
%imtool(face);
%hold off;

%image = imadjust(face,[.2 .3 0; .6 .7 1],[]);
%imshow(face);
%rectangle('Position',face,'LineWidth',4,'LineStyle','-','EdgeColor','r');

%bw = im2bw(face);
%bw2 = imfill(bw,'holes');
%imshow(bw);


%xMin2 = ceil(bboxes2(1));
%xMax2 = xMin + bboxes2(3) - 1;
%yMin2 = ceil(bboxes2(2));
%yMax2 = yMin + bboxes2(4) - 1;


%hat1 = imresize(hat,[(yMax2-yMin2)/2 xMax2-xMin2]);
%face(yMin2-((yMax2-yMin2)/2)+1:yMin2,xMin2+1:xMax2,:) = hat1;



%aa = imadd(face,filter);
%imshow(aa);
