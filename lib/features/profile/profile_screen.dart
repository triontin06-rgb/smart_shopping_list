import 'package:flutter/material.dart';
import 'package:smart_shopping_list/features/auth/login_screen.dart';
import 'package:smart_shopping_list/features/profile/about_screen.dart';
import 'package:smart_shopping_list/features/profile/edit_profile_screen.dart';
import 'package:smart_shopping_list/features/notification/notification_page.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.black : const Color(0xFFF7F4FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// HEADER
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xFF5E35B1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Smart Shopping",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E35B1),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// FOTO PROFIL
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.deepPurple.shade100,
                        width: 4,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 80,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor:
                          const Color(0xFF5E35B1),
                      radius: 25,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const EditProfileScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                "Triontin",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "triontin06@gmail.com",
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode
                      ? Colors.white70
                      : Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              /// EDIT PROFILE
              _menuTile(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const EditProfileScreen(),
                    ),
                  );
                },
              ),

              /// DARK MODE
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: SwitchListTile(
                  secondary: const Icon(
                    Icons.dark_mode_outlined,
                  ),
                  title: const Text("Dark Mode"),
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
              ),

              /// NOTIFIKASI
              _menuTile(
                icon: Icons.notifications_none,
                title: "Notification Settings",
                onTap: () {
                  print("CLICK NOTIF");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                },
              ),

              /// ABOUT
              _menuTile(
                icon: Icons.info_outline,
                title: "About Application",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const AboutScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              /// LOGOUT
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: isDarkMode
                      ? Colors.white70
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              Colors.deepPurple.shade50,
          child: Icon(
            icon,
            color: const Color(0xFF5E35B1),
          ),
        ),
        title: Text(title),
        trailing:
            const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}