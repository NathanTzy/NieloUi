import 'package:flutter/material.dart';
import 'package:nielo_ui/dummy_data/product.dart';
import 'package:nielo_ui/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 28),
                Text(
                  'Nieló',
                  style: TextStyle(
                    fontFamily: 'FilsonPro',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 28),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ProductCard(product: productList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
