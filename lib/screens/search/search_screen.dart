import 'package:flutter/material.dart';
import 'package:nielo_ui/widgets/recommend_list.dart';
import 'package:nielo_ui/widgets/search_bar.dart';
import 'package:nielo_ui/widgets/search_history.dart';

class SearchScreen extends StatelessWidget {
  final List<String> searchHistory;
  final void Function(String) onAdd;
  final void Function(String) onRemove;

  const SearchScreen({
    super.key,
    required this.searchHistory,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Text(
                'Nieló',
                style: TextStyle(
                  fontFamily: 'FilsonPro',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SearchBarWidget(onSubmitted: onAdd),
            const SizedBox(height: 10),
            SearchHistory(history: searchHistory, onRemove: onRemove),
            const SizedBox(height: 20),
            const Text(
              "Recommend",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const RecommendList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
