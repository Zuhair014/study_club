import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

class Home
    extends
        StatefulWidget {
  const Home({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<
    Home
  >
  createState() => _MyHome();
}

class _MyHome
    extends
        State<
          Home
        > {
  String kategoriAwal = "Semua";
  final List<
    Map<
      String,
      dynamic
    >
  >
  listproduct = [
    {
      "nama": "Iphone 12",
      "harga": "11.000.000",
      "gambar": "https://images-cdn.ubuy.co.in/66292c9d2df83775d679582f-pre-owned-apple-iphone-12-carrier.jpg",
      "detail": "Iphone 12 adalah smartphone yang dirilis oleh Apple pada tahun 2020. Dikenal dengan desainnya yang elegan, layar Super Retina XDR, dan performa yang kuat berkat chip A14 Bionic. Memiliki kamera ganda dengan kemampuan fotografi yang canggih, serta dukungan untuk jaringan 5G.",
      "kategori": "Handphone",
    },
    {
      "nama": "PlayStation 5",
      "harga": "8.000.000",
      "gambar": "https://whatnot.in/wp-content/uploads/2023/08/playstation-5-horizontal-product-shot-01-ps5-en-23nov20-scaled.webp",
      "detail": "PlayStation 5 adalah konsol game generasi terbaru dari Sony, dirilis pada November 2020. Dikenal dengan performa grafis yang mengesankan, kecepatan loading yang cepat berkat SSD, dan dukungan untuk ray tracing. Memiliki dua varian: versi standar dengan drive disk dan versi digital tanpa drive disk.",
      "kategori": "Elektronik",
    },
    {
      "nama": "Steam Deck",
      "harga": "8.000.000",
      "gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9ee8m0RAkxUJJg5rj1K0vWuB52lzNyT7NXg&s",
      "detail": "Steam Deck adalah handheld gaming device yang dikembangkan oleh Valve. Dikenal dengan kemampuannya untuk menjalankan game PC dengan baik, dilengkapi dengan kontroler yang ergonomis, dan layar OLED yang memukau. Cocok untuk gamer yang ingin bermain di mana saja.",
      "kategori": "Elektronik",
    },
  ];
  @override
  Widget build(
    BuildContext context,
  ) {
    final kategoriTerpilih =
        kategoriAwal ==
            "Semua"
        ? listproduct
        : listproduct
              .where(
                (
                  p,
                ) =>
                    p['kategori'] ==
                    kategoriAwal,
              )
              .toList();

    return BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: Colors.green,
        title: const Text('Home'),
      ),
      backgroundColor: const Color.fromRGBO(
        245,
        239,
        231,
        1,
      ),

      backLayerBackgroundColor: Colors.green[700],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.green[300],
        onTap:
            (
              index,
            ) {
              if (index ==
                  0) {
                Navigator.popAndPushNamed(
                  context,
                  '/',
                );
              }
              if (index ==
                  1) {
                Navigator.popAndPushNamed(
                  context,
                  '/profile',
                );
              }
              if (index ==
                  2) {
                Navigator.popAndPushNamed(
                  context,
                  '/riwayat',
                );
              }
            },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: 'Riwayat',
          ),
        ],
      ),
      backLayer: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(
              12,
            ),
            child: Text(
              "Pilih Kategori",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          for (var kategori in [
            "Semua",
            "Handphone",
            "Elektronik",
            "Laptop & Aksesoris",
          ])
            ListTile(
              title: Text(
                kategori,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              leading:
                  Radio<
                    String
                  >(
                    value: kategori,
                    groupValue: kategoriAwal,
                    onChanged:
                        (
                          val,
                        ) {
                          setState(
                            () {
                              kategoriAwal = val!;
                            },
                          );
                        },
                  ),
            ),
        ],
      ),
      frontLayer: ListView(
        padding: const EdgeInsets.all(
          25,
        ),
        children: [
          const Text(
            'Rekomendasi',
            style: TextStyle(
              fontFamily: 'Google Sans',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.58,
            children: kategoriTerpilih.map(
              (
                produk,
              ) {
                return ListItem(
                  context: context,
                  nama: produk['nama'],
                  harga: produk['harga'],
                  gambar: produk['gambar'],
                  detail: produk['detail'],
                  kategori: produk['kategori'],
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  Widget ListItem({
    required String nama,
    required String harga,
    required String gambar,
    required String detail,
    required String kategori,
    required BuildContext context,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                  8,
                ),
              ),
              child: Image.network(
                gambar,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: "Google Sans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Rp",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      harga.toString(),
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (
                                _,
                              ) => detailProduk(
                                nama: nama,
                                harga: int.tryParse(harga.replaceAll('.', '')) ?? 0,
                                gambar: gambar,
                                detail: detail,
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          5.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Detail",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}