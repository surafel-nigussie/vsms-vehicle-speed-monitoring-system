%Set preferences with setdbprefs.
setdbprefs('DataReturnFormat', 'cellarray');%%Setting return type from database to an array
setdbprefs('NullNumberRead', 'Null_Numbers');%%If error where accessing number 
setdbprefs('NullStringRead', 'Null_Strings');%%If error when accessing string

%Make connection to database.  Note that the password has been omitted.
%Using JDBC driver.
conn = database('TEST', '', '', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', '127.0.0.1', 'PortNumber', 1433, 'AuthType', 'Windows');
%Insert query%
colnames = {'ID','Name'};
%Insert query%
data = {1660,'Seyfe'};
%Insert query%
tablename = 'TEST_Table';
%Insert query%
insert(conn,tablename,colnames,data);

%Close database connection.
close(conn);
%Clear variables
clear conn data tablename colnames