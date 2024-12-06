import 'package:flutter/material.dart';

/*
* Kullanıcılar bu sekmede favoriledikleri ürünleri görebilir
* */

class FavorilerimTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Arama Çubuğu ve Ürün Seç Butonu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(color: Colors.grey.shade100),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIconColor: Colors.orange,
                          hintText: "Marka, ürün, kategori ara",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100)),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Ürün Seç",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                              color: Colors.grey.shade300, width: 1)),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryButton("Flaş Ürünler"),
                  CategoryButton("Fiyatı Düşenler"),
                  CategoryButton("Kuponlar"),
                  CategoryButton("Çok Satanlar"),
                  CategoryButton("Yeni Gelenler"),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ProductCard(
                    "https://img.pzrmcdn.com/mnresize/716/716/asset/6972185560436/images/24ghzkablosuziftkolretrooyunlar4kfullhdtvgamestick20000oyunkonsoluatari-1.jpg",
                    "Teknoloji Gelsin - Gaming Atari",
                    3.8,
                    1503,
                    "638 TL",
                  ),
                  ProductCard(
                    "https://percdn.com/f/721893/cG96WmFta3QrNjQrTm53Z1RvTnE/p/MR9116_00_image01.webp",
                    "Mark Ryden - Sırt Çantası",
                    4.4,
                    5,
                    "2299 TL",
                  ),
                  ProductCard(
                    "https://cdn.dsmcdn.com/ty1450/product/media/images/prod/QC/20240730/13/8d059111-35a9-39c4-a83a-26c0b6366e10/1_org.jpg",
                    "3art Metal - Kol Tutucu",
                    4.3,
                    193,
                    "293 TL",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget ProductCard(
    String imageUrl, String title, double rating, int reviews, String price) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Container(
        height: 280,
        child: Stack(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(8.0),
              leading: Container(
                width: 120,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text("$rating ($reviews)"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(price, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.menu, color: Colors.black),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Sepete Ekle",
                  style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget CategoryButton(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(color: Colors.grey.shade200), // Border color
        foregroundColor: Colors.black, // Text color set to black
      ),
    ),
  );
}
