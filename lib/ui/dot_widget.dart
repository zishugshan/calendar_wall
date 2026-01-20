import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final bool active;
  final VoidCallback onTap;

  const DotWidget({super.key, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? Colors.white : Colors.grey.shade800,
        ),
      ),
    );
  }
}
