import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_outline, size: 64, color: Color.fromARGB(255, 253, 165, 234)),
              SizedBox(height: 16),
              Text(
                'Aplikasi Demo Flutter\nMenu Drawer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'Versi 1.0.0\n\n'
                'Aplikasi ini dibuat untuk tugas Pemrograman Perangkat Bergerak.\n'
                'Fitur:\n'
                '- Form input data mahasiswa\n'
                '- Daftar mahasiswa\n'
                '- Menu navigasi Drawer\n'
                '- Halaman pengaturan\n\n'
                'Dikembangkan oleh Hafshah.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}