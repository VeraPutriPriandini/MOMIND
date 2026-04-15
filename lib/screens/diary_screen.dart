import 'package:flutter/material.dart';
import '../models/mood_model.dart';
import '../widgets/diary_card.dart';
import '../widgets/diary_form_card.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  // Requirement: Minimal 5-10 Dummy Data
  final List<MoodModel> diaries = MoodModel.generateDummy();

  void _handleSave(String text) {
    setState(() {
      // Requirement: setState untuk update list
      diaries.insert(
        0,
        MoodModel(hari: "Senin, 13 April 2026", emoji: "😊", catatan: text),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil Disimpan!"),
        backgroundColor: Color(0xFFFFB6C1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFFFF9FA,
      ), // Latar belakang pink sangat muda
      body: SafeArea(
        // Requirement: SafeArea
        child: ListView(
          // Requirement: Parent Scroll agar tidak overflow
          padding: const EdgeInsets.all(20),
          children: [
            // Header (Bisa disesuaikan dengan komponen Header Home kamu)
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
            const Text(
              "MOMIND",
              style: TextStyle(
                color: Color(0xFFFFB6C1),
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Diary Bunda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                "Tulis perasaan dan momenmu hari ini",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),

            const SizedBox(height: 25),

            // Section 1: Form (Modular)
            DiaryFormCard(onSave: _handleSave),

            const SizedBox(height: 30),
            const Text(
              "Catatan Sebelumnya",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Section 2: List (ListView.builder)
            ListView.builder(
              shrinkWrap: true, // Biar bisa masuk di dalam parent ListView
              physics:
                  const NeverScrollableScrollPhysics(), // Scroll diatur parent
              itemCount: diaries.length,
              itemBuilder: (context, index) => DiaryCard(diary: diaries[index]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
