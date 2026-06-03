import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),

      appBar: AppBar(
        title: const Text("Notifikasi"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// Saran Untukmu
          const Text(
            "Saran Untukmu",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.lightbulb_outline),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Mungkin Anda butuh Susu?\nStok susu biasanya habis dalam 3 hari.",
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Notifikasi list
          _notifTile(
            icon: Icons.notifications,
            title: "Jangan lupa belanja!",
            subtitle: "Masih ada 5 item tersisa",
            time: "10 mnt lalu",
          ),

          _notifTile(
            icon: Icons.notifications,
            title: "Update Daftar Bersama",
            subtitle: "Budi menambahkan item baru",
            time: "2 jam lalu",
          ),

          _notifTile(
            icon: Icons.notifications,
            title: "Promo Supermarket",
            subtitle: "Diskon 20% hari ini",
            time: "5 jam lalu",
          ),

          _notifTile(
            icon: Icons.notifications,
            title: "Jadwal Belanja Rutin",
            subtitle: "Waktunya isi ulang stok",
            time: "Kemarin",
          ),
        ],
      ),
    );
  }

  Widget _notifTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade50,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          time,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}