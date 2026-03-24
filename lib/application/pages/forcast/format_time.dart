import 'package:intl/intl.dart';

String formatTime(String time) {
  DateTime dt = DateTime.parse(time);
  return DateFormat('hh:mm a').format(dt); // 02:00 PM
}

String formatDay(String time) {
  DateTime dt = DateTime.parse(time);
  return DateFormat('EEE').format(dt); // Mon, Tue
}
