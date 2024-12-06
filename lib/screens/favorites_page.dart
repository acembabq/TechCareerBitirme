import 'package:flutter/material.dart';

import '../tabs/my_collections_tab.dart';
import '../tabs/my_favorites_tab.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey.shade500,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: "Favorilerim"),
              Tab(text: "Koleksiyonlarım"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FavorilerimTab(),
            KoleksiyonlarimTab(),
          ],
        ),
      ),
    );
  }
}





