class MoodModel {
  final String hari;
  final String emoji;
  final String catatan;

  // Constructor named agar bisa dipanggil dengan nama parameter
  MoodModel({
    required this.hari,
    required this.emoji,
    required this.catatan,
  });

  // Fungsi static untuk menghasilkan data dummy (Kebutuhan ETS)
  static List<MoodModel> generateDummy() {
    return [
      MoodModel(
        hari: "Minggu, 12 April", 
        emoji: "😊", 
        catatan: "Hari ini aku berhasil menyelesaikan semua pekerjaan kantor dan masih sempat main sama anak.",
      ),
      MoodModel(
        hari: "Sabtu, 11 April", 
        emoji: "😌", 
        catatan: "Waktu quality time bersama anak sangat menyenangkan. Kami pergi ke taman dan makan es krim.",
      ),
      MoodModel(
        hari: "Jumat, 10 April", 
        emoji: "😔", 
        catatan: "Deadline project bikin capek, tapi untungnya skincare routine tetap jalan agar wajah segar.",
      ),
      MoodModel(
        hari: "Kamis, 09 April", 
        emoji: "😍", 
        catatan: "Senang sekali hari ini dapet kado kecil dari suami, hal-hal kecil yang bikin bahagia.",
      ),
      MoodModel(
        hari: "Rabu, 08 April", 
        emoji: "🥱", 
        catatan: "Hari yang sangat panjang dan melelahkan, rasanya ingin tidur lebih awal malam ini.",
      ),
      MoodModel(
        hari: "Selasa, 07 April", 
        emoji: "😇", 
        catatan: "Sangat bersyukur bisa masak makanan sehat untuk keluarga hari ini, mereka suka sekali.",
      ),
    ];
  }
}