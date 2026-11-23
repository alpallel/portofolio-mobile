# MyPortfolio Mobile

## LOCAL SETUP GUIDE

- Clone repository & go to directory:
    ```bash
    git clone https://github.com/alpallel/portofolio-mobile.git
    cd portofolio-mobile
    ```

- Install dependencies:
    ```bash
    flutter pub get
    ```

- Run it locally:
    ```bash
    flutter run
    ```

## Tugas

### Tugas 7

1. *Widget tree* adalah struktur pohon hierarkis yang terbentuk dari komposisi widget-widget yang saling bersarang untuk membangun antarmuka aplikasi Flutter. Hubungan *parent-child* bekerja dengan prinsip *parent* meneruskan batasan ukuran (*constraints*) ke bawah ke *child*, lalu *child* menentukan ukurannya di dalam batasan tersebut sebelum *parent* mengatur posisinya di layar.

2. Widget yang digunakan dalam proyek ini:
   - MyApp & MaterialApp (`lib/main.dart`): Root widget aplikasi yang mengonfigurasi tema (ThemeData), judul, dan halaman awal.
   - MyHomePage, InfoCard, dan ItemCard (`lib/menu.dart`): Widget kustom (StatelessWidget) untuk halaman menu utama, kartu informasi identitas, dan kartu tombol aksi.
   - Scaffold dan AppBar: Menyediakan kerangka halaman Material beserta judul di bagian atas.
   - SingleChildScrollView, Padding, Center, dan SizedBox: Mengatur scroll vertikal agar tidak overflow, jarak tepi, pemusatan, dan spasi antar elemen.
   - Column, Row, IntrinsicHeight, dan Expanded: Menyusun widget secara vertikal maupun horizontal serta menyamakan tinggi dan membagi lebar ketiga InfoCard secara merata.
   - Card, Container, Material, dan InkWell: Membentuk tampilan kartu, mengatur warna latar tombol, dan menangkap sentuhan pengguna dengan efek ripple.
   - GridView.count, Icon, Text, dan SnackBar: Menampilkan menu dalam 3 kolom berisi ikon dan teks, dan memunculkan message saat tombol ditekan.

3. MaterialApp adalah widget yang menyediakan konfigurasi Material Design seperti tema (ThemeData), navigasi, arah teks, dan dukungan ScaffoldMessenger. Widget ini umumnya digunakan sebagai root widget, agar seluruh halaman dan komponen di bawahnya otomatis mewarisi tema dan konteks yang seragam.

4. StatelessWidget bersifat immutable dan tidak menyimpan state internal yang berubah, sedangkan StatefulWidget memiliki objek State yang bersifat mutable dan dapat membangun ulang UI lewat `setState()`.

   - `StatelessWidget` untuk tampilan statis yang hanya bergantung pada data awal seperti MyHomePage, InfoCard, dan ItemCard. 

   - `StatefulWidget` untuk komponen yang datanya berubah secara interaktif seperti form atau counter.

5. BuildContext adalah referensi lokasi suatu widget di dalam widget tree yang dipakai untuk mengakses ancestor widget di atasnya. Di dalam metode `build(BuildContext context)`, `context` digunakan untuk mengambil konfigurasi atau layanan terdekat.

6. Hot reload mengaplikasikan perubahan kode Dart ke VM yang sedang berjalan tanpa menghilangkan state aplikasi, sedangkan hot restart menjalankan ulang aplikasi dari `main()` sehingga seluruh state direset ke awal. Hot reload saja tidak cukup dan perlu hot restart ketika mengubah `main()`, variabel global/statis, atau `initState()`, sementara full restart dibutuhkan saat mengubah aset di `pubspec.yaml`, menambah plugin native baru, atau mengubah folder native (`android/`/`ios/`).

### Tugas 8

1. Navigator.push() menaruh halaman baru diatas halaman aktif sehingga user bisa kembali lewat tombol back. Navigator.pushReplacement() mengganti halaman aktif di stack dengan halaman baru. Navigator.pop() menutup halaman di paling atas stack untuk kembali ke halaman sebelumnya.

    project_card.dart memakai Navigator.push() agar user dapat kembali ke menu utama dari halaman formulir. Di left_drawer.dart, opsi Halaman Utama memakai Navigator.pushReplacement() untuk mengganti halaman aktif langsung dengan MyHomePage() tanpa push stack navigasi.

2. Scaffold memberikan kerangka tata letak standar yang sama di setiap layar, dengan AppBar sebagai judul konsisten di bagian atas dan LeftDrawer pada properti drawer supaya menu navigasi mudah diakses.

    Warna primer `ColorScheme.fromSeed(seedColor: Colors.indigo)` dari MaterialApp dipakai ulang lewat `Theme.of(context).colorScheme.primary` pada AppBar di menu.dart, project_form.dart, dan experience_form.dart. serta pada DrawerHeader dan tombol Simpan.

3. Tata letak Vertical Column di dalam SingleChildScrollView dipilih agar setiap input form mudah dibaca dan diisi secara berurutan. Saat ruang layar menyempit, Padding menjaga jarak antar-input tetap rapi sementara SingleChildScrollView memungkinkan halaman digulir sehingga tidak terjadi overflow.

4. Saat tombol Simpan ditekan, GlobalKey<FormState> memberi akses ke state Form agar _formKey.currentState!.validate() dapat menjalankan seluruh fungsi validator pada tiap field; jika ada input yg invalid, error message akan muncul dan penyimpanan form dibatalkan. Contoh nilai yang ditolak adalah "example.com" pada field URL, karena tidak diawali http:// atau https://. 
    
    Memilih jenis papan ketik saja belum cukup, karena itu hanya mengatur tampilan tombol keyboard, bukan memaksa aturan data pengguna tetap bisa mengosongkan input, mengetik format salah, atau melakukan paste teks sembarang.


## AI Disclosure
Saya memakai Gemini AI untuk membantu saya memahami dan belajar struktur proyek Flutter dan kode Dart, serta bugfixing.
