import 'package:flutter/material.dart';
import 'category_button_screen.dart';

/*
*
* Anasayfa işlemleri:
* Üstte arama için TextField kullanıldı
* Kategoriler için bir listeden ListView.builder kullanılarak listelendi
* Hizmetler kısmı Row yapısıyla yazıldı
* Sana Özel Ürünler Bölümü için productCard widgeti yazıldı. İçindeki veriler statik olmakla birlikte
*      favori butonu StatefulBuilder ile bağımsız olarak durumu yönetir
* */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "Kadın",
    "Erkek",
    "Moda",
    "Saat & Aksesuar",
    "Elektronik",
    "Anne & Çocuk",
    "Ev & Mobilya",
    "Kozmetik"
  ];

  int selectedIndex = 0;

  Widget productCard(String title, String price, String link, String badge) {
    bool isFavorite = false;
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        width: 160,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      link,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    price,
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 4.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite; //buton durum değişimi
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.orange : Colors.red,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Arama Yeri Bölümü
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Marka, ürün veya kategori ara",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mail_outline_outlined,
                    size: 25,
                  ),
                  Icon(
                    color: Colors.orange,
                    size: 30,
                    Icons.circle_notifications,
                  ),
                ],
              ),
            ),

            // Kategoriler Bölümü
            Container(
              height: 70,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 15, bottom: 15),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryButtonScreen()),
                          );
                        },
                        label: Text(
                          "Kategoriler",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700),
                        ),
                        icon: Icon(
                          Icons.menu,
                          color: Colors.grey.shade700,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            side: BorderSide(
                                width: 1, color: Colors.grey.shade300)),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index - 1; // 1den başla
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: selectedIndex == index - 1
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: selectedIndex == index - 1
                                ? Colors.orange
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            categories[index - 1],
                            style: TextStyle(
                              color: selectedIndex == index - 1
                                  ? Colors.white
                                  : Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //TODO reklam kısmı slider içeriyor
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 150,
                  color: Colors.red,
                  child: Center(
                      child: Text(
                    "Reklam Slideri",
                    style: TextStyle(fontSize: 30),
                  )),
                ),
              ),
            ),

            //Hizmetlerimizi Keşfet Bölümü
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Hizmetlerimizi Keşfet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/burger.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Yemek",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/market.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Hızlı Market",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/buguneozel.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Kuponlar",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/kodlu.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Canlı Yayınlar",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/categories.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Kategoriler",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //Sana özel ürünler      TÜM ÜRÜNLER Bölümü
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sana Özel Ürünler",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Tüm Ürünler",
                      style: TextStyle(color: Colors.orange, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.grey.shade200),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  productCard(
                      "Laptop Notebook Kilitli Çanta",
                      "1349 TL",
                      "https://static.ticimax.cloud/cdn-cgi/image/width=-,quality=85/59347/uploads/urunresimleri/buyuk/laptop-sirt-cantasi-usb-sarj-girisli-f-7c334f.jpg",
                      "Hızlı Teslimat"),
                  productCard(
                      "Tasarımlı Siyah Sweatshirt",
                      "449 TL",
                      "https://static.ticimax.cloud/5334/uploads/urunresimleri/buyuk/siyah-kapusonlu-desenli-sweatshirt-602-6c085a.jpg",
                      "Hızlı Teslimat"),
                  productCard(
                      "Bisiklet Yaka Pamuklu Sweatshirt",
                      "479 TL",
                      "https://004406.a-cdn.akinoncloud.com/products/2024/02/29/196691/dab17fe6-a870-47ba-935e-f51a94b06a9b_size555x830_quality90_cropCenter.jpg",
                      "Hızlı Teslimat"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
