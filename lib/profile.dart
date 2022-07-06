import 'package:flutter/material.dart';
import 'package:flutter_ecom/cart.dart';
import 'package:flutter_ecom/login.dart';
import 'package:flutter_ecom/wishlist.dart';

class ProductProfile extends StatefulWidget {
  const ProductProfile({Key? key}) : super(key: key);

  @override
  State<ProductProfile> createState() => _ProductProfileState();
}

class _ProductProfileState extends State<ProductProfile> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "You",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 40,
                    child: Text(
                      "D",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Donald Duck",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartProducts(),
                  ),
                );
              },
              leading: const Icon(
                Icons.list,
                color: Colors.orange,
              ),
              title: const Text(
                "My Orders",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WishListProducts(),
                  ),
                );
              },
              leading: const Icon(
                Icons.favorite_border,
                color: Colors.orange,
              ),
              title: const Text(
                "My Favorite",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.wallet_outlined,
                color: Colors.orange,
              ),
              title: const Text(
                "Payment Details",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.settings,
                color: Colors.orange,
              ),
              title: const Text(
                "My Account",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              leading: const Icon(
                Icons.logout,
                color: Colors.orange,
              ),
              title: const Text(
                "Logout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
