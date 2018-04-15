img='E:\FCI\Third year\Second term\Image processing\Project\Subtitles_Extraction_Application\Data set\1.jpg';
img=readImg(img);
%figure;
%imshow(img);

trans = haarFilter(img);
extract_trans(trans);

