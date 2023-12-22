import 'package:intl/intl.dart';

String formatUnixTimestamp(int unixTimestamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  var formattedDateTime = DateFormat('MMMM d, yyyy').format(dateTime);

  return formattedDateTime;
}
