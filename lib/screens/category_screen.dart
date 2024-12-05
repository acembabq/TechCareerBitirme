import 'package:flutter/material.dart';

class KategoriScreen extends StatefulWidget {
  @override
  _KategoriScreenState createState() => _KategoriScreenState();
}

class _KategoriScreenState extends State<KategoriScreen> {
  // Kategoriler listesi
  final List<String> categories = [
    "Sana Özel Ürünler"
    "Kadın",
    "Erkek",
    "Moda",
    "Saat & Aksesuar",
    "Elektronik",
    "Anne & Çocuk",
    "Ev & Mobilya",
    "Kozmetik"
  ];

  // Ürünler listesi
  final Map<String, List<String>> products = {
    "Sana Özel Ürünler" : ["Sweatshirt","Dış Giyim"],
    "Kadın": ["Sweat 1", "Sweat 2", "Sweat 3"],
    "Erkek": ["Mont 1", "Mont 2", "Mont 3"],
    "Moda": ["Krem 1", "Krem 2", "Krem 3"],
    "Saat & Aksesuar": ["Tabak 1", "Bardak 2", "Çatal 3"],
    "Elektronik": ["T-Shirt 1", "T-Shirt 2", "T-Shirt 3"],
    "Anne & Çocuk": ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
    "Kozmetik": ["Kazak 1", "Kazak 2", "Kazak 3"],
    "Ev & Mobilya": ["Sandalye 1", "Masa 2", "Dolap 3"],
  };

  // Seçili kategori
  String selectedCategory = "Sana Özel Ürünler";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          width: double.infinity,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: "Marka, ürün veya kategori ara",
              hintStyle: TextStyle(color: Colors.grey.shade500),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: Row(
        children: [

          Container(
            width: 100, // Sol panel genişliği
            color: Colors.white,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                  child: Container(
                    color: selectedCategory == categories[index]
                        ? Colors.orange.shade100
                        : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        categories[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: selectedCategory == categories[index]
                              ? Colors.orange
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey.shade200,
              child: GridView.builder(
                itemCount: products[selectedCategory]!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        products[selectedCategory]![index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0, // Varsayılan aktif sekme
        onTap: (index) {
          // Navigasyon bar tıklama işlemleri
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.shade400,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: "Trendyol Go",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken), label: "Favorilerim"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Sepetim"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Hesabım"),
        ],
      ),
    );
  }
}
