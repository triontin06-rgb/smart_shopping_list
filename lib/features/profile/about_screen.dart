import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Application"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Icon(
              Icons.shopping_bag,
              size: 100,
              color: Colors.deepPurple,
            ),

            SizedBox(height: 20),

            Text(
              "Smart Shopping List",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Aplikasi untuk membantu pengguna mengelola daftar belanja, mencatat riwayat pembelian, dan mendapatkan rekomendasi belanja secara lebih mudah.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}