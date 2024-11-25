CREATE TABLE yourschema.`teams` (
    -- Membuat tabel bernama 'teams' dalam skema 'yourschema'.

    `teamkey` smallint(5) NOT NULL AUTO_INCREMENT,
    -- Kolom 'teamkey' bertipe SMALLINT dengan panjang maksimum 5 digit, bersifat NOT NULL,
    -- dan memiliki nilai yang secara otomatis bertambah (AUTO_INCREMENT).
    -- Kolom ini digunakan sebagai kunci utama tabel.

    `teamid` char(3) NOT NULL,
    -- Kolom 'teamid' bertipe CHAR dengan panjang tepat 3 karakter, bersifat NOT NULL.
    -- Menyimpan kode identifikasi unik untuk tim.

    `yearid` year(4) NOT NULL,
    -- Kolom 'yearid' bertipe YEAR dengan format 4 digit, bersifat NOT NULL.
    -- Menyimpan tahun terkait tim.

    `leagueid` char(2) NOT NULL,
    -- Kolom 'leagueid' bertipe CHAR dengan panjang tepat 2 karakter, bersifat NOT NULL.
    -- Menyimpan kode liga tempat tim bermain.

    `teamrank` tinyint(2) NOT NULL,
    -- Kolom 'teamrank' bertipe TINYINT dengan panjang maksimum 2 digit, bersifat NOT NULL.
    -- Menyimpan peringkat tim dalam liga (misalnya, peringkat akhir musim).

    PRIMARY KEY (`teamkey`),
    -- Menetapkan 'teamkey' sebagai PRIMARY KEY tabel, yang menjadi identitas unik untuk setiap baris.

    UNIQUE KEY `teamkey_UNIQUE` (`teamkey`),
    -- Menambahkan indeks unik pada kolom 'teamkey' untuk memastikan nilainya tidak duplikat.

    KEY `teamid_yearid_leagueid_UNIQUE` (`teamid`, `yearid`, `leagueid`),
    -- Membuat indeks pada kombinasi kolom 'teamid', 'yearid', dan 'leagueid' untuk mempercepat pencarian data terkait.

    CONSTRAINT `check_teamrank` 
        CHECK (((`teamrank` >= 0) AND (`teamrank` <= 12))),
    -- Menambahkan aturan CHECK untuk memastikan nilai 'teamrank' berada dalam rentang 0 hingga 12.

    CONSTRAINT `check_year` 
        CHECK (((`yearid` >= 1871) AND (`yearid` <= 2155)))
    -- Menambahkan aturan CHECK untuk memastikan nilai 'yearid' berada dalam rentang tahun 1871 hingga 2155.
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;
-- Menggunakan mesin penyimpanan InnoDB dengan charset UTF-8 dan collation utf8mb4_0900_ai_ci.


-- by hafizhhasyhari
