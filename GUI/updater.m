function updater(obj,event,hImage)
% This callback function updates the displayed frame and the histogram.

% Display the current image frame. 
set(hImage, 'CData', event.Data);

%Write your code here, inorder to process each incoming frame%

% Refresh the display.
drawnow;
