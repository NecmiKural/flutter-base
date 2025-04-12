import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

/// An extension on the [DateTime] class
///
/// Contains utility methods for the [DateTime] class.
///
/// **Methods**:
/// - [getAge]
/// - [formatDate]
extension DateTimeExtensions on DateTime {
  /// Calculates the difference between the current date and the date of birth.
  /// and returns the age in years.
  int getAge() {
    return DateTime.now().difference(this).inDays ~/ 365;
  }

  /// Adds the given number of months to the current date.
  ///
  /// Returns a new [DateTime] object with the added months.
  ///
  /// ? The reason for this method is that the [DateTime] class does not have a
  ///
  ///? method to add months.
  DateTime addMonth(int monthsToAdd) {
    int month = this.month;
    int year = this.year;

    month += monthsToAdd;

    if (month > 12) {
      month -= 12;
      year++;
    }

    return DateTime(year, month, day);
  }

  /// Calculates the duration of the membership.
  ///
  /// Returns a [Duration] object.
  Duration getMembershipDuration() {
    final now = DateTime.now()..difference(this);

    return now.difference(this);
  }

  /// DateTime formatter for the application.
  ///
  /// Formats the date in the format " dd MMM yyyy".
  ///
  /// Locale is set to the current locale of the application.
  ///
  /// It requires a [BuildContext] to get the current locale.
  ///
  ///  **Example Output**: `01 Jan 2022`.
  String formatDate(BuildContext context) {
    return DateFormat.yMMMd(
      context.locale.toString(),
    ).format(this);
  }
}
