import 'package:flutter/material.dart';

class ActionButtonSection extends StatelessWidget {
  final VoidCallback? onSubmitted;
  final String title;
  const ActionButtonSection(
      {super.key, required this.onSubmitted, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmitted,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
