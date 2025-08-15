import 'package:flutter/material.dart';

class RiwayatPembelian extends StatelessWidget {
  const RiwayatPembelian({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Riwayat Pembelian'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.green[300],
        onTap: (index) {
          if (index == 0) Navigator.popAndPushNamed(context, '/');
          if (index == 1) Navigator.popAndPushNamed(context, '/profile');
          if (index == 2) Navigator.popAndPushNamed(context, '/riwayat');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Iphone 12'),
            subtitle: Text('Rp 11.000.000 - 12 Juli 2024'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('PlayStation 5'),
            subtitle: Text('Rp 8.000.000 - 10 Juli 2024'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(),
          // ...tambahkan item lain jika perlu...
        ],
      ),
    );
  }
}
