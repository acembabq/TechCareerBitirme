import 'package:flutter/material.dart';

/*
* Kullanıcılar bu sekmede Listelerini ve kaydettiği diğer listeleri görebilir
* */

class KoleksiyonlarimTab extends StatefulWidget {
  @override
  _KoleksiyonlarimTabState createState() => _KoleksiyonlarimTabState();
}

class _KoleksiyonlarimTabState extends State<KoleksiyonlarimTab> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton("Listelerim", 0),
                _buildTabButton("Kaydettiklerim", 1),
              ],
            ),
          ),
        ),
      ),
      body: _selectedTabIndex == 0
          ? _buildListelerimContent()
          : _buildKaydettiklerimContent(),
    );
  }

  Widget _buildTabButton(String text, int index) {
    final bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade500,
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.orange : Colors.grey.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildListelerimContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 100, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            "Liste Bulunamadı",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.grey.shade700),
          ),
          SizedBox(height: 8),
          Text(
            "Beğendiğin ürünleri gruplayarak listelerine kaydet, arkadaşlarınla paylaş!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600,fontSize: 20),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              child: Container(
                height: 65,
                width: double.infinity,
                color: Colors.orange.shade700,
                child: Center(
                    child: Text(
                      "Liste Oluştur",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKaydettiklerimContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border, size: 100, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            "Kaydettiklerim",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.grey.shade700),
          ),
          SizedBox(height: 8),
          Text(
            "Seninle paylaşılan, beğendiğin koleksiyonları kaydedebilirsin.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600,fontSize: 20),
          ),
        ],
      ),
    );
  }
}
