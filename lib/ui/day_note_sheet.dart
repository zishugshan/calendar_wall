import 'package:flutter/material.dart';
import '../data/day_entry.dart';
import '../storage/local_storage.dart';

class DayNoteSheet extends StatefulWidget {
  final DayEntry entry;

  const DayNoteSheet({super.key, required this.entry});

  @override
  State<DayNoteSheet> createState() => _DayNoteSheetState();
}

class _DayNoteSheetState extends State<DayNoteSheet> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.entry.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${widget.entry.date.toLocal()}".split(' ')[0],
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: "Write your note...",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () async {
              widget.entry.note = controller.text;
              widget.entry.completed = controller.text.isNotEmpty;
              await LocalStorage.saveNote(widget.entry.date, widget.entry.note);
              Navigator.pop(context, true);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
