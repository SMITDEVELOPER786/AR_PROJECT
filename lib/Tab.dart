import 'package:flutter/material.dart';
import 'package:play_iq/Home/home.dart';
import 'package:play_iq/Scan/detectingBlocks.dart';
import 'package:play_iq/Settings/view/setting_screen.dart';

class Hometab extends StatefulWidget {
  @override
  _HometabState createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    BlockDetectionScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE6F2),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFEAE6F2),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "Home", 0),
            _buildScanButton(_onItemTapped),
            _buildNavItem(Icons.settings, "Settings", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 28,
            color: _selectedIndex == index ? Color(0xFF001E62) : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Color(0xFF001E62) : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton(Function(int) onTap) {
    return GestureDetector(
      onTap: () => onTap(1),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF001E62),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
      ),
    );
  }
}
