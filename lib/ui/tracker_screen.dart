import 'package:flutter/material.dart';
import '../data/day_entry.dart';
import '../storage/local_storage.dart';
import 'dot_grid.dart';
import 'day_note_sheet.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final List<DayEntry> days = [];

  @override
  void initState() {
    super.initState();
    _generateDays();
  }

  Future<void> _generateDays() async {
    final now = DateTime.now();

    for (int i = 0; i < 365; i++) {
      DateTime date = now.subtract(Duration(days: 364 - i));
      String note = await LocalStorage.loadNote(date);

      days.add(DayEntry(date: date, completed: note.isNotEmpty, note: note));
    }

    setState(() {});
  }

  void _onDotTap(DayEntry entry) async {
    bool? updated = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DayNoteSheet(entry: entry),
    );

    if (updated == true) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (days.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Text("Tue 13 Jan", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 20),
          Expanded(
            child: DotGrid(days: days, onTap: _onDotTap),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "365 days tracker",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
