-- Menghapus database jika sudah ada sebelumnya
DROP DATABASE IF EXISTS company;

-- Membuat database baru dengan nama 'company'
CREATE DATABASE company;

-- Menghubungkan ke database 'company'
\connect company

-- DEFINISI TABEL ------------------------------------------------------------------

-- Membuat tabel 'Employee' untuk menyimpan data karyawan
CREATE TABLE Employee (
    SSN         CHAR(9)     NOT NULL    PRIMARY KEY, -- Nomor identitas karyawan (unik)
    FName       VARCHAR(15) NOT NULL,              -- Nama depan karyawan
    MName       CHAR,                              -- Inisial nama tengah karyawan
    LName       VARCHAR(15) NOT NULL,              -- Nama belakang karyawan
    BDate       DATE,                              -- Tanggal lahir karyawan
    Address     VARCHAR(30),                       -- Alamat karyawan
    Sex         CHAR,                              -- Jenis kelamin (M/F)
    Salary      DECIMAL(10,2),                     -- Gaji karyawan
    SuperSSN    CHAR(9) REFERENCES Employee(SSN),  -- Supervisor dari karyawan (SSN supervisor)
    DNum        INT         NOT NULL               -- Nomor departemen (referensi ke Department)
);

-- Membuat tabel 'Department' untuk menyimpan data departemen
CREATE TABLE Department (
    DNumber     INT         NOT NULL    PRIMARY KEY, -- Nomor departemen (unik)
    DName       VARCHAR(15) NOT NULL    UNIQUE,     -- Nama departemen
    MgrSSN      CHAR(9)     NOT NULL    REFERENCES Employee(SSN), -- SSN manajer departemen
    MgrStartDate DATE                                -- Tanggal mulai menjadi manajer
);

-- Menambahkan kunci asing pada tabel 'Employee' untuk referensi ke tabel 'Department'
ALTER TABLE Employee ADD FOREIGN KEY (DNum) REFERENCES Department(DNumber);

-- Membuat tabel 'Dept_Locations' untuk menyimpan lokasi departemen
CREATE TABLE Dept_Locations (
    DNum        INT         NOT NULL    REFERENCES Department(DNumber), -- Nomor departemen
    DLocation   VARCHAR(15) NOT NULL,                                   -- Lokasi departemen
    PRIMARY KEY (DNum, DLocation)                                       -- Kombinasi unik
);

-- Membuat tabel 'Project' untuk menyimpan data proyek
CREATE TABLE Project (
    PNumber     INT         NOT NULL    PRIMARY KEY, -- Nomor proyek (unik)
    PName       VARCHAR(15) NOT NULL    UNIQUE,     -- Nama proyek
    PLocation   VARCHAR(15),                        -- Lokasi proyek
    DNum        INT         NOT NULL    REFERENCES Department(DNumber) -- Nomor departemen proyek
);

-- Membuat tabel 'Works_On' untuk menyimpan data keterlibatan karyawan dalam proyek
CREATE TABLE Works_On (
    ESSN        CHAR(9)     NOT NULL    REFERENCES Employee(SSN), -- SSN karyawan
    PNum        INT         NOT NULL    REFERENCES Project(PNumber), -- Nomor proyek
    Hours       DECIMAL(3,1) NOT NULL,                            -- Jam kerja karyawan pada proyek
    PRIMARY KEY (ESSN, PNum)                                      -- Kombinasi unik
);

-- Membuat tabel 'Dependent' untuk menyimpan data tanggungan karyawan
CREATE TABLE Dependent (
    ESSN        CHAR(9)     NOT NULL    REFERENCES Employee(SSN), -- SSN karyawan
    Dependent_Name VARCHAR(15) NOT NULL,                         -- Nama tanggungan
    Sex         CHAR,                                            -- Jenis kelamin tanggungan (M/F)
    BDate       DATE,                                            -- Tanggal lahir tanggungan
    Relationship VARCHAR(8),                                     -- Hubungan dengan karyawan
    PRIMARY KEY (ESSN, Dependent_Name)                           -- Kombinasi unik
);

-- PENAMBAHAN DATA -------------------------------------------------------------------

-- Menghapus batasan kunci asing sementara untuk memasukkan data
ALTER TABLE Employee DROP CONSTRAINT Employee_DNum_FKey;

-- Menambahkan data ke tabel 'Employee' dengan nama karakter Sword Art Online
INSERT INTO Employee VALUES('E001','Kirito',NULL,'Kazuto','12-Jan-1999','Aincrad','M',5000000,NULL,1);
INSERT INTO Employee VALUES('E002','Asuna',NULL,'Yuuki','15-Feb-2000','Aincrad','F',4500000,NULL,2);
INSERT INTO Employee VALUES('E003','Sinon',NULL,'Asada','23-Mar-2001','GunGale','F',4000000,NULL,3);
INSERT INTO Employee VALUES('E004','Klein',NULL,'Tsuboi','21-Jan-1998','Aincrad','M',3500000,NULL,4);
INSERT INTO Employee VALUES('E005','Leafa',NULL,'Kirigaya','16-May-2001','Alfheim','F',3000000,'E001',1);
INSERT INTO Employee VALUES('E006','Silica',NULL,'Ayano','09-Dec-2002','Aincrad','F',3000000,'E001',1);
INSERT INTO Employee VALUES('E007','Eugeo',NULL,'Synthesis Thirty Two','02-Aug-2001','Underworld','M',2500000,'E001',1);

-- Menambahkan data ke tabel 'Department' dengan nama departemen dan manajer SAO
INSERT INTO Department VALUES(1,'Combat','E001','01-Jan-2020');
INSERT INTO Department VALUES(2,'Healing','E002','27-Feb-2020');
INSERT INTO Department VALUES(3,'Sniper','E003','30-May-2020');
INSERT INTO Department VALUES(4,'Support','E004','08-Mar-2020');

-- author : hafizhhasyhari

-- Menambahkan data ke tabel lainnya sesuai dengan cerita dan karakteristik SAO

