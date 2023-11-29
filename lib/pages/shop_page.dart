import 'package:ecommerce_app/components/drawer.dart';
import 'package:ecommerce_app/components/product_tile.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access the products in the shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text(
          'Shop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // goto cart page
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          // shop subtitle
          Center(
            child: Text(
              'Pick from a selected list pf premium products.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // product list
          SizedBox(
            height: 560,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              itemBuilder: (context, index) {
                // get individual product
                final product = products[index];

                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
