import 'package:flutter/material.dart';
import 'package:trendyol_app/screens/trendyolgo_page.dart';

import 'account_page.dart';
import 'cart_page.dart';
import 'favorites_page.dart';
import 'home_page.dart';

/*
* Kullanıcıların Sayfalar arası geçiş yapabilmesini sağlar
* */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    HomePage(),
    TrendyolGoPage(),
    FavoritesPage(),
    CartPage(),
    AccountPage(),
  ];

  int selectedNavigationIndex = 0;

  void _onBarItemTapped(int index) {
    setState(() {
      selectedNavigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: pages[selectedNavigationIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedNavigationIndex,
        onTap: _onBarItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.shade400,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: "Trendyol Go",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: "Favorilerim",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Sepetim",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: "Hesabım",
          ),
        ],
      ),
    );
  }
}
