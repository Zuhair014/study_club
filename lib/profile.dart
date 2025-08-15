import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Study Club')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void showDialogInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profil Berhasil Diubah'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // tutup dialog
              },
              child: const Text('Tutup'),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.green[300],
        onTap: (index) {
          if (index == 0) Navigator.popAndPushNamed(context, '/');
          if (index == 1) Navigator.popAndPushNamed(context, '/profile');
          if (index == 2) Navigator.popAndPushNamed(context, '/riwayat');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
        ) ,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Center(
              child: Column(
                children: [
                  Text(
                    "profile",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCZlf5lc5tX-0gY-y94pGS0mQdL-D0lCH2OQ&s'),
                    radius: 70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("nama", style: TextStyle(fontSize: 20, color: Colors.grey)),
            const Text("Zuhair", style: TextStyle(fontSize: 25)),
            const Divider(),
            const SizedBox(height: 20),
            const Text("Email", style: TextStyle(fontSize: 20, color: Colors.grey)),
            const Text("zuhair@gmail.com", style: TextStyle(fontSize: 25)),
            const SizedBox(height: 10),
            const Divider(),
            const Text("phone", style: TextStyle(fontSize: 20, color: Colors.grey)),
            const Text("08123456789", style: TextStyle(fontSize: 25)),
            const Divider(),
            const SizedBox(height: 20),
            const Text("About me", style: TextStyle(fontSize: 20, color: Colors.grey)),
            const Text("l", style: TextStyle(fontSize: 25)),
            const Divider(),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                showDialogInfo(context);
              },
              child: const Text('Ubah Profil '),
            ),
          ],
        ),
      ),
    );
  }
}
