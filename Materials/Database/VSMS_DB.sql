CREATE DATABASE VSMS;
GO 

USE VSMS; 
GO 

CREATE SCHEMA MS AUTHORIZATION dbo;
GO

CREATE TABLE MS.Processed_Image
    (
      PI_ID INT IDENTITY(1, 1) ,
      Image_Filename NVARCHAR(25) NOT NULL ,
      Processed BIT DEFAULT ( 0 ) ,
      Processed_DateTime DATETIME ,
      Captured_DateTime DATETIME
    );

--DateTime => 2015-01-01 22:59:59.990