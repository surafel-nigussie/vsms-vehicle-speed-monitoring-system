%%
%Set preferences with setdbprefs.
setdbprefs('DataReturnFormat', 'cellarray');%Setting return type from database to an array
setdbprefs('NullNumberRead', 'Null_Number');%If error where accessing number 
setdbprefs('NullStringRead', 'Null_String');%If error when accessing string

%%
%Make connection to database.  Note that the password has been omitted using JDBC driver.
% conn = database('VSMS', '', '', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Windows');
conn = database('VSMS','','','Vendor','Microsoft SQL Server','Server','SURAFELNIGUSSIE','AuthType','Windows','PortNumber',1433);
%Execute Query and read result, Query is located in an external file
results = runsqlscript(conn,'C:\Users\Surafel Nigussie\Documents\MATLAB\#Dev\VSMS_GetImageScript.sql');
%Parse query result data into variable
row_value = results(1).data;
row_number = rows(results);

%%
%Path of location of the image stroage folder
path = 'C:\Users\Surafel Nigussie\Documents\MATLAB\Images\';
%Acessing the results of the query
for i = 1 : row_number
    path_str = strcat(path, row_value{i});
        %Check whether the file is valid
        if ~exist(path_str, 'file')
        % Didn't find it there.  Check the search path for it.
        path_str = row_value{i}; % No path this time.
            if ~exist(path_str, 'file')
                % Still didn't find it.  Alert user.
                errorMessage = sprintf('Error: %s does not exist.', path_str);
                uiwait(warndlg(errorMessage));
                return;
            end
        end
    img = imread(path_str);
    figure, imshow(img);
end

%%
%Close database connection.
close(conn);
%%Clear variables
clear all;
clc;
