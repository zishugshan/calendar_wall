import 'package:flutter/material.dart';
import '../data/day_entry.dart';
import 'dot_widget.dart';

class DotGrid extends StatelessWidget {
  final List<DayEntry> days;
  final Function(DayEntry) onTap;

  const DotGrid({super.key, required this.days, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 14,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: days.length,
      itemBuilder: (_, i) {
        return DotWidget(
          active: days[i].completed,
          onTap: () => onTap(days[i]),
        );
      },
    );
  }
}
