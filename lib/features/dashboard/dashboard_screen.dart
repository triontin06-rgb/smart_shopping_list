import 'package:flutter/material.dart';
import 'package:smart_shopping_list/features/profile/profile_screen.dart';
import 'package:smart_shopping_list/features/checklist/smart_checklist_screen.dart';
import 'package:smart_shopping_list/features/history/history_screen.dart';
import 'package:smart_shopping_list/features/saran/saran_screen.dart';
import 'package:smart_shopping_list/features/kategori/kategori_detail_screen.dart';
import 'package:smart_shopping_list/features/kategori/kategori_screen.dart';
import 'package:smart_shopping_list/services/notification_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _comingSoon(BuildContext context, String pageName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$pageName belum tersedia"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget menuButton(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    Widget? page,
  ) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        } else {
          _comingSoon(context, title);
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }

  Widget categoryCard(
    BuildContext context,
    String title,
    String total,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      onTap: () => _comingSoon(context, title),
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(total),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F4FA),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SmartChecklistScreen(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HistoryScreen(),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: "Checklist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// HEADER
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 28,
                      child: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Halo,"),
                        Text(
                          "Hai, Triontin 👋",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// NOTIFIKASI
                  IconButton(
                    onPressed: () async {
                      await NotificationService.showLocalNotification(
                        title: "Notifikasi",
                        body: "Ini test notifikasi berhasil!",
                      );
                    },
                    icon: const Icon(Icons.notifications_none),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// CARD RINGKASAN
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ringkasan Bulanan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Rp 1.450.000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    LinearProgressIndicator(
                      value: 0.65,
                      minHeight: 10,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "45",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Total",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "34",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Dibeli",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "11",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Sisa",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// MENU
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  menuButton(
                    context,
                    Icons.checklist,
                    "Checklist",
                    Colors.deepPurple,
                    const SmartChecklistScreen(),
                  ),
                  menuButton(
                    context,
                    Icons.history,
                    "Riwayat",
                    Colors.indigo,
                    const HistoryScreen(),
                  ),
                  menuButton(
                    context,
                    Icons.thumb_up_alt_outlined,
                    "Saran",
                    Colors.green,
                    const SaranScreen(),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// REMINDER
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Masih ada 11 barang yang belum dicentang.",
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Kategori Belanja",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const KategoriScreen(),
                        ),
                      );
                    },
                    child: const Text("Lihat Semua"),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.9,
                children: [
                  categoryCard(
                    context,
                    "Makanan & Minuman",
                    "12 Barang",
                    Icons.restaurant,
                    Colors.orange,
                  ),
                  categoryCard(
                    context,
                    "Kebutuhan Rumah",
                    "8 Barang",
                    Icons.home,
                    Colors.teal,
                  ),
                  categoryCard(
                    context,
                    "Perawatan Pribadi",
                    "5 Barang",
                    Icons.face,
                    Colors.purple,
                  ),
                  categoryCard(
                    context,
                    "Kebersihan",
                    "9 Barang",
                    Icons.cleaning_services,
                    Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}