%businessCard = imread('C:\Users\Tharaka\Desktop\Dip_Project\text4.jpg');
%ocrResults = ocr(businessCard);
%bboxes = locateText(ocrResults, 'is', 'IgnoreCase', true);
%Iocr = insertShape(businessCard, 'FilledRectangle', bboxes);
%figure; imshow(Iocr);

[filename,pathname]=uigetfile('*.jpg;*.png;*.tiff;*.jpeg;*.gif;*.tif');
image=imread(cat(2,pathname,filename));
imshow(image);