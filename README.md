# 📦 Sistem Informasi Sarana Prasarana Inventaris Barang Sekolah

Sistem informasi sederhana untuk mengelola data inventaris barang di lingkungan sekolah.  
Dibuat menggunakan **PHP Native** tanpa framework, cocok untuk kebutuhan internal seperti sekolah menengah (SMA ISR).

---

## 🚀 Fitur Utama

- Sarpras (barang, barang elektronik, dsb)
- Master (kategori, merek, dsb)
- CRUD data
- Scan QR untuk detail barang elektronik
- Laporan barang 
- Sistem login hanya untuk admin

---

## 🖼️ Preview

<p align="center">
  <img src="screenshots/image.png" alt="Preview aplikasi">
</p>

---

## ⚙️ Teknologi yang Digunakan

- **Bahasa:** PHP, HTML, CSS, JavaScript
- **Database:** MySQL
- **Tool:** XAMPP (Apache & MySQL)

---

## 🛠️ Cara Menjalankan Aplikasi

1. Clone atau download repo ini
2. Ekstrak folder ke direktori `htdocs` (jika pakai XAMPP)
3. Import database dari file `db_sisarpras.sql` ke phpMyAdmin
4. Konfigurasi koneksi database di file `config/conn.php`
5. Jalankan di browser:  
   `http://localhost/nama_folder/`

---

## 🔐 Login Dummy
```txt
Username: admin
Password: admin123
