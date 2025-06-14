import 'package:flutter/material.dart';
import '../../widgets/get_started_content.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GetStartedContent(),
    );
  }
}
