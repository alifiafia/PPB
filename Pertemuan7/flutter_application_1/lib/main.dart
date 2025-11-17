import 'package:flutter/material.dart';
import 'pages/daftar_mahasiswa.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io' show Platform; // aman, selama dilindungi kIsWeb
import 'package:flutter/foundation.dart'; // untuk kIsWeb

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktopPlatform()) {
    // Inisialisasi untuk desktop (Windows, macOS, atau Linux)
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

bool isDesktopPlatform() {
  // Jika web → langsung false (menghindari error Platform)
  if (kIsWeb) return false;

  return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const DaftarMahasiswaPage(),
    );
  }
}
