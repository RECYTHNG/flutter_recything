import 'package:intl/intl.dart';

class DateTimeUtils {
  final DateTime dateTime;
  DateTimeUtils({
    required String dateTimeStringInput,
  }) : dateTime = DateTime.parse(dateTimeStringInput);

  String convertDate() {
    return DateFormat('d MMMM y', 'ID_id').format(dateTime);
  }

  String convertTime() {
    return DateFormat('Hm', 'ID_id').format(dateTime);
  }
}