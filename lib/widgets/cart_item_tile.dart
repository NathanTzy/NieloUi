import 'package:flutter/material.dart';
import 'package:nielo_ui/global/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const Icon(Icons.radio_button_checked, color: Colors.black),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/image1.png',
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.add, color: Colors.grey)),
              const Text('01', style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.remove, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
