import 'package:flutter/material.dart';
import 'package:nielo_ui/screens/checkout/checkout_screen.dart';
import 'package:nielo_ui/screens/home/home_screen.dart';
import 'package:nielo_ui/screens/search/search_screen.dart';

class MainWrapper extends StatefulWidget {
  final int initialIndex;

  const MainWrapper({super.key, this.initialIndex = 0});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late int _selectedIndex;

  List<String> searchHistory = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void addSearchTerm(String term) {
    if (!searchHistory.contains(term)) {
      setState(() {
        searchHistory.add(term);
      });
    }
  }

  void removeSearchTerm(String term) {
    setState(() {
      searchHistory.remove(term);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      SearchScreen(
        searchHistory: searchHistory,
        onAdd: addSearchTerm,
        onRemove: removeSearchTerm,
      ),
      const CheckoutScreen(),
      const SizedBox.shrink(),
    ];

    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 24, right: 24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              final icons = [
                Icons.home,
                Icons.search,
                Icons.shopping_cart,
                Icons.person,
              ];

              final isSelected = _selectedIndex == index;

              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      color: isSelected ? Colors.black : Colors.grey,
                      size: 24,
                    ),
                    const SizedBox(height: 6),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 3) return;
    setState(() {
      _selectedIndex = index;
    });
  }
}
