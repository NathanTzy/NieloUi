import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function(String) onSubmitted;

  const SearchBarWidget({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return TextField(
      controller: controller,
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          onSubmitted(value.trim());
          controller.clear();
        }
      },
      decoration: InputDecoration(
        hintText: 'What to wear today?',
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
