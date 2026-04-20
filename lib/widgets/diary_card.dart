import 'package:flutter/material.dart';
import '../models/mood_model.dart';
import '../screens/diary_detail_screen.dart'; // tambahkan ini

class DiaryCard extends StatelessWidget {
  final MoodModel diary;
  const DiaryCard({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // bikin card bisa diklik
      onTap: () {
        Navigator.push(//pindah halaman ke detail
          context,
          MaterialPageRoute(
            builder: (context) => DiaryDetailScreen(diary: diary),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(diary.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 15),

            Expanded(//mengisi sisa ruangan yg sisa
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diary.hari,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    diary.catatan,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
