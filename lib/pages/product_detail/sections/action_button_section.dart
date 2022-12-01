import 'package:flutter/material.dart';
import 'package:products_crud/preferences/preferences.dart';

class ActionButtonSection extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const ActionButtonSection(
      {super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onEdit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Edit Product',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          Spacing.h16,
          Expanded(
            child: OutlinedButton(
              onPressed: onDelete,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.red, width: 2),
                ),
                foregroundColor: Colors.red,
              ),
              child: const Text(
                'Delete Product',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
