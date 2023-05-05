-------- OVERVIEW SQL B1 --------
----- Các kiểu dữ liệu phổ biến trong SQL (3 kiểu phổ biến)
	1.  Dữ liệu dạng chữ 
		nvarchar(max): chữ có dấu
		varchar(max): ko viết đc chữ có dấu
	2. Dữ liệu dạng số
		int: số nguyên 1, 2, 3
		float: 2,1 
	3. Dữ liệu dạng ngày
		date: YYYY-MM_DD
		datetime: YYYY-MM-DD HH:MI:SS
		year: YYYY or YY


----- Các bước để tạo bảng
	create database D4E45

--- Tao bang
	create table Thong_tin_sinh_vien (STT INT
									, Ho_ten nvarchar(max)
									, Gioi_tinh nvarchar(max)
									, Ngay_sinh date
									, Truong_hoc nvarchar(max)
									, Nganh_hoc nvarchar(max)
									, Thanh_pho nvarchar(max),
									)

	select * from Thong_tin_sinh_vien

--- Insert data
	insert into Thong_tin_sinh_vien (STT, Ho_ten, Gioi_tinh, Ngay_sinh, Truong_hoc, Nganh_hoc, Thanh_pho)
	values (1, N'Nguyễn Văn A', N'Nam', '2000/01/01', N'Đại học Quốc Gia', N'Kế toán', N'Nha Trang')

	insert into Thong_tin_sinh_vien values (2
										, N'Trương Văn Nga'
										, N'Nữ'
										, '1998/02/02'
										, N'Đại học Cần Thơ'
										, N'Quản lý khách sạn'
										, N'Hồ Chí Minh'
											)
	
	insert into Thong_tin_sinh_vien values (3
										, N'Lâm Đức Toàn'
										, N'Nam'
										, '1995/04/30'
										, N'Đại học Y Dược'
										, N'Y đa khoa'
										, N'Hồ Chí Minh'
										)

	insert into Thong_tin_sinh_vien values (4
										, N'Nguyễn Vĩnh Hùng'
										, 'Nam'
										, '1999/03/25'
										, N'Đại học Ngoại thương'
										, N'Nghiên cứu kinh doanh'
										, N'Hà Nội'
										)

	insert into Thong_tin_sinh_vien values (5
										, N'Phan Thành Vinh'
										, 'Nam'
										, '1997/03/14'
										, N'Đại học kinh tế TPHCM'
										, N'Quản trị nguồn nhân lực'
										, N'Hồ Chí Minh'
										)


----- Các kiểu Select
	Thong_tin_sinh_vien

1.	Select *
	From

2.	Select distinct 

3.	Select 1 vài trường


	Select * from Thong_tin_sinh_vien


	Select distinct thanh_pho from Thong_tin_sinh_vien


	Select Ho_ten
		, Truong_hoc
		, Nganh_hoc
	from Thong_tin_sinh_vien


	Select *
	from Thong_tin_sinh_vien
	where Gioi_tinh = 'Nam'
	
--- all ttin svien đang sống tại HN và Nha Trang 
	Select * 
	from Thong_tin_sinh_vien
	where Thanh_pho = N'Nha Trang'
	and Thanh_pho = N'Hà Nội'


	Select * 
	from Thong_tin_sinh_vien
	where Thanh_pho in ('Nha Trang', N'Hà Nội')
	
--- a Vinh
	Select * 
	from Thong_tin_sinh_vien
	where Thanh_pho = 'Nha Trang'
	or  Thanh_pho = N'Hà Nội'



----- OVERVIEW B2 -----
1. Hàm AGGREGATE function: những hàm tính toán bao gồm: max, min, count,...
2. Lưu ý khi dùng hàm này: GROUP BY


select * from dbo.sales_data_sample

---Q1: tính tổng số lượng đặt hàng với PRODUCTLINE là Motorcycles vào năm 2003
	SELECT PRODUCTLINE
		, sum(QUANTITYORDERED) AS SO_LUONG
		, YEAR_ID 
	FROM dbo.sales_data_sample
	GROUP BY PRODUCTLINE, YEAR_ID
	HAVING PRODUCTLINE = 'Motorcycles'
	AND YEAR_ID = '2003'


---Q2: tính tổng đơn đã đặt hàng thành công vào năm 2004 đến đất nước USA
	SELECT SUM(QUANTITYORDERED) AS QUANTITY
		, YEAR_ID
		, COUNTRY
		, PRODUCTLINE
		, STATUS
	FROM dbo.sales_data_sample
	GROUP BY YEAR_ID, COUNTRY, PRODUCTLINE, STATUS
	HAVING STATUS = 'Shipped'
	AND YEAR_ID = '2004'
	AND COUNTRY = 'USA'
	

---Q3: tính tổng đơn đã đặt hàng thành công đến đất nước USA sắp xếp theo năm đặt hàng desc
	SELECT SUM(QUANTITYORDERED) AS QUANTITY
		, YEAR_ID
		, COUNTRY
		, PRODUCTLINE
		, STATUS
	FROM dbo.sales_data_sample
	GROUP BY YEAR_ID
			, COUNTRY
			, PRODUCTLINE
			, STATUS
	HAVING STATUS = 'Shipped' AND COUNTRY = 'USA'
	ORDER BY YEAR_ID DESC


--- 
	SELECT TOP 3* 
	FROM dbo.sales_data_sample

	SELECT *
	FROM dbo.sales_data_sample
	LIMIT 3

---

2003-02-24 00:00:00.0000000

	SELECT 
		ORDERNUMBER
		, QUANTITYORDERED
		, ORDERDATE
		, PRODUCTLINE
		, YEAR_ID
		, CONVERT(VARCHAR(2), ORDERDATE, 110) AS MONTH
		, CONVERT(VARCHAR(4), ORDERDATE, 111) AS YEAR
		, CONVERT(VARCHAR(2), ORDERDATE, 103) AS DAY
	INTO #TEST
	FROM dbo.sales_data_sample

	SELECT * FROM #TEST


----- CÁC CÁCH ĐỂ XÓA DỮ LIỆU XÓA BẢNG
	
1.	DELETE: có điều kiện

	DELETE FROM #TEST
	WHERE PRODUCTLINE = 'Motorcycles'


2.	TRUNCATE: xóa toàn bộ dữ liệu trong bảng nhưng bảng vẫn nằm trong database

	TRUNCATE TABLE #TEST

3.	DROP: xóa all bảng và xóa cả trong database

	DROP TABLE #TEST

	

----- OVERVIEW B3 -----
	- LEFT JOIN: tất cả những gtri bên trái sẽ được giữ lại, ghép cặp với bảng bên phải, ko tìm đc gtri để ghép output hiện gtri null
	- INNER JOIN: chỉ những dòng ghép cặp thành công sẽ xuất hiện ở output
	- RIGHT JOIN:tất cả những gtri bên phải sẽ được giữ lại, ghép cặp với bảng bên trái, ko tìm đc gtri để ghép output hiện gtri null
	- FULL JOIN : giữ lại tất cả các giá trị của bảng mình join

 --- NOTE:
	Output của Join dựa trên 2 điều kiện: kiểu join và điều kiện của JOIN 

/* Create the schema for our tables */
select * from College
select * from Student
select * from APPLY

----- OVERVIEW B4 -----
1.	UNION: Lấy distinct dữ liệu
	UNION ALL: Lấy tất cả thông tin 

2.	Sự khác nhau giữa Join và Union
	Union: mở rộng dữ liệu theo chiều dọc
	Join: mở rộng theo chiều ngang

3. Fact table: Measure business activity
	Dim table: Describe an object



/* Practice */
--------*** JOIN ***--------
--- Q1: student name, major for which they've applied: Lấy tên sinh viên và ngành học mà SV đăng kí
	SELECT sName
		, major
		, A.sID
	FROM STUDENT as A
	LEFT JOIN APPLY as B
	ON A.sID = B.sID

	
--- Q2: name, GPA of student with sizeHS < 1000, applying to CS at Standford: Lấy ra tên, điểm GPA của SV với sizeHS < 1000, nộp HS học CS tại Standford
	SELECT sName
		, GPA
		, sizeHS
		, cName
		, major
	FROM APPLY as A
	LEFT JOIN STUDENT as B
	ON A.sID = B.sID
	WHERE sizeHS < 1000
	AND cName = 'Stanford'
	AND major = 'CS'

--- Q3: application info: name, ID, college name, major. Include students who haven't applied anywwhere
    SELECT sName
		, A.sID
		, cName
		, major
	FROM APPLY as A
	RIGHT JOIN STUDENT as B
	ON A.sID = B.sID


--- Q4: application info: name, ID, college name, major. Include app without matching student
	SELECT A.sName
		, A.SID
		, B.cName
		, B.major
	FROM STUDENT as A
	RIGHT JOIN APPLY as B
	ON A.sID = B.sID
   
--- Q5: application info: tên hs, id, tên trường, major
--- Include student who havent applied anywhere: Bao gồm những sinh viên chưa nộp đơn ở bất cứ đâu
--- and application without matching student: và HS ko có ứng viên phù hợp 

--- Q6: application info: ID, name, GPA, college name, enrollment
   


select * from College
select * from Student
select * from APPLY

--------*** AGGREGATE FUNCTION ***--------

--- Q1: Calculate AVG GPA of all students
	SELECT ROUND(AVG(GPA), 2) as AVG_GPA
	FROM STUDENT

--- Q2: Highest and lowest GPA of student who applying CS
	SELECT MAX(GPA) AS MAX_GPA
		, MIN(GPA) AS MIN_GPA
	FROM STUDENT as A
	INNER JOIN APPLY as B
	ON A.sID = B.sID
	WHERE major = 'CS'


--- Q3: Number of college have enrollmement bigger than 15000: trg đh có số lượt đki > 15000
	SELECT cName
		, enrollment
	FROM COLLEGE
	WHERE enrollment > 15000

--- Q4: Number of student applying Cornell
	SELECT sName
		, cName
		, count (A.sID)
	FROM STUDENT as A
	LEFT JOIN APPLY as B
	ON a.sid = b.sid
	WHERE cName = 'Cornell'
	GROUP BY sName, cName

--- Q5: Number of application to each collge:
	SELECT enrollment, major
	FROM COLLEGE as B
	RIGHT JOIN APPLY as A
	ON B.Cname = A.cName


--- Q6: Application information (Sort by decreasing GPA, Increasing enrollment)
	SELECT A.GPA
		, ENROLLMENT
		, SNAME
		, A.SID
		, C.CNAME
	FROM STUDENT AS A
	INNER JOIN APPLY AS B ON A.SID = B.SID
	LEFT JOIN COLLEGE AS C ON C.CNAME = B.CNAME
	ORDER BY GPA DESC, ENROLLMENT ASC


--- Q7: Add scaled GPA(GPA*(sizeHS/1000) based on sizeHS: Tính điểm TB đc chia tỷ lệ
	SELECT SNAME
		, GPA*(SIZEHS/1000) AS AVG_SCORE
		, SIZEHS
	FROM STUDENT

--- Q8: Sum of college enrolment by state: tổng slg tuyển sinh theo mỗi tiểu bang 
	SELECT SUM(ENROLLMENT) AS TOTAL_ENROLL
		, STATE
	FROM COLLEGE
	GROUP BY STATE


--- Q9: MIN and MAX GPA of applicant to each college and major: Điểm trung bình MIN, MAX của ứng viên vào từng trường đại học và chuyên ngành
	SELECT MIN(GPA) AS MIN_GPA
		, MAX(GPA) AS MAX_GPA
		, CNAME
		, MAJOR
	FROM STUDENT AS A
	INNER JOIN APPLY AS B
	ON A.SID = B.SID
	GROUP BY CNAME, MAJOR

--- Q10: Number of collge applied by each student: số trg mà mỗi hs đki
	SELECT SNAME
		, COUNT(DISTINCT CNAME) AS SCHOOL_NO
	FROM STUDENT AS A
	INNER JOIN APPLY AS B
	ON A.SID = B.SID
	GROUP BY SNAME


	SELECT SNAME
		, COUNT(CNAME) AS SCHOOL_NO
	FROM STUDENT AS A
	INNER JOIN APPLY AS B
	ON A.SID = B.SID
	GROUP BY SNAME


--- Q11: College with fewer 5 application 
	SELECT CNAME
		, COUNT(DISTINCT SID) AS APPLICATION
	FROM APPLY
	GROUP BY CNAME
	HAVING COUNT(DISTINCT SID) < 5
	

--- Q12: Majors whose applicant's maximum GPA is below the avg GPA: Các ngành có điểm max avg của ứng viên thấp hơn điểm avg
	SELECT MAJOR, MAX(GPA) AS MAX_GPA, AVG(GPA) AS AVG_GPA
	FROM APPLY AS A
	LEFT JOIN STUDENT AS B
	ON A.SID = B.SID
	GROUP BY MAJOR
	HAVING MAX(GPA) < (SELECT AVG(GPA) FROM STUDENT AS AVG_GPA)

	




