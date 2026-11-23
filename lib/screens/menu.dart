import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String npm = "25066564066";
  final String nama = "Alfarrel Ersya Balawa";
  final String kelas = "PBP E";

  final List<ItemHomepage> items = const [
    ItemHomepage("Lihat Proyek & Pengalaman", Icons.folder, Color(0xFF1976D2)), // Biru
    ItemHomepage("Tambah Proyek", Icons.add_circle, Color(0xFF2E7D32)), // Hijau
    ItemHomepage("Tambah Pengalaman", Icons.work_outline, Color(0xFF6A1B9A)),
    ItemHomepage("Logout", Icons.logout, Color(0xFFD32F2F)), // Merah
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman (AppBar, Drawer, Body, SnackBar).
    return Scaffold(
      // AppBar menampilkan bar bagian atas halaman aplikasi.
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Menambahkan drawer navigasi samping pada halaman utama.
      drawer: const LeftDrawer(),
      // Body halaman utama dengan padding di sekelilingnya dan dukungan scroll defensif.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Baris horizontal untuk menampilkan 3 InfoCard secara sejajar dengan tinggi seragam.
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: InfoCard(title: 'NPM', content: npm)),
                    const SizedBox(width: 8.0),
                    Expanded(child: InfoCard(title: 'Name', content: nama)),
                    const SizedBox(width: 8.0),
                    Expanded(child: InfoCard(title: 'Class', content: kelas)),
                  ],
                ),
              ),

              const SizedBox(height: 16.0),

              // Bagian tengah: pesan sambutan dan kisi tombol menu portofolio.
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Selamat datang di MyPortfolio Mobile!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    // GridView menampilkan kartu tombol dalam tata letak kisi 2x2 yang proporsional.
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 480),
                      child: GridView.count(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        crossAxisCount: 2,
                        childAspectRatio: 1.35,
                        // shrinkWrap agar ukuran kisi menyesuaikan tinggi konten anak.
                        shrinkWrap: true,
                        children: items.map((ItemHomepage item) {
                          return ItemCard(item);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan judul (title) dan isi (content).
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Memberikan efek bayangan kartu elevasi 2 unit.
      elevation: 2.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        // Menyusun teks title dan content secara vertikal.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
