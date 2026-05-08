import 'package:flutter/material.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/admin_factories_screen.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/admin_home_screen.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/admin_inbox_screen.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/admin_bottom_nav.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const AdminHomeScreen(),
    const AdminFactoriesScreen(),
    const AdminInboxScreen(),
    Scaffold(body: Center(child: Text('Profile'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: AdminBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
