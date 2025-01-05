import 'package:flutter/material.dart';

BottomNavigationBar FooterBar() {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
    // currentIndex: _selectedIndex,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    backgroundColor: Colors.red,
    // onTap: _onBottomNavTapped,
  );
}
