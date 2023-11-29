import 'package:ecommerce_app/components/button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  // add to cart function
  void addToCart(BuildContext context) {
    // show dailog for comfirmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'Add this product to your cart?',
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
              context.read<Shop>().addToCart(product);
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
    return Container(
      width: 320,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              // product name
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              // product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(
                height: 12,
              ),
            ],
          ),

          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.price.toStringAsFixed(2),
              ),
              AppButton(
                onTap: () => addToCart(context),
                color: Theme.of(context).colorScheme.secondary,
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
