class DayEntry {
  final DateTime date;
  bool completed;
  String note;

  DayEntry({required this.date, this.completed = false, this.note = ''});
}
