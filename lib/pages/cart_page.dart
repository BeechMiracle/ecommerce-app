import 'package:ecommerce_app/components/button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart function
  void removeFromCart(
    BuildContext context,
    Product item,
  ) {
    // show dailog for comfirmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'Remove this item from your cart?',
        ),
        actions: [
          // cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // confirm button
          MaterialButton(
            onPressed: () {
              // pop dialog
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeFromCart(item);
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart list
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Your cart is empty...'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual item
                      final item = cart[index];

                      // return item
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toStringAsFixed(2),
                        ),
                        trailing: IconButton(
                          onPressed: () => removeFromCart(
                            context,
                            item,
                          ),
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: AppButton(
                onTap: () {},
                child: const Text(
                  'PAY NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
