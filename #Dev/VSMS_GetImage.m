function output = VSMS_GetImage(  )

%Make connection to database.  Note that the password has been omitted using JDBC driver.
conn = database('VSMS','','','Vendor','Microsoft SQL Server','Server','SURAFELNIGUSSIE','AuthType','Windows','PortNumber',1433);
%Execute Query and read result, Query is located in an external file
results = runsqlscript(conn,'C:\Users\Surafel Nigussie\Documents\MATLAB\#Dev\VSMS_GetImageScript.sql');
%Parse query result data into variable
output = results;

end

