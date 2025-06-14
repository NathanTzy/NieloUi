import 'package:flutter/material.dart';
import 'package:nielo_ui/dummy_data/product.dart';
import 'package:nielo_ui/screens/detail/detail_screen.dart';
import 'package:nielo_ui/global/favorite_data.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(product: product),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'FilsonPro',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontFamily: 'FilsonPro',
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        // Icon Heart
        Positioned(
          top: 8,
          right: 8,
          child: ValueListenableBuilder<Map<String, bool>>(
            valueListenable: favoriteStatus,
            builder: (context, value, _) {
              final isFavorite = value[product.name] ?? false;
              return GestureDetector(
                onTap: () {
                  final newMap = Map<String, bool>.from(favoriteStatus.value);
                  newMap[product.name] = !isFavorite;
                  favoriteStatus.value = newMap;
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: isFavorite ? Colors.red : Colors.grey.shade400,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
