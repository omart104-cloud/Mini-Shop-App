import 'package:intl/intl.dart';

String formatPrice(num value) {
  final formatter = NumberFormat('#,##0', 'en_US');
  return formatter.format(value);
}

String formatPriceWithCurrency(String currency, num value) =>
    '$currency ${formatPrice(value)}';
