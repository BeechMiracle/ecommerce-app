import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  const AppTile({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  final IconData iconData;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Colors.grey,
        ),
        title: Text(
          text,
        ),
        onTap: onTap,
      ),
    );
  }
}
