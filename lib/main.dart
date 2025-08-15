import 'package:flutter/material.dart';
import 'package:study_club/home.dart';
import 'profile.dart';
import 'riwayat_pembelian.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const Home(title: 'Halaman Home'),
        '/profile': (context) => const MyHomePage(title: 'Halaman Profile'),
        '/riwayat': (context) => const RiwayatPembelian(title: 'Riwayat Pembelian'),
      },
    );
  }
}

