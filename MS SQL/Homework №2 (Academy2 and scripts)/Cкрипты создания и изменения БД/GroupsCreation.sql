USE Academy2

CREATE TABLE Groups (
	GroupID INT PRIMARY KEY IDENTITY(1,1),
	GroupName NVARCHAR(10) NOT NULL DEFAULT 'Name' UNIQUE,
	Rating INT NOT NULL CHECK(Rating >= 0 AND Rating <= 5),
	Course INT NOT NULL CHECK(Course > 0 AND Course <= 5)
)