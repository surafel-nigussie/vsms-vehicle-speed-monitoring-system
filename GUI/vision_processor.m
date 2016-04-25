function vision_processor(obj, event, hImage)
% This callback function updates the displayed frame and the histogram.

    se = strel('square', 3); 
    foregroundDetector = vision.ForegroundDetector('NumGaussians', 100, 'NumTrainingFrames', 1);
    blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, 'AreaOutputPort', false, 'CentroidOutputPort', false, 'MinimumBlobArea', 150);

    % Display the current image frame. 
    nor_img = event.Data;

    % Detect the foreground in the current video framef
    foreground = step(foregroundDetector, nor_img);

    % Use morphological opening to remove noise in the foreground
    filteredForeground = imopen(foreground, se);

    % Detect the connected components with the specified minimum area, and
    % compute their bounding boxes
    bbox = step(blobAnalysis, filteredForeground);

    % Draw bounding boxes around the detected cars
    result = insertShape(nor_img, 'Rectangle', bbox, 'Color', 'green');

    % Display the number of cars found in the video frame
    numCars = size(bbox, 1);
    result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, 'FontSize', 14);
    set(hImage, 'CData', result);

%% 
% clear se;
% clear foregroundDetector;
% clear blobAnalysis;

% Refresh the display.
drawnow;
