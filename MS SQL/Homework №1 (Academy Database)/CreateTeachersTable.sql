USE Academy

CREATE TABLE Teachers (
	TeacherID INT PRIMARY KEY IDENTITY(1,1),
	EmploymentDate DATE NOT NULL CHECK(EmploymentDate >= '1990-01-01'),
	TeacherName NVARCHAR(MAX) NOT NULL DEFAULT 'Teacher',
	Premium MONEY NOT NULL CHECK(Premium >= 0) DEFAULT 0,
	Salary MONEY NOT NULL CHECK(Salary <= 0),
	Surname NVARCHAR(MAX) NOT NULL DEFAULT 'Surname'
)