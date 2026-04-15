import 'package:flutter/material.dart';

class DiaryFormCard extends StatefulWidget {
  final Function(String) onSave;
  const DiaryFormCard({super.key, required this.onSave});

  @override
  State<DiaryFormCard> createState() => _DiaryFormCardState();
}

class _DiaryFormCardState extends State<DiaryFormCard> {
  final _formKey = GlobalKey<FormState>(); // Requirement: GlobalKey
  final _controller = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Requirement: Validasi tidak kosong
      widget.onSave(_controller.text);
      _controller.clear();
      FocusScope.of(context).unfocus(); // Menutup keyboard
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFFFB6C1),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Catatan Baru",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Senin, 13 April 2026",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _controller,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Apa yang ingin kamu ceritakan hari ini?",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFF0F3).withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFB6C1),
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFB6C1),
                      width: 0.5,
                    ),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? "Tulis ceritamu dulu ya Bun"
                    : null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB6C1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Simpan Catatan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
