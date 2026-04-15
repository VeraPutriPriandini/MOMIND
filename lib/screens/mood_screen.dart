import 'package:flutter/material.dart';
import '../widgets/mood_stat_card.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF9FA), // Background pink sangat muda
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Header (Bisa dipisah jadi widget tersendiri jika dipakai di banyak tempat)
          const Text(
            "Selamat Pagi",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Mama Sarah",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined, size: 28),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.favorite, color: Color(0xFFFFB6C1), size: 20),
              const SizedBox(width: 5),
              const Text(
                "MOMIND",
                style: TextStyle(
                  color: Color(0xFFFFB6C1),
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
          const Center(
            child: Text(
              "Mood Tracking",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              "Pantau perkembangan emosionalmu",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),

          const SizedBox(height: 20),

          // Section 1: Mood Summary Card (Pink Box)
          const MoodStatCard(),

          const SizedBox(height: 30),
          const Text(
            "Minggu Ini",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          // Section 2: Mood List (History)
          _buildMoodHistoryList(),
        ],
      ),
    );
  }

  Widget _buildMoodHistoryList() {
    // Data dummy sementara, nanti bisa kamu pindahkan ke MoodModel
    final List<Map<String, String>> history = [
      {"hari": "Senin", "status": "Senang", "emoji": "😊"},
      {"hari": "Selasa", "status": "Tenang", "emoji": "😌"},
      {"hari": "Rabu", "status": "Senang", "emoji": "😊"},
      {"hari": "Kamis", "status": "Biasa", "emoji": "😐"},
      {"hari": "Jumat", "status": "Lelah", "emoji": "😔"},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: history.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF0F3), // Pink sangat muda untuk card
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Text(
                history[index]["emoji"]!,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history[index]["hari"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    history[index]["status"]!,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.circle, size: 8, color: Color(0xFFFFB6C1)),
            ],
          ),
        );
      },
    );
  }
}
