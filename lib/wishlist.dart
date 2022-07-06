import 'package:flutter/material.dart';
import 'package:flutter_ecom/model/products.dart';

class WishListProducts extends StatefulWidget {
  const WishListProducts({Key? key}) : super(key: key);

  @override
  State<WishListProducts> createState() => _WishListProductsState();
}

class _WishListProductsState extends State<WishListProducts> {
  List<Products> products = productsList;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Your WishList",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            cartProductsList(),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: CustomClipperDesign(),
                child: Container(
                  height: 100,
                  width: width,
                  padding: const EdgeInsets.fromLTRB(20, 35, 20, 10),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs.2600",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartProductsList() => Container(
        height: 450,
        margin: const EdgeInsets.all(10),
        // color: Colors.yellow,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ProductDetails(product: product),
                //   ),
                // );
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
                              product.count++;
                            });
                          },
                          child: const Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 117, 219, 1),
                            size: 18,
                          ),
                        ),
                        Text(
                          "${product.count}",
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              product.count--;
                            });
                          },
                          child: const Icon(
                            Icons.remove_circle,
                            color: Color.fromARGB(255, 117, 219, 1),
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
}

class CustomClipperDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(width, height);
    path.lineTo(width, height - 70);
    path.quadraticBezierTo(width / 2, 0, 0, height - 70);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
