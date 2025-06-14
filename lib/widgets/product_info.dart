import 'package:flutter/material.dart';
import 'package:nielo_ui/dummy_data/product.dart';
import 'package:nielo_ui/widgets/size_option.dart';

class ProductInfo extends StatefulWidget {
  final Product product;

  const ProductInfo({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nielo air',
                  style: TextStyle(
                    fontFamily: 'FilsonPro',
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${widget.product.price}',
                  style: const TextStyle(
                    fontFamily: 'FilsonPro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              widget.product.name,
              style: const TextStyle(
                fontFamily: 'FilsonPro',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Text(
              'Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizeOption(
                    size: 'XL',
                    isSelected: selectedSize == 'XL',
                    onTap: () {
                      setState(() {
                        selectedSize = 'XL';
                      });
                    },
                  ),
                  SizeOption(
                    size: 'L',
                    isSelected: selectedSize == 'L',
                    onTap: () {
                      setState(() {
                        selectedSize = 'L';
                      });
                    },
                  ),
                  SizeOption(
                    size: 'M',
                    isSelected: selectedSize == 'M',
                    onTap: () {
                      setState(() {
                        selectedSize = 'M';
                      });
                    },
                  ),
                  SizeOption(
                    size: 'S',
                    isSelected: selectedSize == 'S',
                    onTap: () {
                      setState(() {
                        selectedSize = 'S';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Ukuran dipilih: $selectedSize');
              },
              child: const Text('Add to cart'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
