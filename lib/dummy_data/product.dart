class Product {
  final String name;
  final String imageUrl;
  final String price;
  final String description;

  Product({required this.name, required this.imageUrl, required this.price, required this.description});
}

final List<Product> productList = [
  Product(
    name: 'WB Varsity 1989 Limited Eds',
    imageUrl: 'assets/images/image1.png',
    price: '130',
    description: 'Limited edition varsity jacket from 1989 with a classic fit.',
  ),
  Product(
    name: 'Miracle air jacks',
    imageUrl: 'assets/images/image2.png',
    price: '105',
    description: 'Lightweight and breathable jacket perfect for layering.',
  ),
  Product(
    name: 'Bone V pant',
    imageUrl: 'assets/images/image3.png',
    price: '89',
    description: 'Comfortable pants with a modern fit, suitable for casual outings.',
  ),
  Product(
    name: 'Van to Vail 1908™',
    imageUrl: 'assets/images/image4.png',
    price: '115',
    description: 'Stylish and durable winter coat designed for extreme weather.',
  ),
];