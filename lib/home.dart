import 'package:flutter/material.dart';
import 'package:flutter_ecom/cart.dart';
import 'package:flutter_ecom/products.dart';
import 'package:flutter_ecom/profile.dart';
import 'package:flutter_ecom/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> widgetsOptions = [
    EcommerceProducts(),
    CartProducts(),
    WishListProducts(),
    ProductProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "You",
          ),
        ],
      ),
      body: widgetsOptions.elementAt(_selectedIndex),
    );
  }
}
