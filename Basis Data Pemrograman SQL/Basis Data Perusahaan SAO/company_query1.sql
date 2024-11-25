\connect company

-- Menentukan Employee yang memiliki FName diawali huruf 'H':
SELECT SSN, FName, LName, BDate
    FROM Employee
    WHERE FName LIKE 'H%';

-- Mengelompokkan level Employee berdasarkan Salary (Jika > 3500000, maka Level = 'Top'; Selainnya Level = 'Middle'):
SELECT SSN, FName, Salary, CASE WHEN Salary > 3500000 THEN 'Top' ELSE 'Middle' END AS Level
    FROM Employee
    ORDER BY SSN;

-- Menentukan Salary terbesar, Salary terkecil, dan Salary rata-rata dari Employee:
SELECT MAX(Salary), MIN(Salary), AVG(Salary)
    FROM Employee;

-- Menentukan banyaknya Employee yang beralamat di BARA:
SELECT COUNT(SSN) AS Jumlah_Employee_di_BARA
    FROM Employee
    WHERE Address = 'BARA';

-- Menentukan jumlah lokasi project (tanpa pengulangan dan dengan pengulangan):
SELECT COUNT(DISTINCT PLocation) AS "distinct lokasi", COUNT(PLocation) AS "total lokasi"
    FROM Project;

-- Menentukan Salary terkecil, Salary terbesar, dan Salary rata-rata dari tiap Department diurutkan dari Salary terbesar:
SELECT Dnum, Min(Salary), MAX(Salary), AVG(Salary)
    FROM Employee
    GROUP BY DNum
    ORDER BY DNum DESC;

-- Menentukan Address yang memiliki lebih dari empat orang Employee:
SELECT Address, COUNT(*)
    FROM Employee
    GROUP BY Address
    HAVING COUNT(*) > 4
    ORDER BY Address;

-- Menentukan user dan waktu terakhir :
SELECT CURRENT_USER, CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP;

-- Menentukan usia Employee (berdasarkan tanggal lahirnya)
SELECT SSN, FName, Age(CURRENT_DATE, BDate) AS Age
    FROM Employee
    ORDER BY Age ASC;
