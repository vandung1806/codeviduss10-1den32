use AdventureWorks2019
go

L--Tạo một thủ tục lưu trữ lấy ra toàn bộ nhân viên vào làm theo năm có tham số đầu vào là một năm
CREATE PROCEDURE sp_DisplayEmployeesHirevear
    @Hirevear int
AS
 SELECT FROM HumanResources. Employee
HERE DATEPART (YY, HireDate)-etireYear
GO
 --Để chạy thủ tục này cần phải truyền tham số vào là năm mà nhân viên vào làm
 EXECUTE sp_DisplayEmployeesHirevear 1999
GO

--Tạo thủ tục lưu trữ đếm số người vào làm trong một năm xác định có tham số đầu vào là một năm, tham số đầu ra là số người vào làm trong ni
CREATE PROCEDURE sp_EmployeesHireYearCount
   @Hirevear int,
   @Count int OUTPUT
AS
SELECT @Count-COUNT (*) FROM HumanResources. Employee
HERE DATEPART (YY, HireDate)-etirevear I
GO
--Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu vào và một tham số đầu ra.
DECLARE @umber int
EXECUTE sp_EmployeesHirevearCount 1999, @lumber OUTPUT
PRINT @umber
GO
--Tạo thủ tục lưu trữ đếm số người vào làm trong một năm xác định có tham số đầu vào là một năm, hàm trả về số người vào làm năm đó
CREATE PROCEDURE sp_EmployeesHirevearCount2
   @HireYear int
AS
DECLARE @Count int
SELECT Count-COUNT (*) FROM HumanResources. Employee
HERE DATEPART(YY, HireDate)-@tireYear
 RETURN BCount
 GO
 --Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu và lấy về số người làm trong năm đó.
EDECLARE @umber int
EXECUTE @Number - sp_EmployeesHirevearCount2 1999
PRINT umber
 GO
--Tạo bảng tạm #students
ECREATE TABLE #Students
    RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
    FullName nvarchar (100),
	Birthday datetime constraint DF _StudentsBirthday DEFAULT DATEADD (yy, -18, GETDATE())
GO
--Tạo thủ tục lưu trữ tạm để chèn đữ liệu vào bảng tạm
BCREATE PROCEDURE #spīnsertStudents
@rollNo varchar(6),
@fullName nvarchar (100),
@birthday datetime
BAS BEGIN
IF(@birthday IS NULL)
   SET @birthday-DATEADD (Y, -18, GETDATE())
INSERT INTO #Students (RollNo, FullName, Birthday)
    VALUES (@rollNo, @fullName, @birthday)
END
GO
--Sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
BEXEC EspStudents 'A12345', 'abc', NULL
EXEC #spStudents 'A54321', 'abc', '12/24/2011'
SELECT FROM #Students
--Tạo thủ tục lưu trữ tạm để xóa dữ liệu từ bảng tạm theo RollNo
CREATE PROCEDURE #spDeletestudents
   @rollNo varchar(6)
AS BEGIN
    DELETE FROM #Students WHERE RollNo-@rollNo
END
--Xóa dữ liệu sử dụng thủ tục lưu trữ
EXECUTE #spDeletestudents 'A12345'
GO
--Tạo một thủ tục lưu trữ sử dung lệnh RETURN để trả về một số nguyên
CREATE PROCEDURE Cal_Square enum int-e AS
E BEGIN
     RETURN (@num num);
END
GO
--Chạy thủ tục lưu trữ
DECLARE @square int;
EXEC @square - Cal_Square 10;
PRINT @square;
GO
         MODULE 8 ***/
--Xem định nghĩa thủ tục lưu trữ bằng hàm OBJECT DEFINITION
SELECT 08JECT_DEFINITION(OBJECT_ID( 'HumanResources.uspUpdateEmployeePersonalInfo')) AS DEFINITION
--Xem định nghĩa thủ tục lưu trữ bằng
SELECT definition FROM sys.sql_modules
HERE object_id-OBJECT_ID('HumanResources.uspupdateEmployeePersonalInfo')
go

--Thủ tục lưu trữ hệ thống xem các thành phần mà thủ tục lưu trữ phụ thuộc
sp_depends 'HumanResources.uspUpdateEmployeePersonalInfo'
GO
USE Adventurelorks
GO
--Tạo thủ tục lưu trữ sp DisplayEmployees
CREATE PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources. Employee
GO
--Thay đổi thủ tục lưu trữ sp DisplayEmployees
ALTER PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources. Employee
HERE Gender-'F'
GO

--Chạy thủ tục lưu trữ sp DisplayEmployees
EXEC sp_DisplayEmployees
GO
--Xóa một thủ tục lưu trữ
DROP
     PROCEDURE Sp_DisplayEmployees
GO
CREATE PROCEDURE sp_Employeettire
AS
BEGIN
   --Hiến thị
    EXECUTE sp_DisplayEmployeesHireYear 1999
    DECLARE Number int
	EXECUTE sp_EmployeesHireYearCount 1999, @umber OUTPUT
PRINT N'Số nhân viên vào làm năm 1999 là:' + CONVERT(varchar(3),@Number)
END
GO
--Chạy thủ tục lưu trữ
EXEC sp_Employeetire
GO
-- Thay đổi thủ tục lưu trữ sp_Employeetire có khối TRY .. CATCH
ALTER PROCEDURE sp_Employeetire
@Hirevear int
AS
E BEGIN
BEGIN TRY
    EXECUTE sp_DisplayEmployeesHireYear @rireYear
    DECLARE ENumber int
   --Lỗi xảy ra ở đây có thủ tục sp EmployeesHireYearCount chỉ truyền 2 tham số mà ta truyền 3
   EXECUTE sp_EmployeesHireYearCount HireYear, @iumber OUTPUT, 123
PRINT N'Số nhân viên vào làm năm là:' + CONVERT (varchar (3), @Number)
END TRY
BEGIN CATCH
PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
PRINT N'Kết thúc thủ tục lưu trữ'
END CATCH
END
GO
--Chạy thủ tục sp_EmployeeHire
EXEC sp_Employeetire 1999
--Xem thông báo 1ỗi bên Messages không phải bên Result
GO
--Thay đối thủ tục lưu trữ sp_EmployeeHire sử dụng hàm egERROR
BALTER PROCEDURE sp_EmployeeHire
@HireYear int
AS
BEGIN
EXECUTE sp_DisplayEmployeesHireYear etirevear
DECLARE GNumber int
--Lỗi xảy ra ở đây có thủ tục sp_EmployeesHireYearCount chỉ truyền 2 tham số mà ta truyền 3
	EXECUTE sp_EmployeesHireYearCount etireYear, @umber OUTPUT, '123
IF ERROR > e
   PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ
PRINT N'Số nhân viên vào làm năm là: '+ CONVERT (varchar (3), @Number)
END
GO
--Chạy thủ tục sp_EmployeeHire
BEXEC sp_Employeetire 1999
--Xem thông báo lỗi bên Messages không phải bên Result


