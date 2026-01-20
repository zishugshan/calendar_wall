import 'package:shared_preferences/shared_preferences.dart';
import '../core/utils/date_helper.dart';

class LocalStorage {
  static Future<void> saveNote(DateTime date, String note) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(DateHelper.keyFromDate(date), note);
  }

  static Future<String> loadNote(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(DateHelper.keyFromDate(date)) ?? '';
  }
}
