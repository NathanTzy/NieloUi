import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  final List<String> history;
  final void Function(String) onRemove;

  const SearchHistory({super.key, required this.history, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: history.map((term) {
        return Row(
          children: [
            Expanded(
              child: Text(term, style: const TextStyle(color: Colors.grey)),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 18),
              onPressed: () => onRemove(term),
            ),
          ],
        );
      }).toList(),
    );
  }
}
