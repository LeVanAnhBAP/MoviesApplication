import 'dart:core';

extension StringExtension on String? {
  String formatDuration() {
    if (this != null || this!.isNotEmpty) {
      return '';
    } else {
      Duration duration =
          Duration(minutes: int.parse(this!.substring(2, this!.length - 1)));
      String hours = (duration.inHours).toString();
      String minutes = (duration.inMinutes.remainder(60)).toString();

      String result = '';

      if (hours != '0') {
        result += '${hours}h';
      }
      if (minutes != '0') {
        if (result.isNotEmpty) {
          result += ' ';
        }
        result += '${minutes}m';
      }

      return result;
    }
  }
}
