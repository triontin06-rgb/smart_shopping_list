import 'package:flutter/material.dart';
import 'kategori_detail_screen.dart';

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({super.key});

  final List<Map<String, dynamic>> kategori = const [
    {"nama": "Makanan & Minuman", "icon": Icons.restaurant, "color": Colors.orange},
    {"nama": "Kebutuhan Rumah", "icon": Icons.home, "color": Colors.teal},
    {"nama": "Perawatan Pribadi", "icon": Icons.face, "color": Colors.purple},
    {"nama": "Kebersihan", "icon": Icons.cleaning_services, "color": Colors.blue},
    {"nama": "Olahraga", "icon": Icons.sports, "color": Colors.pink},
    {"nama": "Obat-obatan", "icon": Icons.medical_services, "color": Colors.yellow},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kategori")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          final item = kategori[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: item["color"].withOpacity(0.2),
              child: Icon(item["icon"], color: item["color"]),
            ),
            title: Text(item["nama"]),
            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryDetailScreen(
                    title: item["nama"],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}