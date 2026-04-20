import 'package:flutter/material.dart';
import '../models/mood_model.dart';

class DiaryDetailScreen extends StatelessWidget {
  final MoodModel diary;

  const DiaryDetailScreen({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//kembali, mendeteksi karena menggunakan navigasi push sebelumnya
        title: const Text("Detail Catatan"),
        backgroundColor: const Color(0xFFFFB6C1),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emoji besar
            Center(
              child: Text(diary.emoji, style: const TextStyle(fontSize: 60)),
            ),

            const SizedBox(height: 20),

            // Tanggal
            Text(
              diary.hari,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 10),

            // Isi lengkap catatan
            Text(
              diary.catatan,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
