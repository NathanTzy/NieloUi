import 'package:flutter/material.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    final smallCards = [
      {'label': 'Marvel edition', 'products': '30 Products', 'image': 'assets/images/jeans.png'},
      {'label': 'Suits', 'products': '15 Products', 'image': 'assets/images/jeans.png'},
    ];

    final bigCard1 = {'label': 'Jeans', 'products': '20 Products', 'image': 'assets/images/jeans.png'};
    final bigCard2 = {'label': 'Unisex', 'products': '6 Products', 'image': 'assets/images/jeans.png'};

    const borderRadius = 24.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Column(
                      children: smallCards
                          .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildCard(
                          item,
                          width: 140,
                          height: 100,
                          borderRadius: borderRadius,
                        ),
                      ))
                          .toList(),
                    ),
                  ),
                  Positioned(
                    left: 152,
                    top: 0,
                    child: Builder(
                      builder: (context) {
                        double screenWidth = MediaQuery.of(context).size.width;
                        double bigCardWidth = screenWidth - 152 - 32;
                        return _buildCard(
                          bigCard1,
                          width: bigCardWidth,
                          height: 212,
                          borderRadius: borderRadius,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCard(
            bigCard2,
            width: double.infinity,
            height: 120,
            borderRadius: borderRadius,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      Map<String, String> item, {
        required double width,
        required double height,
        required double borderRadius,
      }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(item['image']!),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['label']!,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item['products']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
