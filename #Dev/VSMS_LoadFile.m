function Output_Image = VSMS_LoadFile( file_name )

img_dir_path = 'C:\Users\Surafel Nigussie\Documents\MATLAB\Images\';
img_URL = strcat(img_dir_path, file_name{1});
        if ~exist(img_URL, 'file')
            % Didn't find it there.  Check the search path for it.
            path_str = file_name{1}; % No path this time.
                if ~exist(path_str, 'file')
                    % Still didn't find it.  Alert user.
                    errorMessage = sprintf('Error: %s does not exist.', path_str);
                    uiwait(warndlg(errorMessage));
                    return;
                end
        end
Output_Image = imread( img_URL );
subplot(3,3,1); imshow(Output_Image);

end
