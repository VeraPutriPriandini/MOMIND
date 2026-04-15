import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Pagi",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const Text(
                  "Mama Sarah",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Implementasi Stack & Positioned untuk lencana notifikasi [cite: 1, 18]
            Stack(
              children: [
                const Icon(Icons.notifications_none_outlined, size: 28),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Icon(Icons.favorite, color: Color(0xFFFFB6C1), size: 28),
            const SizedBox(width: 8),
            const Text(
              "MOMIND",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFFFFB6C1),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
