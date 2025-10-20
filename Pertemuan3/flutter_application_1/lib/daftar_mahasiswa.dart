import 'package:flutter/material.dart';

class DaftarMahasiswaPage extends StatelessWidget {
  const DaftarMahasiswaPage({super.key});

  // --- Data dummy mahasiswa
  final List<Map<String, String>> dataMahasiswa = const [
    {
      "nama": "Alifia Nur Huda",
      "npm": "23005",
      "prodi": "Sistem Informasi",
      "email": "alifia@gmail.com",
      "alamat": "Jl H. Carum, Karawang",
      "tglLahir": "24 Juni 2010",
      "foto": "https://picsum.photos/200?random=1"
    },
    {
      "nama": "Nur Huda Alifia",
      "npm": "23006",
      "prodi": "Informatika",
      "email": "nur@gmail.com",
      "alamat": "Jl. Sudirman No. 45, Bandung",
      "tglLahir": "10 Januari 2005",
      "foto": "https://picsum.photos/200?random=2"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Mahasiswa")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dataMahasiswa.length,
        itemBuilder: (context, index) {
          final mhs = dataMahasiswa[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Foto mahasiswa
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      mhs["foto"]!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Biodata mahasiswa
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mhs["nama"]!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("NPM: ${mhs["npm"]}"),
                        Text("Prodi: ${mhs["prodi"]}"),
                        Text("Email: ${mhs["email"]}"),
                        Text("Alamat: ${mhs["alamat"]}"),
                        Text("Tanggal Lahir: ${mhs["tglLahir"]}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
