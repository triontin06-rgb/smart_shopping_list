import 'package:flutter/material.dart';

class SaranScreen extends StatelessWidget {
  const SaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saran Belanja"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          Card(
            child: ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.orange),
              title: Text("Beli beras 5kg"),
              subtitle: Text("Saran berdasarkan kebutuhan rutin"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.green),
              title: Text("Stok sabun habis"),
              subtitle: Text("Perlu segera dibeli"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.blue),
              title: Text("Tambah sayuran"),
              subtitle: Text("Untuk pola makan sehat"),
            ),
          ),

        ],
      ),
    );
  }
}