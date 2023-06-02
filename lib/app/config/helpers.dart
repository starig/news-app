import 'package:intl/intl.dart';

stringToDatetime(String string) {
  DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

  DateTime dateTime = inputFormat.parse(string);

  DateFormat outputFormat = DateFormat("HH:mm dd.MM.yyyy");

  return outputFormat.format(dateTime);
}