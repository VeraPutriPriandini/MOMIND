import 'package:flutter/material.dart';
import '../widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data minimal 10 item [cite: 1, 22]
    final List<Map<String, String>> tipsData = List.generate(
      10,
      (index) => {
        "title": "Tips Bunda #${index + 1}",
        "category": index % 2 == 0 ? "Beauty" : "Wellness",
        "desc": "Cara praktis mengelola waktu di sela kesibukan...",
      },
    );

    return Scaffold(
      body: SafeArea(
        // Mencegah layout terpotong [cite: 1, 13]
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const HomeHeader(),
            const SizedBox(height: 25),

            // Card Check-in Harian
            _buildCheckInCard(context),

            const SizedBox(height: 25),
            const Text(
              "Pengingat Hari Ini",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Section Pengingat (Card kustom) [cite: 1, 23]
            _buildReminderCard(),

            const SizedBox(height: 25),
            const Text(
              "Tips & Trick untuk Bunda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // GridView builder 2 kolom [cite: 1, 21]
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tipsData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) => _buildTipItem(tipsData[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckInCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFB6C1),
        borderRadius: BorderRadius.circular(25), // Border radius [cite: 1, 19]
      ),
      child: Column(
        children: [
          const Text(
            "Bagaimana perasaanmu hari ini?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ["😊", "😌", "😔", "😰"]
                .map(
                  (emoji) => InkWell(
                    onTap: () {
                      // Karena halaman checkin gausah dibuat dulu, kasih feedback snackbar saja
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Mood $emoji terpilih!")),
                      );
                    },
                    child: Text(emoji, style: const TextStyle(fontSize: 32)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.pink.shade100),
      ),
      child: const ListTile(
        leading: Text("😊", style: TextStyle(fontSize: 24)),
        title: Text(
          "Belum check-in mood hari ini, yuk luangkan waktu!",
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildTipItem(Map<String, String> data) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack untuk overlay label kategori di atas gambar [cite: 1, 18]
          Stack(
            children: [
              Container(
                height: 90,
                color: Colors.pink.shade50,
                width: double.infinity,
                child: const Icon(Icons.image, color: Colors.pinkAccent),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    data['category']!,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
