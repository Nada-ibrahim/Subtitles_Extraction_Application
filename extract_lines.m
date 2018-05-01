function [ lines , no_trans ] = extract_lines( trans )
    no_trans = 0;
    trans(trans == 255) = 1;
    trans = double(trans);
    trans = bwareaopen(trans, 10); % remove obj with px less than 10
    imshow(trans);
    lines = {};
    if (length(trans) == 0)
        no_trans = 1;
    else
        horizontalProj = mean(trans, 2);
        whiteGaps = horizontalProj  ==  0;
        % Get the centroids of the white gaps
        measurements = regionprops(whiteGaps, 'Centroid');
        allCentroids = [measurements.Centroid];
        centroidX = allCentroids(1:2:end);
        centroidY = allCentroids(2:2:end);
        numwhitegaps = length(centroidY);
        if (numwhitegaps == 0) % only one line
           lines = [lines crop_line(trans)];
        elseif (numwhitegaps == 1) % tow lines
           c = int32(centroidY(1));
           lines = [lines crop_line(trans(1:c, :)) crop_line(trans(c:end, :))];
        else % many lines
            for k = 1 : length(centroidY)-1
                imshow(trans);
                thisLine = trans(int32(centroidY(k)):int32(centroidY(k+1)), :);
                imshow(thisLine);
                lines = [lines crop_line(thisLine)];
            end
        end
    end
end

