import 'package:flutter/material.dart';
import 'package:nielo_ui/screens/main_wrapper.dart';

class MainWrapperCheckoutEntry extends StatelessWidget {
  const MainWrapperCheckoutEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainWrapper(initialIndex: 2); // Langsung ke Checkout tab
  }
}
