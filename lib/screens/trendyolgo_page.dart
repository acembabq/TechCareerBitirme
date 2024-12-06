import 'package:flutter/material.dart';

/*
* Trendyol ile ilişkili olan Trendyol Go uygulamasına yönlendiren amacı sipariş olan butonların olduğu sayfa
* Yapı incelendiğinde her birinin işlevi farklı olmalı dolayısıyla her butonun farklı bir onTap fonksiyonu var.
* */

class TrendyolGoPage extends StatelessWidget {
  const TrendyolGoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Trendyol Go',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customImageContainer(
                      175,
                      250,
                      "https://cdn.dsmcdn.com/mrktng/seo/hizlimarketlanding22-4/sepet1.png",
                      () {}),
                  customImageContainer(
                    175,
                    250,
                    "https://i.ibb.co/NYSM0GB/image.png",
                    () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: customImageContainer(
                    double.infinity,
                    100,
                    "https://cdn.dsmcdn.com/mnresize/400/-/ty972/product/media/images/20230729/19/398062319/983855628/1/1_org.jpg",
                    () {}),
              ),

              // Hızlı Market Bölümü
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hızlı Market',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customImageContainer(
                        200,
                        125,
                        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/75/b3/20/75b320a6-e5bb-9763-770f-1724db596c31/cc6fafdb-3d54-433e-9861-fe314a619d40_TGO_appstore_1242x2208_03.png/392x696bb.png",
                        () {},
                      ),
                      SizedBox(width: 16),
                      customImageContainer(
                        200,
                        125,
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5rp7BdYM3GDIghV8CnxmHr95XxAeoWA7O5g&s",
                        () {},
                      ),
                      SizedBox(width: 16),
                      customImageContainer(
                        200,
                        125,
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUC3UzjktnNYJ4CZYJrAX9qE27IeXWGX_R_jvkADK7QExjWoQT2XrNRmQ-BqXsa1CqzMw&usqp=CAU",
                        () {},
                      ),
                    ],
                  ),
                ),
              ),

              // Yemek Bölümü
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Yemek',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customImageContainer(
                        200,
                        125,
                        "https://play-lh.googleusercontent.com/tiE1mC55G3x7tnkEFf5JuTAUoySUiE77ISu4ktZ1i6zay2rdhHgBGUm8-DDeTu4VciLA=w416-h235-rw",
                        () {},
                      ),
                      SizedBox(width: 16),
                      customImageContainer(
                        200,
                        125,
                        "https://cdnuploads.aa.com.tr/uploads/sirkethaberleri/Contents/2023/02/01/thumbs_b_c_f83462590bdced4bdc7fbcd476d7215c.jpg",
                        () {},
                      ),
                      SizedBox(width: 16),
                      customImageContainer(
                        200,
                        125,
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTTi7kX-1P-umLmRkA95FpmH-CYx2arBIBwA&s",
                        () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customImageContainer(
    double width,
    double height,
    String imageUrl,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
