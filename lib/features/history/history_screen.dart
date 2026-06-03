import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  Widget historyCard({
    required String bulan,
    required String tanggal,
    required String totalItem,
    required String terbeli,
    required String pengeluaran,
    required bool selesai,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          /// HEADER CARD
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bulan,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Diperbarui $tanggal",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: selesai
                      ? Colors.green.withOpacity(0.15)
                      : Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  selesai ? "Selesai" : "Arsip",
                  style: TextStyle(
                    color: selesai ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// BOX INFO
          Row(
            children: [
              Expanded(child: _box("Total", totalItem)),
              const SizedBox(width: 10),
              Expanded(child: _box("Terbeli", terbeli)),
              const SizedBox(width: 10),
              Expanded(child: _box("Pengeluaran", pengeluaran)),
            ],
          ),

          const SizedBox(height: 14),

          /// BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.restart_alt),
              label: const Text("Gunakan Kembali"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B4BB6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _box(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B4BB6),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              const Text(
                "Riwayat Belanja",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Lihat dan gunakan kembali daftar belanja sebelumnya.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR (lebih clean)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Cari bulan atau item...",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// LIST HISTORY
              historyCard(
                bulan: "April 2026",
                tanggal: "24 April",
                totalItem: "42",
                terbeli: "42",
                pengeluaran: "Rp 1.2M",
                selesai: true,
              ),

              historyCard(
                bulan: "Maret 2026",
                tanggal: "28 Maret",
                totalItem: "35",
                terbeli: "35",
                pengeluaran: "Rp 980rb",
                selesai: false,
              ),

              historyCard(
                bulan: "Februari 2026",
                tanggal: "25 Februari",
                totalItem: "28",
                terbeli: "24",
                pengeluaran: "Rp 850rb",
                selesai: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}