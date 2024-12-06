import 'package:flutter/material.dart';

/*
* Sepetim sayfası kullanıcının daha önceden sepete eklediği verileri içermektedir
* Veriler statiktir
* Kaydırılabilir bir ürün kategori listesi bulunmaktadır
* */


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Sepetim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(75)),
                child: Icon(
                  Icons.remove_shopping_cart,
                  size: 80,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10),
            child: Center(
              child: Text(
                "Sepetim",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Text(
              "Sepetinizde ürün bulunmamaktadır",
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              child: Container(
                height: 65,
                width: double.infinity,
                color: Colors.orange.shade700,
                child: Center(
                    child: Text(
                  "Alışverişe Devam Et",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton(
                      "Önceden Eklediklerim (16)", Icons.history, 0),
                  _buildCategoryButton("Tekrar Satın Al (3)", Icons.refresh, 1),
                  _buildCategoryButton("Favorilerim", Icons.favorite, 2),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                _buildProductCard(
                  "Safka Katil Civciv Yastık",
                  "40x35cm Peluş Yastık",
                  "169.99 TL",
                  "Hızlı Teslimat",
                  "https://cdn.dsmcdn.com/mnresize/400/-/ty1521/product/media/images/prod/QC/20240903/14/e50b130b-b585-39cf-9c68-dbf29c89c86e/1_org_zoom.jpg",
                ),
                _buildProductCard(
                  "Arctic Hunter",
                  "B00530 15.6'' Siyah Çanta",
                  "349.99 TL",
                  "Hızlı Teslimat",
                  "https://productimages.hepsiburada.net/s/777/375-375/110000743122320.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Kategoriler için buton tasarımı
  Widget _buildCategoryButton(String title, IconData icon, int index) {
    final isSelected = selectedCategoryIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            selectedCategoryIndex = index;
          });
        },
        icon: Icon(icon, color: isSelected ? Colors.white : Colors.orange),
        label: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.orange),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.orange : Colors.white,
          side: BorderSide(color: Colors.orange),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(String title, String description, String price,
      String deliveryInfo, String imagePath) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      child: Image.network(imagePath),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    deliveryInfo,
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 30),
                      Text(
                        price,
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 20,
            child: Icon(Icons.menu),
          ),
          Positioned(
            bottom: 8,
            right: 12,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sepete Ekle",
                style: TextStyle(color: Colors.orange),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.orange, width: 2))),
            ),
          ),
        ],
      ),
    );
  }
}
