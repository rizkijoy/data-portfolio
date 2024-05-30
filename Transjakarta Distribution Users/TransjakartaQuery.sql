-- Total Pendapatan
SELECT  
  SUM(payAmount) Pendapatan
FROM `project-423513.Transjakarta.Transjakarta`;

-- Total Pengguna
SELECT
  COUNT(DISTINCT payCardID)
FROM `project-423513.Transjakarta.Transjakarta`;

-- Total Pengguna Harian Selama 1 Bulan
SELECT
  DATE(tapInTime) Tanggal,
  COUNT(payCardID) TotalPengguna
FROM `project-423513.Transjakarta.Transjakarta`
GROUP BY 1
ORDER BY 1;

-- Total Pengguna Bedasarkan Jenis Kelamin
SELECT
  payCardSex JenisKelamin,
  COUNT(payCardID) TotalPengguna
FROM `project-423513.Transjakarta.Transjakarta`
GROUP BY 2;

-- Total Pengguna Berdasarkan Kategori Umur
SELECT
  CASE
    WHEN 2023 - payCardBirthDate < 5 THEN "BABY"
    WHEN 2023 - payCardBirthDate >= 5 AND 2023 - payCardBirthDate <= 9 THEN "YOUNG"
    WHEN 2023 - payCardBirthDate >= 10 AND 2023 - payCardBirthDate <= 18 THEN "TEENAGER"
    WHEN 2023 - payCardBirthDate >= 19 AND 2023 - payCardBirthDate <= 59 THEN "ADULT"
    ELSE "SENIOR"
  END AgeCategory,
  COUNT(payCardID) TotalPengguna
FROM `project-423513.Transjakarta.Transjakarta`
GROUP BY 1
ORDER BY 2 DESC;

-- Total Pengguna Berdasarkan Jenis Kartu Pembayaran
SELECT
  payCardBank,
  COUNT(payCardID) TotalPengguna
FROM `project-423513.Transjakarta.Transjakarta`
GROUP BY 1
ORDER BY 2 DESC;

-- Total Pengguna Berdasarkan Nama Koridor
SELECT
  corridorName,
  COUNT(payCardID) TotalPengguna
FROM `project-423513.Transjakarta.Transjakarta`
GROUP BY 1
ORDER BY 2 DESC;

-- Rata-rata Pengguna per Hari
SELECT
  FORMAT_DATE("%A", tapInTime) Day,
  COUNT(payCardID) TotalPengguna
FROM `project-423513.Transjakarta.Transjakarta`
GROUP BY 1;

-- Rata-rata Pengguna per Jam
SELECT
  EXTRACT(HOUR FROM tapInTime) HOUR,
  COUNT(payCardID) TotalPengguna
FROM `project-423513.Transjakarta.Transjakarta`
GROUP BY 1
ORDER BY 1;
