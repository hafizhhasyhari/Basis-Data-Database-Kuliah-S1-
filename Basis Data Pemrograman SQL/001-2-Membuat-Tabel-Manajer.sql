CREATE TABLE yourschema.`managers` ( 
    -- Membuat tabel bernama 'managers' dalam skema 'yourschema'.
    `managerkey` smallint(5) NOT NULL AUTO_INCREMENT, 
    -- Kolom 'managerkey' bertipe SMALLINT dengan panjang 5 digit, bersifat NOT NULL, dan memiliki nilai otomatis yang meningkat (AUTO_INCREMENT).
    
    `playerid` varchar(9) NOT NULL, 
    -- Kolom 'playerid' bertipe VARCHAR dengan panjang maksimum 9 karakter, bersifat NOT NULL.
    
    `yearid` year(4) NOT NULL, 
    -- Kolom 'yearid' bertipe YEAR dengan format 4 digit, bersifat NOT NULL (menyimpan data tahun).

    `teamid` char(3) NOT NULL, 
    -- Kolom 'teamid' bertipe CHAR dengan panjang tepat 3 karakter, bersifat NOT NULL (menyimpan kode tim).

    `games` tinyint(3) NOT NULL, 
    -- Kolom 'games' bertipe TINYINT dengan panjang 3 digit, bersifat NOT NULL (jumlah total permainan yang dikelola).

    `wins` tinyint(3) NOT NULL, 
    -- Kolom 'wins' bertipe TINYINT dengan panjang 3 digit, bersifat NOT NULL (jumlah kemenangan).

    `losses` tinyint(3) NOT NULL, 
    -- Kolom 'losses' bertipe TINYINT dengan panjang 3 digit, bersifat NOT NULL (jumlah kekalahan).

    `alsoplayer` char(1) NOT NULL, 
    -- Kolom 'alsoplayer' bertipe CHAR dengan panjang tepat 1 karakter, bersifat NOT NULL.
    -- Menyimpan apakah manajer juga merupakan pemain: 'Y' (ya) atau 'N' (tidak).

    PRIMARY KEY (`managerkey`), 
    -- Menetapkan 'managerkey' sebagai PRIMARY KEY (identitas unik untuk setiap baris di tabel).

    UNIQUE KEY `managerkey_UNIQUE` (`managerkey`), 
    -- Membuat indeks unik pada kolom 'managerkey' untuk memastikan nilainya tidak duplikat.

    UNIQUE KEY `playerid_yearid_teamid_UNIQUE` (`playerid`,`yearid`,`teamid`), 
    -- Membuat indeks unik gabungan pada kolom 'playerid', 'yearid', dan 'teamid' untuk memastikan kombinasi nilainya unik.

    KEY `FK_teamid_idx` (`teamid`), 
    -- Membuat indeks biasa pada kolom 'teamid' untuk mempercepat pencarian data terkait tim.

    CONSTRAINT `FK_teamid` FOREIGN KEY (`teamid`) 
        REFERENCES `teams` (`teamid`) 
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT, 
    -- Menambahkan foreign key pada kolom 'teamid' yang merujuk ke kolom 'teamid' di tabel 'teams'.
    -- Aksi DELETE atau UPDATE akan dicegah (RESTRICT) jika data terkait diubah atau dihapus.

    CONSTRAINT `check_alsoplayer` 
        CHECK ((`alsoplayer` IN (_utf8mb4'Y',_utf8mb4'N'))), 
    -- Menambahkan aturan CHECK untuk memastikan nilai 'alsoplayer' hanya bisa 'Y' atau 'N'.

    CONSTRAINT `check_games` 
        CHECK (((`games` >= 0) AND (`games` <= 165))), 
    -- Menambahkan aturan CHECK untuk memastikan nilai 'games' berada dalam rentang 0 hingga 165.

    CONSTRAINT `check_losses` 
        CHECK (((`losses` >= 0) AND (`losses` <= 165))), 
    -- Menambahkan aturan CHECK untuk memastikan nilai 'losses' berada dalam rentang 0 hingga 165.

    CONSTRAINT `check_manager_year` 
        CHECK (((`yearid` >= 1871) AND (`yearid` <= 2155))), 
    -- Menambahkan aturan CHECK untuk memastikan nilai 'yearid' berada dalam rentang tahun 1871 hingga 2155.

    CONSTRAINT `check_wins` 
        CHECK (((`wins` >= 0) AND (`wins` <= 165))) 
    -- Menambahkan aturan CHECK untuk memastikan nilai 'wins' berada dalam rentang 0 hingga 165.
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci 
COMMENT=' '; 
-- Menggunakan mesin penyimpanan InnoDB, menetapkan charset default UTF-8 dengan collation utf8mb4_0900_ai_ci.
