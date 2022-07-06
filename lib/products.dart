import 'package:flutter/material.dart';
import 'package:flutter_ecom/details.dart';
import 'package:flutter_ecom/model/products.dart';

class EcommerceProducts extends StatefulWidget {
  const EcommerceProducts({Key? key}) : super(key: key);

  @override
  State<EcommerceProducts> createState() => _EcommerceProductsState();
}

class _EcommerceProductsState extends State<EcommerceProducts> {
  List<Map<String, dynamic>> iconImages = [
    {
      "image": "veg_icon.png",
      "color": Colors.green.withOpacity(0.5),
      "height": 50.0,
      "type": "vegetables"
    },
    {
      "image": "fruit_icon.png",
      "color": Colors.orange.withOpacity(0.5),
      "height": 30.0,
      "type": "fruits"
    },
  ];
  List<Products> products = productsList;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: const TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          hintText: "Search products",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: iconImages.length,
                  itemBuilder: (context, index) {
                    final iconImage = iconImages[index];
                    return Container(
                      width: 70,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: iconImage["color"],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/${iconImage["image"]}",
                            height: iconImage["height"],
                            fit: BoxFit.cover,
                          ),
                          Text(
                            iconImage["type"],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              titleLabelWidget("new arrivals", Colors.red),
              newArrivalsListView(),
              titleLabelWidget("daily needs", Colors.green.shade900),
              dailyNeedsListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dailyNeedsListView() => Container(
        height: 200,
        margin: const EdgeInsets.only(top: 10),
        // color: Colors.yellow,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(product: product),
                  ),
                );
              },
              child: Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/${product.image}",
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Rs.${product.price}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              product.productName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product.productWeight,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              product.isFavorite = !product.isFavorite;
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: product.isFavorite
                                ? Colors.red
                                : Colors.grey.shade400,
                            size: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              product.isWishlist = !product.isWishlist;
                            });
                          },
                          child: Icon(
                            Icons.add_circle,
                            color: product.isWishlist
                                ? Colors.green
                                : Colors.grey.shade400,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  Widget newArrivalsListView() => Container(
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 10),
        // color: Colors.yellow,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              width: 150,
              margin: const EdgeInsets.only(right: 10),
              color: Colors.white,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(product: product),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/${product.image}",
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Rs.${product.price}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            product.productName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product.productWeight,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 35,
                        width: 150,
                        alignment: Alignment.center,
                        color: product.color,
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      splashRadius: 0.4,
                      onPressed: () {
                        setState(() {
                          product.isFavorite = !product.isFavorite;
                        });
                      },
                      icon: const Icon(
                        Icons.favorite,
                        size: 20,
                      ),
                      color: product.isFavorite
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );

  Widget titleLabelWidget(String title, Color color) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 20,
            width: 100,
            color: color,
            alignment: Alignment.center,
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          ),
          Text(
            "see all".toUpperCase(),
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      );
}
