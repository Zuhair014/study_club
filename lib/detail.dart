import 'package:flutter/material.dart';

class detailProduk extends StatelessWidget {
  final String nama;
  final String gambar;
  final int harga;
  // ignore: non_constant_identifier_names
  final String detail;
  const detailProduk
  ({super.key, 
  required this.nama,
  required this.gambar,
  required this.harga,
  required this.detail,
  // ignore: non_constant_identifier_names
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), actions: const [],),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      gambar,
                      width: 400.0,
                      height: 400.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10.0),
                    Text(nama, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Text(harga.toString(), style: const TextStyle(fontSize: 22.0, color: Colors.green)),
                    const SizedBox(height: 10.0),
                    const Text('Deskripsi', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6.0),
                    Text(detail, style: const TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}