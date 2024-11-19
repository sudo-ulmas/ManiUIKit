import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String readable(String locale) {
    final dateFormat = DateFormat('dd MMMM yyyy', locale);
    return dateFormat.format(this);
  }

  String readableShort(String locale) {
    final dateFormat = DateFormat('dd MMM yyyy hh:mm', locale);
    return dateFormat.format(this);
  }


  String get formatForMyId => DateFormat('dd.MM.yyyy').format(this);
  String get formatWithHypen => DateFormat('dd-MM-yyyy').format(this);
}
