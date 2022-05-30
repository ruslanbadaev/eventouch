import 'package:intl/intl.dart';

class AppDate {
  static String getFormattedDateString(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      return DateFormat('yyyy-MM-dd kk:mm').format(dateTime);
    } catch (e) {
      return date;
    }
  }
}
