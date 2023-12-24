import 'package:flutter/material.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
