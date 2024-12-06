import 'package:flutter/material.dart';

/*
* Anasayfada bulunan kategori butonu
* Bütün kategorileri listeler
* Her bir kategori için alt kategorileri gösterir
* */


class CategoryButtonScreen extends StatefulWidget {
  @override
  _CategoryButtonScreenState createState() => _CategoryButtonScreenState();
}

class _CategoryButtonScreenState extends State<CategoryButtonScreen> {

  // Kategoriler listesi
  final List<String> categories = [
    "Sana Özel Ürünler",
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
    "Sana Özel Ürünler": ["Sweatshirt", "Dış Giyim", "Cilt Bakım", "Sofra & Mutfak", "İç Giyim", "Sneaker","Pantolon","Ev Tekstili", "Kazak", "Mobilya","Elektrikli Ev Aletleri","Gaming Laptop","Telefon","Oyun Kolu"],
    "Kadın": ["Sweat 1", "Sweat 2", "Sweat 3"],
    "Erkek": ["Mont 1", "Mont 2", "Mont 3"],
    "Moda": ["Krem 1", "Krem 2", "Krem 3"],
    "Saat & Aksesuar": ["Tabak 1", "Bardak 2", "Çatal 3"],
    "Elektronik": ["T-Shirt 1", "T-Shirt 2", "T-Shirt 3"],
    "Anne & Çocuk": ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
    "Kozmetik": ["Kazak 1", "Kazak 2", "Kazak 3"],
    "Ev & Mobilya": ["Sandalye 1", "Masa 2", "Dolap 3"],
  };

  String selectedCategory = "Sana Özel Ürünler";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: SizedBox(
          width: double.infinity,
          height: 45,
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(12),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                hintText: "Marka, ürün veya kategori ara",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          // Sol panel
          Container(
            width: 130,
            color: Colors.grey.shade200,
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
                        : Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        categories[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: selectedCategory == categories[index]
                              ? Colors.orange
                              : Colors.grey.shade700,
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
              color: Colors.white,
              //İçerik Bölümü
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Popüler Kategoriler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: products[selectedCategory]?.length ?? 0,//Null check operator used on a null value hatası
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){},
                        child: Container(
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
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
