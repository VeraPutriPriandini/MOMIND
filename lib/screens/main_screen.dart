import 'package:flutter/material.dart'; // Mengimpor library utama Flutter untuk membuat UI.
import 'home_screen.dart'; // Mengimpor halaman Home.
import 'diary_screen.dart'; // Mengimpor halaman Diary.
import 'mood_screen.dart'; // Mengimpor halaman Mood.
import 'profile_screen.dart'; // Mengimpor halaman Profil.

// MainScreen menggunakan StatefulWidget karena perlu menyimpan data yang bisa berubah (halaman aktif).
class MainScreen extends StatefulWidget {
  const MainScreen({super.key}); // Constructor dengan key opsional.

  @override
  State<MainScreen> createState() => _MainScreenState(); // Menghubungkan ke class state.
}

// Class state yang menyimpan logika dan data halaman.
class _MainScreenState extends State<MainScreen> {
  // Variabel untuk menyimpan index halaman yang sedang aktif.
  // Default = 0 artinya halaman pertama (Home).
  int _currentIndex = 0;

  // List berisi semua halaman yang bisa ditampilkan.
  final List<Widget> _pages = [
    const HomeScreen(), // Index 0 → Halaman Home.
    const Center(
      child: Text("Halaman Check-in (Proses)"), // Placeholder sementara.
    ), // Index 1 → Check-in (belum dibuat).
    const DiaryScreen(), // Index 2 → Halaman Diary.
    const MoodScreen(), // Index 3 → Halaman Mood.
    const ProfileScreen(), // Index 4 → Halaman Profil.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Kerangka utama halaman.

      // SafeArea agar konten tidak tertutup notch atau sistem UI HP.
      body: SafeArea(
        // Menampilkan halaman sesuai index yang aktif.
        // Misalnya _currentIndex = 2 → tampil DiaryScreen.
        child: _pages[_currentIndex],
      ),

      // Navigasi menu di bagian bawah layar.
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          // Menentukan menu mana yang sedang aktif (berwarna).

          // Fungsi saat user menekan salah satu menu.
          onTap: (index) => setState(() => _currentIndex = index),

          // Saat diklik:
          // 1. Ambil index menu yang dipilih
          // 2. Simpan ke _currentIndex
          // 3. setState() memicu UI untuk diperbarui
          // 4. Halaman langsung berubah
          type: BottomNavigationBarType.fixed,

          // Menjaga semua icon dan label tetap tampil (tidak shifting).
          selectedItemColor: Colors.pinkAccent,

          // Warna icon saat dipilih (aktif).
          unselectedItemColor: Colors.grey,
          // Warna icon saat tidak dipilih.

          // Daftar menu navigasi bawah.
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home", // Menu Home.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stars_outlined),
              label: "Check-in", // Menu Check-in.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: "Diary", // Menu Diary.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Mood", // Menu Mood.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profil", // Menu Profil.
            ),
          ],
        ),
      ),
    );
  }
}
