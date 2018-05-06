function videotestingscript(videoPath )
v = VideoReader(videoPath);
%v = VideoReader('Data set/video1.mp4');
framerate = v.FrameRate;
framenum = 0;
while hasFrame(v)
    framenum = framenum + 1;
    frame = readFrame(v);

    if (framenum > (floor(framerate * 2)))
        fileID = fopen('subtitleText.txt', 'a');

        %imshow(frame);
        str=process_img(frame);
        str = [str '\n'];
        fprintf(fileID,str);
        framenum= 0;
        fclose(fileID);

    end
end
end

