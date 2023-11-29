import 'package:ecommerce_app/components/list_tile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // shop tile
              AppTile(
                iconData: Icons.store,
                text: 'Shop',
                onTap: () => Navigator.pop(context),
              ),

              // cart tile
              AppTile(
                iconData: Icons.shopping_cart,
                text: 'Cart',
                onTap: () {
                  // pop drawer
                  Navigator.pop(context);

                  // goto cart
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // exit tile
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: AppTile(
              iconData: Icons.logout,
              text: 'Exit',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
