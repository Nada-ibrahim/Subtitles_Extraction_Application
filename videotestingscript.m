v = VideoReader('Data set/video1.mp4');
framerate = v.FrameRate;
framenum = 0;
while hasFrame(v)
    framenum = framenum + 1;
    frame = readFrame(v);

    if (framenum > (floor(framerate * 2)));
        %imshow(frame);
        process_img(frame);
        framenum= 0;
    end
end
