%Set preferences with setdbprefs.
setdbprefs('DataReturnFormat', 'cellarray');%%Setting return type from database to an array
setdbprefs('NullNumberRead', 'Null_Number');%%If error where accessing number 
setdbprefs('NullStringRead', 'Null_String');%%If error when accessing string

%Make connection to database.  Note that the password has been omitted.
%Using JDBC driver.
conn = database('VSMS', '', '', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Windows');

%Read data from database.
results = runsqlscript(conn,'selectQ.sql');

%Assign data to output variable
row_value = results(1).data;

if ( row_value(1) == 1 )
    value = 10;
end

%Close database connection.
close(conn);
%Clear variables
%clear all;