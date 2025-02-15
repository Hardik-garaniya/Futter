// Task 33:
// Explore and integrate the intl package to format dates and numbers in different locales.

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async
{
  await initializeDateFormatting();

  DateTime now = DateTime.now();
  String usDate = DateFormat.yMMMMd('en_US').format(now);
  String frDate = DateFormat.yMMMMd('fr_FR').format(now);
  String jpDate = DateFormat.yMMMMd('ja_JP').format(now);

  print("Current date in US format: $usDate");
  print("Current date in French format: $frDate");
  print("Current date in Japanese format: $jpDate");

  double amount = 1234567.89;
  String usCurrency = NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  String frCurrency = NumberFormat.currency(locale: 'fr_FR', symbol: '€').format(amount);
  String jpCurrency = NumberFormat.currency(locale: 'ja_JP', symbol: '¥').format(amount);

  print("Currency in US format: $usCurrency");
  print("Currency in French format: $frCurrency");
  print("Currency in Japanese format: $jpCurrency");

  String formattedNumber = NumberFormat.decimalPattern('en_US').format(amount);
  print("Formatted number in US locale: $formattedNumber");

  double percentage = 0.85;
  String formattedPercentage = NumberFormat.percentPattern('en_US').format(percentage);
  print("Percentage in US format: $formattedPercentage");
}